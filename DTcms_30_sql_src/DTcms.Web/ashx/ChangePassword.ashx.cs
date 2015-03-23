using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DTcms.Common;
using System.Web.SessionState;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// ChangePassword 的摘要说明
    /// </summary>
    public class ChangePassword : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.users bll = new BLL.users();
            string oldpassword = context.Request.Form["oldpass"];
            string newpassword = context.Request.Form["newpass"];
            Model.users user=null;
            if (context.Session[DTKeys.SESSION_USER_INFO] != null)
            {
                user = context.Session[DTKeys.SESSION_USER_INFO] as Model.users;
                user = bll.GetModel(user.user_name, oldpassword, 0, 0, true);
                if (user != null)
                {
                    user.salt = Utils.GetCheckCode(6);
                    user.password = DESEncrypt.Encrypt(newpassword, user.salt);
                    if (bll.Update(user))
                    {
                        context.Response.Write("1");
                    }
                    else
                    {
                        context.Response.Write("2");
                    }
                }
                else
                {
                    context.Response.Write("0");
                }
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