using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Data.OleDb;
using Microsoft.Office.Interop;
using System.IO;
using System.Reflection;
using System.Linq;
using System.Text;
namespace DTcms.Web.admin.BarCode
{
    public partial class BarCodeCreate : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtCreateTime.Text = DateTime.Now.ToShortDateString();
                //List<Model.Client> list = new BLL.Client().GetList();
                //ddlGroupId.DataSource = list;
                //ddlGroupId.DataTextField = "ClientName";
                //ddlGroupId.DataValueField = "ClientID";
                //ddlGroupId.DataBind();
                //List<Model.GoodCategory> list_GoodCategory = new BLL.GoodCategory().GetList();

                //DropDownList1.DataSource = list_GoodCategory;
                //DropDownList1.DataTextField = "GoodCategoryName";
                //DropDownList1.DataValueField = "GoodCategoryID";
                //DropDownList1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DoAdd();
            
        }
        #region 增加操作=================================
        private void DoAdd()
        {
            Model.BarCodeCreateRecord BarCodeCreateRecord = new Model.BarCodeCreateRecord();
            BLL.BarCodeCreateRecord bll = new BLL.BarCodeCreateRecord();
            Model.manager adminmodel =Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            BarCodeCreateRecord.GoodCount = int.Parse(txtGoodCount.Text);
            BarCodeCreateRecord.BoxSum=Convert.ToInt32(txtBoxsum.Text.Trim());
            BarCodeCreateRecord.RetrospectCode = txtRetrospect.Text;
            BarCodeCreateRecord.Operator = adminmodel.id;
            BarCodeCreateRecord.Batch = txtBatch.Text.Trim();
            BarCodeCreateRecord.State = 1;
            BarCodeCreateRecord.CreateTime = DateTime.Now;
            BarCodeCreateRecord.Remark = txtRemark.Text;
            BarCodeCreateRecord.GoodBarCode = txtGoodBarCode.Text.Trim();
            //BarCodeCreateRecord.BrokerageRatio = Convert.ToDecimal(txtBrokerageRatio.Text.Trim());
            //BarCodeCreateRecord.IntegralRatio = Convert.ToInt32(txtIntegralRatio.Text.Trim());
            Model.BarCode BarCode = new Model.BarCode();
            BarCode.CreateTime = DateTime.Now;
            BarCode.State = 1;
            Model.GoodCategory gc = new Model.GoodCategory();
            BLL.GoodCategory bllgc = new BLL.GoodCategory();
            try
            {
                bll.Add(BarCodeCreateRecord, BarCode);
                int i=bll.GetMaxID();
                if(i!=0)
                {
                    ExcelOut(i.ToString());
                Response.Redirect("/admin/BarCode/BarCodeCreateDetail.aspx?id="+i);
                }
            }
            catch(Exception e)
            {
                
            }
        }

        #endregion

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public void ExcelOut(string id)
        {

            Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel.Workbook wb = null;
            Microsoft.Office.Interop.Excel.Sheets sh = null;
            excel.Application.Workbooks.Add(true);
            excel.Cells[1, 1] = "箱码";
            excel.Cells[1, 2] = "物流码";
            excel.Cells[1, 3] = "积分码"; ;

            string content = "   箱码            物流码           积分码\r\n";


            BLL.BarCode bllBarCode = new BLL.BarCode();
            System.Data.DataTable dt = bllBarCode.GetBarCodeCreateDetailByBarCodeCreateRecordID(id);
            BLL.BarCodeCreateRecord bllBarCodeCreateRecord = new BLL.BarCodeCreateRecord();
            int num = 2;
            string FileName;
            FileName = Guid.NewGuid().ToString();
            
            object OsPath, FilePathxls, FilePathtxt;//表格文件的保存地址  
            OsPath = Server.MapPath("/DownLoad/");//这里我定义了桌面的地址
            FilePathxls = string.Format("{0}{1}", (string)OsPath, FileName + ".xls");//为了自定义地址，加了一个地址拼接
            FilePathtxt = string.Format("{0}{1}", (string)OsPath, FileName + ".txt");//为了自定义地址，加了一个地址拼接
            FileStream fs = File.Create(FilePathtxt.ToString());
            foreach (DataRow dr in dt.Rows)
            {
                excel.Cells[num, 1] = dr["BoxCode"];
                excel.Cells[num, 2] = dr["LogisticsCode"];
                excel.Cells[num, 3] = dr["IntegralCode"];
                content += dr["BoxCode"].ToString() + "    " + dr["LogisticsCode"] + "    " + dr["IntegralCode"] + "\r\n";
                num++;
            }
            byte[] buffer = Encoding.UTF8.GetBytes(content);
            fs.Write(buffer, 0, buffer.Length);
            //bllBarCodeCreateRecord.Update(id, "//DownLoad//" + FileName);
            bllBarCodeCreateRecord.Update(id,  FileName);
            excel.Visible = false;
            excel.DisplayAlerts = false;
            excel.AlertBeforeOverwriting = false;


            excel.ActiveWorkbook.SaveAs(FilePathxls);

            excel.Quit();

            //Response.Write("/DownLoad/" + FileName + ".txt");
        }
    }
  
}