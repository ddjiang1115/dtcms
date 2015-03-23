using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Data;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// ClientGoodList 的摘要说明
    /// </summary>
    public class ClientList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            DTcms.BLL.Client bll = new BLL.Client();
            DataSet ds = null;
            string type=context.Request.QueryString["type"];
            switch (type)
            {
                case "select":
                    int pageIndex = int.Parse(context.Request.Form["page"]);
                    int pageSize = int.Parse(context.Request.Form["rows"]);
                    List<Model.Client> list = bll.GetList();
                    List<Model.Client> listPage = (from c in list
                                                   select c).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
                    IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                    timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                    string json = JsonConvert.SerializeObject(listPage,timeFormat);
                    context.Response.Write("{\"total\":" + "\"" + list.Count + "\"" + ",\"rows\":" + json + "}");
                    break;
                case "del":
                    bll.Delete(context.Request.QueryString["ids"]);
                    break;
                case "exit":
                    ds = bll.GetClientByName(context.Request.Form["param"]);
                    if (ds == null)
                    {
                        context.Response.Write("{\"info\":\"验证通过！\",\"status\":\"y\"}");
                    }
                    else
                    {
                        context.Response.Write("{\"info\":\"该客户已存在！\",\"status\":\"n\"}");
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