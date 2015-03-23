using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.layout
{
    public partial class userInfo : System.Web.UI.UserControl
    {
        protected DTcms.Model.users modelUser = new Model.users();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[DTKeys.SESSION_USER_INFO] != null && Session[DTKeys.SESSION_USER_INFO].ToString() != "")
            {
                modelUser = (DTcms.Model.users)Session[DTKeys.SESSION_USER_INFO];
            }
        }
    }
}