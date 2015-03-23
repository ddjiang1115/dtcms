using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.BLL;
using System.Data;
using DTcms.Common;
namespace DTcms.Web.admin.users
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.t_address_province bll = new t_address_province();
                DataTable dt_provice = bll.GetProvinceAll();
                if (dt_provice != null)
                {
                    drpProvice.DataSource = dt_provice;
                    drpProvice.DataValueField = "code";
                    drpProvice.DataTextField = "name";
                    drpProvice.DataBind();
                }
            }

        }




        #region 增加操作=================================
        private void DoAdd()
        {
            Model.manager model = new Model.manager();
            Model.Dealer model_dealer = new Model.Dealer();
            Model.Shop model_shop = new Model.Shop();
            BLL.manager bll = new BLL.manager();
            //model.role_id = int.Parse(ddlRoleId.SelectedValue);
            model.role_id = 2;
            model.role_type = 2;
            model.is_lock = 1;
            //检测用户名是否重复
            //if (bll.Exists(txtUserName.Text.Trim()))
            //{
            //    return false;
            //}
            model.user_name = txtname.Text.Trim();
            //获得6位的salt加密字符串
            model.salt = Utils.GetCheckCode(6);
            //以随机生成的6位字符串做为密钥加密
            model.password = DESEncrypt.Encrypt(txtPassword.Text.Trim(), model.salt);

            model.telephone = txtTelephone.Text.Trim();
            //model.email = txtEmail.Text.Trim();
            //model.add_time = DateTime.Now;
            //model.Companyname = txtcompanyname.Text.Trim();
            //model.Name = txtname.Text.Trim();
            //model.Phone = txtphone.Text.Trim();
            //model.Position = txtposition.Text.Trim();
            //model.Address = txtaddress.Text.Trim();

            model_dealer.DealerCode = txtDealerCode.Text.Trim();
            model_dealer.DealerName = txtDealerName.Text.Trim();
            model_shop.ProvinceCode = Request.Form["drpProvice"];
            model_shop.CityCode = Request.Form["city"];
            model_shop.TownCode = Request.Form["town"];
            model_shop.DetailAddress = txtDetailAddress.Text.Trim();
            model_shop.ShopName = txtShopName.Text.Trim();
            model_shop.Postcode = txtPostcode.Text.Trim();
            try
            {
                bll.Add(model, model_shop);
                Page.ClientScript.RegisterStartupScript(GetType(), "", "mess()", true);
            }
            catch (Exception)
            { }
            //if (bll.Add(model) > 0)
            //{
            //    //AddAdminLog(DTEnums.ActionEnum.Add.ToString(), "添加管理员:" + model.user_name); //记录日志
            //    return true;
            //}
            //return false;
        }
        #endregion



        //保存
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DoAdd();
            //ChkAdminLevel("manager_list", DTEnums.ActionEnum.Add.ToString()); //检查权限
            //if (!DoAdd())
            //{
            //    //JscriptMsg("保存过程中发生错误！", "", "Error");
            //    return;
            //}
            //Page.ClientScript.RegisterStartupScript(GetType(), "", "mess()", true);
        }
    }
}