using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
namespace DTcms.Web.web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[DTKeys.SESSION_USER_INFO] != null)
            {
                Response.Redirect("/web/index.aspx");
            }
        }

        protected void BtnPost_Click(object sender, EventArgs e)
        {
          
        }
    }
}