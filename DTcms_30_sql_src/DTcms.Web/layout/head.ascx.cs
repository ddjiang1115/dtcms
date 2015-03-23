using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.IO;
using System.Text;
namespace DTcms.Web.layout
{
    public partial class head : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session[DTKeys.SESSION_USER_INFO] == null)
                {
                    online.Visible = false;
                    unonline.Visible = true;
                    //FileStream fs = new FileStream("D:\\A.txt", FileMode.Append);
                    //StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                    //sw.Write("头部session被清空了，时间是：" + DateTime.Now + "\r\n");
                    //sw.Close();
                    //fs.Close();
                }
                else
                {
                    Model.users model = Session[DTKeys.SESSION_USER_INFO] as Model.users;
                    online.Visible = true;
                    unonline.Visible = false;
                    lblName.InnerText = model.user_name;
                    lblpoint.InnerText = model.point.ToString();
                    //FileStream fs = new FileStream("D:\\A.txt", FileMode.Append);
                    //StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                    //sw.Write("头部session没有清空，时间是：" + DateTime.Now + "\r\n");
                    //sw.Close();
                    //fs.Close();
                }
            }
        }
    }
}