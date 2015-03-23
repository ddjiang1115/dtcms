using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Data;
using DTcms.Common;
using System.Web.SessionState;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// ClientGoodList 的摘要说明
    /// </summary>
    public class ClientGoodList : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            DTcms.BLL.GoodCategory bll = new BLL.GoodCategory();
            string type=context.Request.QueryString["type"];
            DataSet ds = null;
            switch (type)
            { 
                case "select":
                int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                try
                {
                    int recordCount = 0;
                    ds = bll.GetList(pageSize, pageIndex, "", "GoodCategoryID", out recordCount);
                    IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                    timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                    string json = JsonConvert.SerializeObject(ds.Tables[0], new DataTableConverter(), timeFormat);
                    context.Response.Write("{\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":" + json + "}");
                }
                catch (Exception)
                { }
                break;
                case "del":
            bll.Delete(context.Request.QueryString["ids"]);
            break;
                case "exit":
                    ds = bll.GetGoodCategoryByName(context.Request.Form["param"]);
                    if (ds == null)
                    {
                        context.Response.Write("{\"info\":\"验证通过！\",\"status\":\"y\"}");
                    }
                    else
                    {
                        context.Response.Write("{\"info\":\"该商品已存在！\",\"status\":\"n\"}");
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