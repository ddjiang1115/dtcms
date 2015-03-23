using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
namespace DTcms.Web.layout
{
    public partial class PersonCenter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[DTKeys.SESSION_USER_INFO] == null)
            {


                Response.Redirect("/web/Login.aspx");
            }
            else
            {
                BLL.users bll = new BLL.users();
                Model.users model = Session[DTKeys.SESSION_USER_INFO] as Model.users;
                //Session[DTKeys.SESSION_USER_INFO] = bll.GetModel(model.user_name);
                //model = Session[DTKeys.SESSION_USER_INFO] as Model.users;
                img.Src = model.avatar;
            }
        }
    }
}