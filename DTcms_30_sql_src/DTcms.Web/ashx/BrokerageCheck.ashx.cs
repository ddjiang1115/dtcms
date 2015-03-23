using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Web.SessionState;
using DTcms.Common;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// BrokerageCheck 的摘要说明
    /// </summary>
    public class BrokerageCheck : IHttpHandler,IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string type = context.Request.QueryString["type"];
            DTcms.BLL.Promotion bll = new DTcms.BLL.Promotion();
            if (type == "select")
            {

                int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                try
                {
                    Model.manager adminmodel = context.Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
                    int recordCount = 0;
                    DataSet ds = bll.GetListCheck(pageSize, pageIndex, "b.state in(5,4) and m.id="+adminmodel.id, "PromotionID", out recordCount);
                    DataTable dt = ds.Tables[0];
                    StringBuilder sb = new StringBuilder();
                    sb.Append("{");
                    sb.Append("\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":[");
                    foreach (DataRow dr in dt.Rows)
                    {
                        sb.Append("{\"user_name\":" + "\"" + dr["user_name"] + "\",\"LogisticsCode\":" + "\"" + dr["LogisticsCode"] + "\"" + ",\"BrokerageRatio\":" + "\"" + dr["BrokerageRatio"] + "\"" + ",\"CreateTime\":" + "\"" + dr["CreateTime"] + "\"" + ",\"state\":" + "\"" + Convert.ToInt32(dr["state"]).ToEnumDescriptionString(typeof(EnumList.StateList)) + "\",\"PromotionID\":" + "\"" + dr["PromotionID"] + "\"},");
                    }
                    string ht = sb.ToString().Substring(0, sb.Length - 1);
                    ht = ht + "]}";
                    context.Response.Write(ht);
                }
                catch (Exception)
                { }
            }
            if (type == "up")
            {
                    bll.UpdateState(context.Request.QueryString["ids"],5);
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