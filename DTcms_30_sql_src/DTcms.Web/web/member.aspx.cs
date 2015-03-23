using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
namespace DTcms.Web.web
{
    public partial class member : System.Web.UI.Page
    {
        BLL.users bll = new BLL.users();
        Model.users model = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session[DTKeys.SESSION_USER_INFO] != null)
                {
                    model = Session[DTKeys.SESSION_USER_INFO] as Model.users;
                    //model = bll.GetModel(Session["UserName"].ToString());
                    //model = bll.GetModel("ddjiang1115");
                    if (model != null)
                    {
                        user_name.Text = model.user_name;
                        lbluser_name.Text = model.user_name;
                        nick_name.Text = model.nick_name;
                        txtnick_name.Text = model.nick_name;
                        BabyName.Text = model.BabyName;
                        txtBabyName.Text = model.BabyName;
                        BabyNickName.Text = model.BabyNickName;
                        txtBabyNickName.Text = model.BabyNickName;
                        BabyAge.Text =model.BabyAge.ToString();
                        txtBabyAge.Text = model.BabyAge.ToString();
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            
            if (Session[DTKeys.SESSION_USER_INFO] != null)
            {
                model = Session[DTKeys.SESSION_USER_INFO] as Model.users;
                //model = bll.GetModel(Session["UserName"].ToString());
                model.user_name = lbluser_name.Text;
                model.nick_name = txtnick_name.Text.Trim();
                model.BabyName = txtBabyName.Text.Trim();
                model.BabyNickName = txtBabyNickName.Text.Trim();
                model.BabyAge = Convert.ToInt32(txtBabyAge.Text.Trim());
                if (bll.Update(model))
                {
                    Response.Redirect("/web/member.aspx");
                }
            }
        }
    }
}