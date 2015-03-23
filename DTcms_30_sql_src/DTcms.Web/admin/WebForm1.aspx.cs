using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Net;
using System.IO;
using System.Text;
namespace DTcms.Web.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ip.Value = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (Context.Request.ServerVariables["HTTP_VIA"] != null) // using proxy
            {

                ip.Value = Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();  // Return real client IP.

            }

            else// not using proxy or can't get the Client IP
            {

                ip.Value = Request.ServerVariables["REMOTE_ADDR"].ToString(); //While it can't get the Client IP, it will return proxy IP.

            }
        }


   


    }
}