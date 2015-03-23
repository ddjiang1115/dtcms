using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Web.SessionState;
using DTcms.Common;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// SellerBarCodeList 的摘要说明
    /// </summary>
    public class SellerBarCodeList : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            DTcms.BLL.Promotion bll = new BLL.Promotion();
            BLL.Client bllClient = new BLL.Client();
            BLL.GoodCategory bllGoodCategory = new BLL.GoodCategory();
            BLL.BarCode bllbarcode = new BLL.BarCode();
            string type = context.Request.QueryString["type"];
            switch (type)
            {
                case "select":
                    int pageIndex = int.Parse(context.Request.Form["page"].ToString());
                int pageSize = int.Parse(context.Request.Form["rows"].ToString());
                try
                {
                    int recordCount = 0;
                    Model.manager adminmodel = context.Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
                    DataSet ds = bll.GetList(pageSize, pageIndex, "m.id="+adminmodel.id, "PromotionID", out recordCount);
                    DataTable dt = ds.Tables[0];
                    string result = "";
                    IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
                    timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
                    result = JsonConvert.SerializeObject(dt, new DataTableConverter(),timeFormat);
                    context.Response.Write("{\"total\":" + "\"" + recordCount + "\"" + ",\"rows\":" + result + "}");
                }
                catch (Exception)
                {
                
                }
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