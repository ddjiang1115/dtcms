using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
namespace DTcms.Web.admin.BarCode
{
    public partial class BarCodeCreateList : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Response.Write(Request.QueryString["page"].ToString());
                //int page=1;
                //if (Request.QueryString["page"]!=null)
                //{
                //    page = int.Parse(Request.QueryString["page"].ToString());
                //}
                //GetModel(page);
            }
            
        }
        public void GetModel(int pageIndex)
        {
            DTcms.BLL.BarCodeCreateRecord bll = new DTcms.BLL.BarCodeCreateRecord();
            //DTcms.BLL.GoodCategory bll2 = new DTcms.BLL.GoodCategory();
            //List<DTcms.Model.BarCodeCreateRecord> bccs = bll.GetList();
            //List<DTcms.Model.GoodCategory> bcs = bll2.GetModel();
            //var a = from b in bccs
            //        join c in bcs
            //        on b.GoodCategoryID equals c.GoodCategoryID
            //        where b.Show==1
            //        select new
            //          {
            //             b.BarCodeCreateRecordID,b.GoodCategoryID,b.RetrospectCode,c.GoodCategoryName,b.BoxSum,b.GoodCount,b.Operator,b.State,b.CreateTime,b.Remark,b.DownLoad
            //          };
            //drpresult.DataSource = a;
            //drpresult.DataBind();
            //int recordCount = 0;
            //DataSet ds = bll.GetList(10, pageIndex, " b.Show=1", "BarCodeCreateRecordID", out recordCount);
            //drpresult.DataSource = ds.Tables[0];
            //drpresult.DataBind();
        }

        protected void BtnOut_Click(object sender, EventArgs e)
        {
            DTcms.BLL.BarCodeCreateRecord bll = new DTcms.BLL.BarCodeCreateRecord();
            bll.Delete(Request.Form["code"]);
        }
    }

}