using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// BarCodeCreateList 的摘要说明
    /// </summary>
    public class BarCodeCreateList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            string type = context.Request.QueryString["type"];
            DTcms.BLL.BarCodeCreateRecord bll = new DTcms.BLL.BarCodeCreateRecord();
            if (type == "select")
            {                
                int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                string json = "";
                try
                {
                    int recordCount = 0;
                    DataSet ds = bll.GetList(pageSize, pageIndex, "", "BarCodeCreateRecordID", out recordCount);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                        timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                        json = JsonConvert.SerializeObject(ds.Tables[0], new DataTableConverter(), timeFormat);
                        context.Response.Write("{\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":" + json + "}");
                    }
                    else
                    {
                        context.Response.Write("{\"total\":" + "\"0\"" + ",\"rows\":[]}");
                    }
                }
                catch (Exception)
                { }
            }
            if (type == "del")
            {
                bll.Delete(context.Request.QueryString["ids"]);
            }
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