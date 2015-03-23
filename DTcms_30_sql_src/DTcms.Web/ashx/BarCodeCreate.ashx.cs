using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DTcms.Web.ashx
{
    /// <summary>
    /// BarCodeCreate 的摘要说明
    /// </summary>
    public class BarCodeCreate : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.BarCodeCreateRecord bllBarCodeCreateRecord = new BLL.BarCodeCreateRecord();
            BLL.GoodCategory bllGoodCategory = new BLL.GoodCategory();
            List<Model.BarCodeCreateRecord> listBarCodeCreateRecord = bllBarCodeCreateRecord.GetList();
            List<Model.GoodCategory> listGoodCategory = bllGoodCategory.GetList();
            var query = listGoodCategory.Where(g => g.GoodCategoryName == "旭贝尔乳基婴儿配方奶粉 1段（0-12个月）铁罐900g").Join(listBarCodeCreateRecord, g => g.GoodCategoryID, b => b.GoodCategoryID, (g, b) => new { g.Standard }).ToList();
            //listBarCodeCreateRecord.Join(listGoodCategory,b=>b.GoodCategoryID,g=>g.GoodCategoryID);
            int param = int.Parse(context.Request.Form["param"]);
            if (query.Count() == 0 || param % query[0].Standard > 0)
            {
                context.Response.Write("{ \"info\":\"请输入" + query[0].Standard + "的倍数\", \"status\":\"n\" }");
            }
            else
            {
                context.Response.Write("{ \"info\":\"\", \"status\":\"y\" }");
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