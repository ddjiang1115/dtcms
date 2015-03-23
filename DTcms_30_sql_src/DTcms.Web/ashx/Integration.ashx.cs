using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using DTcms.Common;
using System.Web.SessionState;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// Integration 的摘要说明
    /// </summary>
    public class Integration : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string type = context.Request.QueryString["type"];
            Model.users model =null;
            BLL.users bll_users=new BLL.users();
            switch (type)
            { 
                case "select":
                    break;
                case "exchange":
                    BLL.users modelbll = new BLL.users();
                    BLL.BarCode bllBar = new BLL.BarCode();
                    DataSet ds = null;
                    ds = bllBar.QueryIntegralCode(context.Request.QueryString["IntegralCode"]);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToInt32(ds.Tables[0].Rows[0]["state"]) < 4)
                        {
                            string uip = string.Empty;
                            if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
                            {
                                uip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
                            }
                            else
                            {
                                uip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                            }
                            model = context.Session[DTKeys.SESSION_USER_INFO] as Model.users;
                            if (bllBar.UserChange(Convert.ToInt32(ds.Tables[0].Rows[0]["IntegralRatio"]), model.user_name, context.Request.QueryString["IntegralCode"], uip))
                            {
                                context.Response.Write("true");
                            }
                            else
                            {
                                context.Response.Write("false");
                            }
                        }
                        else
                            {
                                context.Response.Write("false");
                        }
                    }
                        else
                        {
                            context.Response.Write("false");
                        }
                break;
                case "exchangeall":
                //string ip = string.Empty;
                //if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
                //{
                //    ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
                //}
                //else
                //{
                //    ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                //}

            model=new Model.users();
            model.group_id = 1;
            model.status = 0;
            model.user_name = context.Request.QueryString["tel"];
            model.salt = Utils.GetCheckCode(6);
            //以随机生成的6位字符串做为密钥加密
            model.password = DESEncrypt.Encrypt("123456", model.salt);
            model.reg_time = DateTime.Now;
            model.reg_ip = DTRequest.GetIP();
            model.telphone = context.Request.QueryString["tel"];
                    string codes=context.Request.QueryString["codes"];
                    List<string> list=new List<string>();
                    var codes_list=codes.Split(',');
                    for(int i=1;i<codes_list.Length;i++)
                    {
                        if(!list.Contains(codes_list[i]))
                        {
                            list.Add(codes_list[i]);
                        }
                    }

                    if (bll_users.Add(model, 1, list))
                {
                    context.Response.Write("true");
                }
                else
                {
                    context.Response.Write("false");
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