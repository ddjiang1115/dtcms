using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTcms.Common;
namespace DTcms.Web.web
{
    public partial class integration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void Unnamed1_Click(object sender, EventArgs e)
        //{
        //    BLL.users modelbll = new BLL.users();
        //    BLL.BarCode bllBar = new BLL.BarCode();
        //    DataSet ds = null;
        //    ds = bllBar.QueryIntegralCode(IntegralCode.Value.Trim());
        //    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        //    {
        //        if (Convert.ToInt32(ds.Tables[0].Rows[0]["state"]) < 4)
        //        {
        //            string uip = string.Empty;
        //            if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
        //            {
        //                uip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        //            }
        //            else
        //            {
        //                uip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
        //            }
        //            Model.users model = Session[DTKeys.SESSION_USER_INFO] as Model.users;
        //            if (bllBar.UserChange(Convert.ToInt32(ds.Tables[0].Rows[0]["IntegralRatio"]), model.user_name, IntegralCode.Value.Trim(), uip))
        //            {
        //                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('兑换成功');", true);
        //            }
        //            else
        //            {
        //                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('兑换失败');", true);
        //            }
        //        }
        //        else
        //        {
        //            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('该积分码已被兑换');", true);
        //        }
        //    }
        //    else
        //    {
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('该积分码不存在');", true);
        //    }
        //}
    }
}