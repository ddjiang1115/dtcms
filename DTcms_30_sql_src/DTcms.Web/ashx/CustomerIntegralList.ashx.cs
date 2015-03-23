using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// CustomerIntegralList 的摘要说明
    /// </summary>
    public class CustomerIntegralList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            DTcms.BLL.IntegralManage bllIntegralManage = new BLL.IntegralManage();
            DTcms.BLL.BarCode bllBarCode = new BLL.BarCode();
            DTcms.BLL.BarCodeCreateRecord bllBarCodeCreateRecord = new BLL.BarCodeCreateRecord();
            DTcms.BLL.GoodCategory bllGoodCategory = new BLL.GoodCategory();
            string type = context.Request.QueryString["type"];
            switch (type)
            {
                case "select":
                    //int pageIndex = int.Parse(context.Request.Form["page"]);
                    //int pageSize = int.Parse(context.Request.Form["rows"]);
                    List<Model.IntegralManage> listIntegralManage = bllIntegralManage.GetList();
                    List<Model.BarCode> listBarCode = bllBarCode.GetList();
                    List<Model.BarCodeCreateRecord> listBarCodeCreateRecord = bllBarCodeCreateRecord.GetList();
                    List<Model.GoodCategory> listGoodCategory = bllGoodCategory.GetList();
                    var query = listIntegralManage.Join(listBarCode, i => i.IntegralCode, b => b.IntegralCode, (i, b) => new { IntegralManageID = i.IntegralManageID, IntegralCode = i.IntegralCode, CreateTime = i.CreateTime, Remark = i.Remark, BarCodeCreateRecordID = b.BarCodeCreateRecordID })
                        .Join(listBarCodeCreateRecord, a => a.BarCodeCreateRecordID, c => c.BarCodeCreateRecordID, (a, c) => new { IntegralManageID = a.IntegralManageID, IntegralCode = a.IntegralCode, CreateTime = a.CreateTime, Remark = a.Remark, GoodCategoryID = c.GoodCategoryID })
                        .Join(listGoodCategory, d => d.GoodCategoryID, g => g.GoodCategoryID, (d, g) => new { IntegralManageID = d.IntegralManageID, IntegralCode = d.IntegralCode, CreateTime = d.CreateTime, Remark = d.Remark, IntegralRatio=g.IntegralRatio });
                    if (context.Request.QueryString["code"] != null)
                    {
                        query = query.Where(i => i.IntegralCode == context.Request.QueryString["code"]);
                    }
                    //query = query.Join(listBarCodeCreateRecord, i => i.BarCodeCreateRecordID, c => c.BarCodeCreateRecordID, (i, c) => new { IntegralManageID = i.IntegralManageID, IntegralCode = i.IntegralCode, CreateTime = i.CreateTime, Remark = i.Remark, GoodCategoryID = c.GoodCategoryID });
                    //query = query.Join(listBarCodeCreateRecord, i => i.BarCodeCreateRecordID, c => c.BarCodeCreateRecordID, (i, c) => new { aaa=i.BarCodeCreateRecordID});
                    string json = JsonConvert.SerializeObject(query);
                    context.Response.Write(json);
                    //context.Response.Write("{\"total\":" + "\"" + 50 + "\"" + ",\"rows\":" + json + "}");
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