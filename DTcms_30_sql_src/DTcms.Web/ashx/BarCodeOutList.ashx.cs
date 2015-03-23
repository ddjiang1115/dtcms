using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// BarCodeOutList 的摘要说明
    /// </summary>
    public class BarCodeOutList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            DTcms.BLL.OutWarehouse bll = new BLL.OutWarehouse();
            BLL.Client bllClient = new BLL.Client();
            string type = context.Request.QueryString["type"];
            switch (type)
            {
                case "select":
                    int pageIndex = int.Parse(context.Request.Form["page"]);
                    int pageSize = int.Parse(context.Request.Form["rows"]);
                    List<Model.OutWarehouse> listOutWarehouse = bll.GetList();
                    List<Model.Client> listClient = bllClient.GetList();
                    var list = listOutWarehouse.Join(listClient, p => p.ClientID, c => c.ClientID, (p, c) => new { OutWarehouseID = p.OutWarehouseID, ClientName = c.ClientName, LogisticsCode = p.LogisticsCode, CreateTime = p.CreateTime.Date, Remark = p.Remark });
                    var listPage = (from c in list
                                    select c).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
                    IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                        timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                        string json = JsonConvert.SerializeObject(listPage, timeFormat);
                    context.Response.Write("{\"total\":" + "\"" + list.Count() + "\"" + ",\"rows\":" + json + "}");
                    break;
                case "del":
                    bll.Delete(context.Request.QueryString["ids"]);
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