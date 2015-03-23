using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTcms.Common;
namespace DTcms.Web.admin.SellerManage
{
    public partial class AddUser : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DoAdd();
        }
        #region 增加操作=================================
        private void DoAdd()
        {
            Model.users model = new Model.users();
            BLL.users bll = new BLL.users();

            model.group_id = 1;
            model.status = 0;
            //检测用户名是否重复
            //if (bll.Exists(txtUserName.Text.Trim()))
            //{
            //    return;
            //}
            model.user_name = tel.Text.Trim();
            model.salt = Utils.GetCheckCode(6);
            //以随机生成的6位字符串做为密钥加密
            model.password = DESEncrypt.Encrypt("123456", model.salt);
            model.reg_time = DateTime.Now;
            model.reg_ip = DTRequest.GetIP();
            model.mobile = tel.Text.Trim();
            List<string> list = new List<string>();
            string aa = Request.Form["IntegralCode"];
            var codes_list = Request.Form["IntegralCode"].Split(',');
            BLL.BarCode bllBar = new BLL.BarCode();
            DataSet ds = null;
            ds = bllBar.QueryIntegralRatioSum(Request.Form["IntegralCode"]);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < codes_list.Length; i++)
                {
                    if (!list.Contains(codes_list[i]))
                    {
                        list.Add(codes_list[i]);
                    }
                }

                if (bll.Add(model, Convert.ToInt32(ds.Tables[0].Rows[0][0]), list))
                {
                    ClientScript.RegisterStartupScript(GetType(), "", "TipSuccess();", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "", "TipFail();", true);
                }
            }
        }
        #endregion
    }
}