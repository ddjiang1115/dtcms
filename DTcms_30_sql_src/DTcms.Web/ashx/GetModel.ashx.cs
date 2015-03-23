using System;
using System.Collections.Generic;
using System.Web;
using Newtonsoft.Json;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// GetModel 的摘要说明
    /// </summary>
    public class GetModel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string id=context.Request.QueryString["id"];
            Model.GoodCategory model = null;
            BLL.GoodCategory bll = new BLL.GoodCategory();
            try
            {
                model = bll.GetModel(id);
                if (model != null)
                {
                    context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(model));
                }
            }
            catch(Exception)
            {}
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