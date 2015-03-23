using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using DTcms.Common;
using System.Web.SessionState;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.IO;
using System.Text;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// Verification 的摘要说明
    /// </summary>
    public class Verification : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            
            context.Response.ContentType = "text/plain";
            BLL.users userBll = new BLL.users();
            BLL.manager mBll = new BLL.manager();
            Model.users user = null;
            string action=context.Request.QueryString["action"];
            DataTable dt = null;
            BLL.BarCode bllBar = null;
            switch (action)
            { 
                case "username":
                    if (userBll.Exists(context.Request.QueryString["username"]))
                    {
                        context.Response.Write("false");
                    }
                    else
                    {
                        context.Response.Write("true");
                    }
                    break;
                case "adminusername":
                    if (mBll.Exists(context.Request.QueryString["username"]))
                    {
                        context.Response.Write("false");
                    }
                    else
                    {
                        context.Response.Write("true");
                    }
                    break;
                case "tel":
                    if (userBll.ExistsMobile(context.Request.Form["param"]))
                    {
                        context.Response.Write("{\"info\":\"该手机已存在！\",\"status\":\"n\"}");
                    }
                    else
                    {
                        context.Response.Write("{\"info\":\"" + context.Request.Form["param"] + "为新用户，成功累计积分后系统自动注册为正式会员，默认密码为123456\",\"status\":\"y\"}");
                    }
                    break;
                case "tel2":
                    if (userBll.ExistsMobile(context.Request.QueryString["tel"]))
                    {
                        context.Response.Write("false");
                    }
                    else
                    {
                        context.Response.Write("true");
                    }
                    break;
                case "IntegralCode":
                    bllBar = new BLL.BarCode();
                    DataSet ds = null;
                    ds = bllBar.QueryIntegralCode(context.Request.Form["param"]);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && Convert.ToInt32(ds.Tables[0].Rows[0]["state"]) < 4)
                    {
                        context.Response.Write("{\"info\":\"验证通过！\",\"status\":\"y\"}");
                    }
                    else
                    {
                        context.Response.Write("{\"info\":\"该积分码不存在或已兑换！\",\"status\":\"n\"}");
                    }
                    break;
                case "UserIntegralCode":
                    bllBar = new BLL.BarCode();
                    ds = bllBar.QueryIntegralCode(context.Request.QueryString["IntegralCode"]);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && Convert.ToInt32(ds.Tables[0].Rows[0]["state"]) < 4)
                    {
                        context.Response.Write("true");
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                    break;
                case "Username":
                    BLL.users bll = new BLL.users();
                    //查询数据库
                    if (!bll.Exists(context.Request.QueryString["Username"]))
                    {
                        context.Response.Write("true");
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                    break;
                case "Exit":
                    context.Session[DTKeys.SESSION_USER_INFO] = null;
                    break;
                case "SearchLogisticsCode":
                    bllBar = new BLL.BarCode();
                    dt=bllBar.GetBarCodeByLogisticsCode(context.Request.QueryString["LogisticsCode"]);
                    if (dt != null)
                    {
                        IsoDateTimeConverter timeFormat2 = new IsoDateTimeConverter();
                        timeFormat2.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                        context.Response.Write(JsonConvert.SerializeObject(dt,timeFormat2));
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                    break;
                case "SearchIntegralCode":
                    bllBar = new BLL.BarCode();
                    dt = bllBar.GetBarCodeByIntegralCode(context.Request.QueryString["IntegralCode"]);
                    
                    if (dt != null)
                    {
                        IsoDateTimeConverter timeFormat2 = new IsoDateTimeConverter();
                        timeFormat2.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                        context.Response.Write(JsonConvert.SerializeObject(dt, timeFormat2));
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                    break;
                case "State":
                    context.Response.Write(Convert.ToInt32(context.Request.QueryString["State"]).ToEnumDescriptionString(typeof(EnumList.StateList)));
                    break;
                case "OrderState":
                    context.Response.Write(Convert.ToInt32(context.Request.QueryString["State"]).ToEnumDescriptionString(typeof(EnumList.OrderState)));
                    break;
                    //更换头像之后替换用户信息session
                case "Avatar":
                    user = context.Session[DTKeys.SESSION_USER_INFO] as Model.users;
                    user = userBll.GetModel(user.user_name);
                    context.Session[DTKeys.SESSION_USER_INFO] = user;
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