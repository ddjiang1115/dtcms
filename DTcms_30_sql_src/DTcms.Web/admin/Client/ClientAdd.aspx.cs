using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

namespace DTcms.Web.admin.Client
{
    public partial class ClientAdd : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ClientID"] != null)
                {
                    txtClientAccount.ReadOnly = true;
                    BLL.Client bll = new BLL.Client();
                    Model.Client model = new Model.Client();
                    model = bll.GetModel(Request.QueryString["ClientID"]);
                    txtClientAccount.Text = model.ClientAccount;
                    txtClientName.Text = model.ClientName;
                    txtPhone.Text = model.Phone;
                    txtClientAddress.Text= model.ClientAddress;
                    txtEmail.Text = model.Email;
                    txtRemark .Text= model.Remark;
                    txtClientAccount.Attributes.Remove("ajaxurl");
                }
            }
        }
        private void Add()
        {
            BLL.Client bll=new BLL.Client();
            Model.Client model = new Model.Client();
            model.UniqueID = Guid.NewGuid();
            model.ClientAccount = txtClientAccount.Text;
            model.ClientName = txtClientName.Text;
            model.Phone = txtPhone.Text;
            model.Email = txtEmail.Text;
            model.ClientAddress = txtClientAddress.Text;
            model.CreateTime = DateTime.Now;
            model.State = 1;
            model.Remark = txtRemark.Text;
            if (bll.Add(model) > 0)
            {
                Response.Redirect("/admin/client/ClientList.aspx");
            }
        }
        private void Edit()
        {
            BLL.Client bll = new BLL.Client();
            Model.Client model = new Model.Client();
            model.ClientID = int.Parse(Request.QueryString["ClientID"]);
            model.UniqueID = Guid.NewGuid();
            model.ClientAccount = txtClientAccount.Text;
            model.ClientName = txtClientName.Text;
            model.Phone = txtPhone.Text;
            model.Email = txtEmail.Text;
            model.ClientAddress = txtClientAddress.Text;
            model.CreateTime = DateTime.Now;
            model.State = 1;
            model.Remark = txtRemark.Text;
            if (bll.Edit(model) > 0)
            {
                Response.Redirect("/admin/client/ClientList.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ClientID"] != null)
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