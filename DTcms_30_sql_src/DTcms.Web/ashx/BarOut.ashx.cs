using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// BarOut 的摘要说明
    /// </summary>
    public class BarOut : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            
            //Common.ComExcelHelper ch = new Common.ComExcelHelper();
            //DataTable dt = new DataTable();
            //dt = ch.ReadExcel2DataTable("D:/DTcms_30_sql_src/DTcms.Web/DownLoad/3dd20da4-d413-46a5-9ff0-ed87e73ba6a4.xls","nihao","箱码,物流码,积分码,客户");
            //dt.Rows.RemoveAt(0);
            //string json = JsonConvert.SerializeObject(dt, new DataTableConverter());
            //context.Response.Write("{\"total\":" + "\"" + (dt.Rows.Count-1) + "\"" + ",\"rows\":" + json + "}");
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