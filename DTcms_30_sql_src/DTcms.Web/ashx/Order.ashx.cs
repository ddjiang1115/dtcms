using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using DTcms.Common;
using System.Web.SessionState;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// Order 的摘要说明
    /// </summary>
    public class Order : IHttpHandler, IRequiresSessionState 
    {
        BLL.orders bll = new BLL.orders();
        DataSet ds = null;
        DataTable dt = null;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string action = context.Request.QueryString["action"];
            string result = "";
            switch (action)
            { 
                case "select":
                //    int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                //int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                //    DTcms.Web.UI.BasePage bp = new UI.BasePage();
                //    int recordCount = 0;
                //    dt = bp.get_order_list(pageSize, pageIndex, "", out recordCount);
                //    result = JsonConvert.SerializeObject(dt, new DataTableConverter());
                //    result = "{\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":" + result + "}";
                //    context.Response.Write(result);
                //    break;
                    int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                try
                {
                    int recordCount = 0;
                    Model.users adminmodel = context.Session[DTKeys.SESSION_USER_INFO] as Model.users;
                    ds = bll.GetList(pageSize, pageIndex, "user_id=" + adminmodel.id + " and status<4", "order_no", out recordCount);
                    dt = ds.Tables[0];
                    IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                    timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                    result = JsonConvert.SerializeObject(dt, new DataTableConverter(),timeFormat);
                    context.Response.Write("{\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":" + result + "}");
                }
                catch (Exception)
                {
                
                }
                break;
                case "select2":
                    pageIndex = int.Parse(context.Request.Form["page"].ToString());
                 pageSize = int.Parse(context.Request.Form["rows"].ToString());
                try
                {
                    int recordCount = 0;
                    Model.users adminmodel = context.Session[DTKeys.SESSION_USER_INFO] as Model.users;
                    ds = bll.GetList(pageSize, pageIndex, "user_id=" + adminmodel.id + " and status=4", "order_no", out recordCount);
                    dt = ds.Tables[0];
                    IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                    timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                    result = JsonConvert.SerializeObject(dt, new DataTableConverter(),timeFormat);
                    context.Response.Write("{\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":" + result + "}");
                }
                catch (Exception)
                {
                
                }
                break;

            }
        }
        //public DataTable GetList(int page_size, int page_index, string strwhere, out int totalcount)
        //{
        //    DTcms.Web.UI.BasePage bp = new UI.BasePage();

        //    dt = bp.get_order_list(page_size, page_index, strwhere, out totalcount);
        //    return dt;
        //}
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}