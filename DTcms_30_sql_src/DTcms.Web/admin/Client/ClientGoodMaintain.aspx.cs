using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
namespace DTcms.Web.admin.Client
{
    public partial class ClientGoodMaintain : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Model.Client> list = new BLL.Client().GetList();
                ddlGroupId.DataSource = list;
                ddlGroupId.DataTextField = "ClientName";
                ddlGroupId.DataValueField = "ClientID";
                ddlGroupId.DataBind();
                if (Request.QueryString["GoodCategoryID"] != null)
                {
                    txtGoodCategoryName.ReadOnly = true;
                    txtGoodCategoryName.Attributes.Remove("ajaxurl");
                    BLL.GoodCategory bll = new BLL.GoodCategory();
                    Model.GoodCategory model = new Model.GoodCategory();
                    model = bll.GetModel(Request.QueryString["GoodCategoryID"]);
                    txtGoodCategoryName.Text = model.GoodCategoryName;
                    //txtGoodBarCode.Text = model.GoodBarCode.ToString();
                    //txtGoodBarCode.Text = model.GoodBarCode.ToString();
                    txtBrokerageRatio.Text = model.BrokerageRatio.ToString();
                    txtIntegralRatio.Text = model.IntegralRatio.ToString();
                    //txtStandard.Text = model.Standard.ToString();
                    drpState.SelectedValue= model.State.ToString();
                    txtRemark.Text = model.Remark;
                }
            }
        }
        private void Add()
        {
            Model.manager adminmodel = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            Model.GoodCategory model = new Model.GoodCategory();
            BLL.GoodCategory bll = new BLL.GoodCategory();
            model.UniqueID = Guid.NewGuid();
            model.ClientID = int.Parse(ddlGroupId.SelectedValue);
            model.GoodCategoryName = txtGoodCategoryName.Text;
            model.BrokerageRatio = decimal.Parse(txtBrokerageRatio.Text);
            model.IntegralRatio = int.Parse(txtIntegralRatio.Text);
            //model.GoodBarCode = txtGoodBarCode.Text;
            model.Operator = adminmodel.id;
            //model.Standard = int.Parse(txtStandard.Text);
            model.State = int.Parse(drpState.SelectedValue);
            model.CreateTime = DateTime.Now;
            model.Remark = txtRemark.Text;

            if (bll.Add(model) > 0)
            {
                Response.Redirect("/admin/client/ClientGoodList.aspx");
            }
        }
        private void Edit()
        {
            Model.manager adminmodel = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            Model.GoodCategory model = new Model.GoodCategory();
            BLL.GoodCategory bll = new BLL.GoodCategory();
            model.GoodCategoryID = int.Parse(Request.QueryString["GoodCategoryID"]);
            model.ClientID = int.Parse(ddlGroupId.SelectedValue);
            model.GoodCategoryName = txtGoodCategoryName.Text;
            model.BrokerageRatio = decimal.Parse(txtBrokerageRatio.Text);
            model.IntegralRatio = int.Parse(txtIntegralRatio.Text);
            //model.GoodBarCode = txtGoodBarCode.Text;
            model.Operator = adminmodel.id;
            //model.Standard = int.Parse(txtStandard.Text);
            model.State = int.Parse(drpState.SelectedValue);
            model.CreateTime = DateTime.Now;
            model.Remark = txtRemark.Text;

            if (bll.Edit(model) > 0)
            {
                Response.Redirect("/admin/client/ClientGoodList.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["GoodCategoryID"] != null)
            {
                Edit();
            }
            else
            {
                Add();
            }
        }
    }
}