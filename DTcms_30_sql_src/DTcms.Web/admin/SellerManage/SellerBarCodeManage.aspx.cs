using System;
using System.Collections.Generic;
using DTcms.Model;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.BLL;
using Newtonsoft.Json;
namespace DTcms.Web.admin.SellerManage
{
    public partial class SellerBarCodeManage : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
      
        }
        public string Remove()
        {
            Cache.Remove("key");
            return "";
        }

    }
}