using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using DTcms.Common;

namespace DTcms.Web.qj_Point
{
    public partial class product : DTcms.Web.UI.Page.article
    {
        protected int totalCount;
        protected int page;
        protected int pageSize;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.page = DTRequest.GetQueryInt("page", 1);

            StringBuilder sbProduct = new StringBuilder();

            DataTable tabProduct = new DTcms.BLL.article().GetList("goods", 0, this.page, "", "sort_id asc,add_time desc,id desc", out this.totalCount,out pageSize).Tables[0];

            string strTitle = "";

            for (int i = 0; i < tabProduct.Rows.Count; i++) 
            {
                strTitle = tabProduct.Rows[i]["title"].ToString();

                sbProduct.Append("<div class='box_list_bb'>"+
                                    "<div class='box_list'>"+
                                        "<a href='productDetail.aspx?id="+tabProduct.Rows[i]["id"]+"'></a>" +
                                        "<img width='165' height='185' src='" + tabProduct.Rows[i]["img_url"] + "' alt='"+tabProduct.Rows[i]["title"]+"' />" +
                                    "</div>"+
                                    "<p>" + (strTitle.Length >= 11 && strTitle != "" ? strTitle.Substring(0, 11) + "..." : strTitle) + "</p>" +
                                    "<p>兑换积分：<span>" + tabProduct.Rows[i]["point"].ToString() + "</span></p>" +
                                "</div>");
            }

            string pageUrl = Utils.CombUrlTxt("product.aspx", "page={0}","__id__");

            this.divProductShow.InnerHtml = sbProduct.ToString();
            this.pageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }
    }
}