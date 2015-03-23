using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Web;
using System.Data;
using System.Text;
using DTcms.Common;
using System.Reflection;
using System.Collections.Specialized;
using System.Web.SessionState;

namespace DTcms.Web.ashx
{
    /// <summary>
    /// AlipayCheck 的摘要说明
    /// </summary>
    public class AlipayCheck : IHttpHandler,IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string type = context.Request.QueryString["type"];
            DTcms.BLL.Promotion bll = new DTcms.BLL.Promotion();
            //Common.EnumHelper.ToEnumDescriptionString(1,typeof(string));

            if (type == "select")
            {
                int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                try
                {
                    int recordCount = 0;
                    Model.manager adminmodel = context.Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
                    DataSet ds = bll.GetListCheck(pageSize, pageIndex, "b.state in(5,6) and m.id="+adminmodel.id, "PromotionID", out recordCount);
                    DataTable dt = ds.Tables[0];
                    StringBuilder sb = new StringBuilder();
                    sb.Append("{");
                    sb.Append("\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":[");
                    foreach (DataRow dr in dt.Rows)
                    {
                        sb.Append("{\"user_name\":" + "\"" + dr["user_name"] + "\",\"LogisticsCode\":" + "\"" + dr["LogisticsCode"] + "\"" + ",\"BrokerageRatio\":" + "\"" + dr["BrokerageRatio"] + "\"" + ",\"CreateTime\":" + "\"" + dr["CreateTime"] + "\"" + ",\"state\":" + "\"" +Convert.ToInt32(dr["state"]).ToEnumDescriptionString(typeof(EnumList.StateList)) + "\",\"PromotionID\":" + "\"" + dr["PromotionID"] + "\"},");
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
                bll.UpdateState(context.Request.QueryString["ids"], 6);
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