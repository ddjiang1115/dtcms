using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.qj_Point
{
    public partial class productDetail : DTcms.Web.UI.Page.article
    {
        protected DTcms.Model.article modelArticle = new Model.article();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "") 
            {
                modelArticle = new DTcms.BLL.article().GetModel(Convert.ToInt32(Request.QueryString["id"]));
            }

        }
    }
}