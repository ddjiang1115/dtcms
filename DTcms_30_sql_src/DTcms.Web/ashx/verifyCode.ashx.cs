using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using DTcms.Common;

namespace DTcms.Web.ashx
{
    /// <summary>
    /// verifyCode 的摘要说明
    /// </summary>
    public class verifyCode : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string verifyCode=context.Request.Form["name"];
            if (context.Session[DTKeys.SESSION_CODE] != null && context.Session[DTKeys.SESSION_CODE].ToString().ToLower() == verifyCode.ToLower())
            {
                context.Response.Write("true");
            }
            else
            {
                context.Response.Write("false");
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