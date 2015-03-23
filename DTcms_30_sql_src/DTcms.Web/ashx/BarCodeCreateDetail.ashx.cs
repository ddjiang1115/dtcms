using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Reflection;
using Microsoft.Office.Interop.Excel;
using System.IO;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// BarCodeCreateDetail 的摘要说明
    /// </summary>
    public class BarCodeCreateDetail : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.ContentType = "text/plain";
            //string id = context.Request.QueryString["page"];
            string type = context.Request.QueryString["type"];

            //int pageIndex = int.Parse(context.Request.Form["page"].ToString());
            //int pageSize = int.Parse(context.Request.Form["rows"].ToString());
            string id =context.Request.QueryString["id"];
            if (!string.IsNullOrEmpty(id))
            {
                switch (type)
                {
                    case "1": GetString(context, id);
                        break;
                    case "2": ExcelOut(context, id);
                        break;
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
        public void GetString(HttpContext context, string id)
        {
            DTcms.BLL.BarCode bll = new DTcms.BLL.BarCode();
            try
            {
                int recordCount = 0;
                System.Data.DataTable dt = bll.GetBarCodeCreateDetailByBarCodeCreateRecordID(id);
                //DataTable dt = ds.Tables[0];
                StringBuilder sb = new StringBuilder();

                //sb.Append("{");
                //sb.Append("\"Standard\":\"10\",\"total\":" + "\"" + dt.Rows.Count + "\"" + ",\"rows\":[");
                //foreach (DataRow dr in dt.Rows)
                //{
                //    sb.Append("{\"BoxCode\":" + "\"" + dr["BoxCode"] + "\",\"ClientName\":" + "\"" + dr["ClientName"] + "\"" + ",\"IntegralCode\":" + "\"" + dr["IntegralCode"] + "\"" + ",\"LogisticsCode\":" + "\"" + dr["LogisticsCode"] + "\"" + ",\"BarCodeID\":" + "\"" + dr["BarCodeID"] + "\"},");
                //}
                //string ht = sb.ToString().Substring(0, sb.Length - 1);
                //ht = ht + "]}";


                sb.Append("<table class=\"t_result\">");
                //sb.Append("<tr><th>选择</th><th>追溯码</th><th>商品</th><th>箱数</th><th>商品件数</th><th>操作人</th><th>状态</th><th>操作日期</th><th>备注</th><th>操作</th></tr>");
                int BoxSum = Convert.ToInt32(dt.Rows[0]["BoxSum"]);
                int cells = dt.Rows.Count / BoxSum;
                int k = 0;
                for (int i = 0; i < dt.Rows.Count; i = i +k)
                {
                    k = 0;
                    sb.Append("<tr><td >" + dt.Rows[i]["BoxCode"] + "</td>");
                    for (int j = 0; j <cells; j++)
                    {
                        if (i + j == dt.Rows.Count)
                        {
                            break;
                        }
                        sb.Append("<td>" + dt.Rows[i + j]["IntegralCode"] + "</br>" + dt.Rows[i + j]["LogisticsCode"] + "</td>");
                        k++;
                    }
                    sb.Append("</tr>");
                }
                sb.Append("</table>");
                context.Response.Write(sb.ToString());
            }
            catch (Exception)
            { }
        }
        public void ExcelOut(HttpContext context,string id)
        {
            BLL.BarCodeCreateRecord bllbcr = new BLL.BarCodeCreateRecord();
            BLL.GoodCategory bllgc = new BLL.GoodCategory();
            List<Model.GoodCategory> gList=bllgc.GetList();
            List<Model.BarCodeCreateRecord> bList = bllbcr.GetList();
            var model = bList.Where(b => b.BarCodeCreateRecordID == int.Parse(id)).ToList();
            //var model = bList.Join(gList, b => b.GoodCategoryID, g => g.GoodCategoryID, (b, g) => new { GoodCategoryName = g.GoodCategoryName, BarCodeCreateRecordID = b.BarCodeCreateRecordID, DownLoad=b.DownLoad }).Where(b => b.BarCodeCreateRecordID == int.Parse(id)).ToList();
            //Model.BarCodeCreateRecord model = bllbcr.GetModel(id);
            string aaa = context.Server.MapPath("/DownLoad/");
            string FullFileName = aaa +model[0].DownLoad+".txt";
            FileInfo DownloadFile = new FileInfo(FullFileName);
            context.Response.Clear();
            context.Response.ClearHeaders();
            context.Response.Buffer = false;
            context.Response.ContentType = "application/octet-stream";
            //context.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(model[0].GoodCategoryName+".txt", System.Text.Encoding.UTF8));
            context.Response.AppendHeader("Content-Disposition", "attachment;filename=" +model[0].RetrospectCode+ ".txt");
            context.Response.AppendHeader("Content-Length", DownloadFile.Length.ToString());
            context.Response.WriteFile(DownloadFile.FullName);
            context.Response.Flush();
            context.Response.End();
        }
    }
}