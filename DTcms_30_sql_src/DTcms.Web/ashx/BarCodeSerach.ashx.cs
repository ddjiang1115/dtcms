using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

namespace DTcms.Web.ashx
{
    /// <summary>
    /// BarCodeSerach 的摘要说明
    /// </summary>
    public class BarCodeSerach : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string type = context.Request.QueryString["type"];
            DTcms.BLL.BarCode bll = new DTcms.BLL.BarCode();
            if (type == "select")
            {
                //string GoodCategoryName= string.Empty;
                string Batch = string.Empty;
                string RetrospectCode = string.Empty;
                //string ClientName = string.Empty;
                string BoxCode = string.Empty;
                string LogisticsCode = string.Empty;
                string IntegralCode = string.Empty;
                string OTimeFrom = string.Empty;
                string OTimeTo = string.Empty;
                string PTimeFrom = string.Empty;
                string PTimeTo = string.Empty;
                string ITimeFrom = string.Empty;
                string ITimeTo = string.Empty;
                int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                string strWhere = string.Empty;
                if (null != context.Request.Form["Batch"] && "" != context.Request.Form["Batch"])
                {
                    Batch = context.Request.Form["Batch"].ToString();
                    strWhere += string.Format("Batch={0} and ", Batch);
                }
                if (null != context.Request.Form["RetrospectCode"] && "" != context.Request.Form["RetrospectCode"])
                {
                    RetrospectCode = context.Request.Form["RetrospectCode"].ToString();
                    strWhere += string.Format("RetrospectCode={0} and ", RetrospectCode);
                }
                if (null != context.Request.Form["BoxCode"] && "" != context.Request.Form["BoxCode"])
                {
                    BoxCode = context.Request.Form["BoxCode"].ToString();
                    strWhere += string.Format("b.BoxCode={0} and ", BoxCode);
                }
                if (null != context.Request.Form["LogisticsCode"] && "" != context.Request.Form["LogisticsCode"])
                {
                    LogisticsCode = context.Request.Form["LogisticsCode"].ToString();
                    strWhere += string.Format("b.LogisticsCode={0} and ", LogisticsCode);
                }
                if (null != context.Request.Form["IntegralCode"] && "" != context.Request.Form["IntegralCode"])
                {
                    IntegralCode = context.Request.Form["IntegralCode"].ToString();
                    strWhere += string.Format("b.IntegralCode={0} and ", IntegralCode);
                }
                if (null != context.Request.Form["OTimeFrom"] && "" != context.Request.Form["OTimeFrom"])
                {
                    OTimeFrom = context.Request.Form["OTimeFrom"].ToString();
                    strWhere += string.Format("o.CreateTime>='{0}' and ", OTimeFrom);
                }
                if (null != context.Request.Form["OTimeTo"] && "" != context.Request.Form["OTimeTo"])
                {
                    OTimeTo = context.Request.Form["OTimeTo"].ToString();
                    strWhere += string.Format("o.CreateTime<='{0}' and ", OTimeTo);
                }
                if (null != context.Request.Form["PTimeFrom"] && "" != context.Request.Form["PTimeFrom"])
                {
                    PTimeFrom = context.Request.Form["PTimeFrom"].ToString();
                    strWhere += string.Format("p.CreateTime>='{0}' and ", PTimeFrom);
                }
                if (null != context.Request.Form["PTimeTo"] && "" != context.Request.Form["PTimeTo"])
                {
                    PTimeTo = context.Request.Form["PTimeTo"].ToString();
                    strWhere += string.Format("p.CreateTime<='{0}' and ", PTimeTo);
                }
                if (null != context.Request.Form["ITimeFrom"] && "" != context.Request.Form["ITimeFrom"])
                {
                    OTimeFrom = context.Request.Form["ITimeFrom"].ToString();
                    strWhere += string.Format("i.CreateTime>='{0}' and ", OTimeFrom);
                }
                if (null != context.Request.Form["ITimeTo"] && "" != context.Request.Form["ITimeTo"])
                {
                    ITimeTo = context.Request.Form["iTimeTo"].ToString();
                    strWhere += string.Format("i.CreateTime<='{0}' and ", ITimeTo);
                }
                if (strWhere == "")
                {
                    context.Response.Write("{\"total\":" + "\"0\"" + ",\"rows\":[]}");
                }
                else
                {
                    int startindex = strWhere.LastIndexOf("and");
                    if (startindex >= 0)
                    {
                        strWhere = strWhere.Remove(startindex);//删除多余的and关键字  
                    }
                    try
                    {
                        int recordCount = 0;
                        DataSet ds = bll.GetList(pageSize, pageIndex, strWhere, "BarCodeID", out recordCount);
                        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                        {
                            DataTable dt = ds.Tables[0];
                            StringBuilder sb = new StringBuilder();
                            sb.Append("{");
                            sb.Append("\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":[");
                            foreach (DataRow dr in dt.Rows)
                            {
                                sb.Append("{\"BoxCode\":" + "\"" + dr["BoxCode"] + "\",\"LogisticsCode\":" + "\"" + dr["LogisticsCode"] + "\"" + ",\"IntegralCode\":" + "\"" + dr["IntegralCode"] + "\"" + ",\"oCreateTime\":" + "\"" + dr["oCreateTime"] + "\"" + ",\"pCreateTime\":" + "\"" + dr["pCreateTime"] + "\"" + ",\"iCreateTime\":" + "\"" + dr["iCreateTime"] + "\"},");
                            }
                            string ht = sb.ToString().Substring(0, sb.Length - 1);
                            ht = ht + "]}";
                            context.Response.Write(ht);
                        }
                        else
                        {
                            context.Response.Write("{\"total\":" + "\"0\"" + ",\"rows\":[]}");
                        }
                    }
                    catch (Exception)
                    { }
                }
            }
            //if (type == "del")
            //{
            //    bll.Update(context.Request.QueryString["ids"], 2);
            //}
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