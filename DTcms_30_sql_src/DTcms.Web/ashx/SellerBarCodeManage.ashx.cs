using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DTcms.Model;
using DTcms.BLL;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Data;
using System.Web.SessionState;
using DTcms.Common;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// SellerBarCodeManage 的摘要说明
    /// </summary>
    public class SellerBarCodeManage : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            List<Model.Promotion> list = new List<Model.Promotion>();
            string type = context.Request.QueryString["type"];
            BLL.Promotion bll = new BLL.Promotion();
            BLL.BarCode bb = new BLL.BarCode();
            switch (type)
            {
                case "one":

                    if (context.Request.QueryString["code"] == null || context.Request.QueryString["code"] == "undefined" || context.Request.QueryString["code"] == "")
                    {
                        if (context.Cache["key"] != null)
                        {
                            list = (List<Model.Promotion>)context.Cache["key"];
                            IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                            timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                            context.Response.Write(JsonConvert.SerializeObject(list));
                        }
                    }
                    else
                    {
                        Model.manager adminmodel = context.Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
                        Model.Promotion model = new Model.Promotion();
                        //model.ClientID = 0;
                        model.UniqueID = Guid.NewGuid();
                        model.LogisticsCode = context.Request.QueryString["code"];
                        model.Operator = adminmodel.id;
                        model.State =3;
                        model.BrokerageRatio = 0;
                        model.CreateTime = Convert.ToDateTime(DateTime.Now);
                        model.Remark = string.Empty;

                        if (context.Cache["key"] == null)
                        {
                            list.Add(model);
                            context.Cache["key"] = list;
                        }
                        else
                        {

                            list = (List<Model.Promotion>)context.Cache["key"];
                            list.Add(model);
                        }

                        try
                        {
                            //if (bb.ExistsOut(context.Request.QueryString["code"]))
                            //{
                            
                            if (bll.Add(model, true))
                            {
                                IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                                timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                                context.Response.Write(JsonConvert.SerializeObject(list,timeFormat));
                            }
                            //}
                        }
                        catch (Exception)
                        {

                        }
                        
                    }
                    break;
                case "two":
                    Common.ComExcelHelper ch = new Common.ComExcelHelper();
                    DataTable dt = new DataTable();
                    dt = ch.ReadExcel2DataTable(context.Server.MapPath("/DownLoad/") + context.Request.QueryString["filename"], "nihao", "物流码");
                    dt.Rows.RemoveAt(0);
                    dt.Columns.Add("UniqueID", typeof(Guid));
                    //dt.Columns.Add("ClientID", typeof(Int32));
                    dt.Columns.Add("Operator", typeof(Int32));
                    dt.Columns.Add("CreateTime", typeof(DateTime));
                    dt.Columns.Add("State", typeof(Int32));
                    for (int i = 0; i < dt.Rows.Count;i++ )
                    {
                        dt.Rows[i][1] = Guid.NewGuid();
                        dt.Rows[i][2] = 1;
                        dt.Rows[i][3] = DateTime.Now;
                        dt.Rows[i][4] = 3;
                        if (dt.Rows[i][0] == null||dt.Rows[i][0].ToString()=="")
                        {
                            dt.Rows.RemoveAt(i);
                        }
                        
                    }
                    Dictionary<string,string> dic=new Dictionary<string,string>();
                    dic.Add("UniqueID", "UniqueID");
                    //dic.Add("ClientID", "ClientID");
                    dic.Add("物流码", "LogisticsCode");
                    dic.Add("Operator", "Operator");
                    dic.Add("CreateTime", "CreateTime");
                    dic.Add("State", "State");
                    string json = "";
                    try
                    {
                        bll.Add(dt, "TempPromotion", dic);
                    }
                    catch (Exception)
                    {}
                    try
                    {
                        bll.Add(dt, "Promotion", dic);
                        IsoDateTimeConverter timeFormat2 = new IsoDateTimeConverter();
                        int total = dt.Rows.Count;
                        timeFormat2.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                        dt = GetPagedTable(dt, Convert.ToInt32(context.Request.Form["page"]), Convert.ToInt32(context.Request.Form["rows"]));
                        json = JsonConvert.SerializeObject(dt, new DataTableConverter(), timeFormat2);
                        json = "{\"total\":" + "\"" + total + "\"" + ",\"rows\":" + json + "}";
                    }
                    catch (Exception)
                    {
                        json = "{\"total\":" + "\"0\"" + ",\"rows\":[]}";
                    }
                    finally
                    {
                        context.Response.Write(json);
                    }
                    break;
                case "Three":
                    try
                    {
                        if (bb.ExistsOut(context.Request.QueryString["code"]))
                        {
                            context.Response.Write("true");
                        }
                        else
                        {
                            context.Response.Write("false");
                        }
                    }
                    catch (Exception)
                    {

                    }
                    break;
            }
        }
        private DataTable GetPagedTable(DataTable dt, int PageIndex, int PageSize)
        {
            if (PageIndex == 0)
                return dt;
            DataTable newdt = dt.Copy();
            newdt.Clear();
            int rowbegin = (PageIndex - 1) * PageSize;
            int rowend = PageIndex * PageSize;
            if (rowbegin >= dt.Rows.Count)
            { return newdt; }
            if (rowend > dt.Rows.Count)
            { rowend = dt.Rows.Count; }
            for (int i = rowbegin; i <= rowend - 1; i++)
            {
                DataRow newdr = newdt.NewRow();
                DataRow dr = dt.Rows[i];
                foreach (DataColumn column in dt.Columns)
                    newdr[column.ColumnName] = dr[column.ColumnName];
                newdt.Rows.Add(newdr);
            }
            return newdt;
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}