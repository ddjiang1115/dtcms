using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.Data;
using System.Text;
using System.Web.SessionState;
using DTcms.Common;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// IntegralExchange 的摘要说明
    /// </summary>
    public class IntegralExchange : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string type = context.Request.QueryString["type"];
            DTcms.BLL.IntegralExchange bll = new DTcms.BLL.IntegralExchange();
            if (type == "select")
            {
                Model.users model = context.Session[DTKeys.SESSION_USER_INFO] as Model.users;
                string id = context.Request.QueryString["page"];

                int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                try
                {
                    int recordCount = 0;
                    DataSet ds = bll.GetList(pageSize, pageIndex, " u.user_name='" + model.user_name+"'", "IntegralExchangeID", out recordCount);
                    DataTable dt = ds.Tables[0];
                    StringBuilder sb = new StringBuilder();
                    sb.Append("{");
                    sb.Append("\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":[");
                    foreach (DataRow dr in dt.Rows)
                    {
                        sb.Append("{\"IntegralExchangeid\":" + "\"" + dr["IntegralExchangeid"] + "\",\"user_name\":" + "\"" + dr["user_name"] + "\"" + ",\"IntegralCode\":" + "\"" + dr["IntegralCode"] + "\"" + ",\"ip\":" + "\"" + dr["ip"] + "\"" + ",\"IntegralRatio\":" + "\"" + dr["IntegralRatio"] + "\"" + ",\"CreateTime\":" + "\"" + dr["CreateTime"] + "\"},");
                    }
                    string ht = sb.ToString().Substring(0, sb.Length - 1);
                    ht = ht + "]}";
                    context.Response.Write(ht);
                }
                catch (Exception)
                { }
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