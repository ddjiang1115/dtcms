using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DTcms.Web.ashx
{
    /// <summary>
    /// AdminVerification 的摘要说明
    /// </summary>
    public class AdminVerification : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.manager mBll = new BLL.manager();
            string action = context.Request.QueryString["action"];
            switch (action)
            {
                case "adminusername":
                    if (mBll.Exists(context.Request.QueryString["username"]))
                    {
                        context.Response.Write("{\"info\":\"该姓名已存在！\",\"status\":\"n\"}");
                    }
                    else
                    {
                        context.Response.Write("{\"info\":\"验证通过！\",\"status\":\"y\"}");
                    }
                    break;
                case "mobile":
                    if (mBll.ExistsMobile(context.Request.Form["param"]))
                    {
                        context.Response.Write("{\"info\":\"该手机已存在！\",\"status\":\"n\"}");
                    }
                    else
                    {
                        context.Response.Write("{\"info\":\"验证通过！\",\"status\":\"y\"}");
                    }
                    break;
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