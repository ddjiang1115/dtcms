<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.userorder" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by DTcms Template Engine at 2015/3/2 13:50:58.
		本页面代码由DTcms模板引擎生成于 2015/3/2 13:50:58. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>我的订单 - ");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n<meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webkeyword));
	templateBuilder.Append("\" name=\"keywords\" />\r\n<meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webdescription));
	templateBuilder.Append("\" name=\"description\" />\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" />\r\n<link media=\"screen\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" />\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/lhgdialog/lhgdialog.js?skin=idialog\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body style=\"overflow-x:hidden\">\r\n<div class=\"boxwrap\" style=\"width:auto;\">\r\n  \r\n  \r\n  <div class=\"right757\" style=\"float:none;width:557px;\">\r\n    <h1 class=\"main_tit\">\r\n      <!--<span><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">管理首页</a></span>-->\r\n      我的订单\r\n      <strong>Order</strong>\r\n    </h1>\r\n    ");
	if (action=="list")
	{

	templateBuilder.Append("\r\n    <!--交易订单-->\r\n  <!--  <div class=\"tab_head\">\r\n      <ul class=\"tabs\">\r\n        <li class=\"selected\"><a href=\"");
	templateBuilder.Append(linkurl("userorder","list"));

	templateBuilder.Append("\">交易订单</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("userorder","close"));

	templateBuilder.Append("\">已关闭订单</a></li>\r\n      </ul>\r\n    </div>-->\r\n    \r\n    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"ftable\">\r\n      <tr>\r\n        <th width=\"16%\" align=\"left\">订单号</th>\r\n        <th align=\"left\">订单商品</th>\r\n        <th width=\"10%\">收货人</th>\r\n        <th width=\"12%\">订单金额</th>\r\n        <th width=\"11%\">下单时间</th>\r\n        <th width=\"10%\">订单状态</th>\r\n        <th width=\"12%\">操作</th>\r\n      </tr>\r\n      ");
	DataTable list1 = get_order_list(10, page, "user_id='"+userModel.id+"' and status<=3", out totalcount);

	templateBuilder.Append(" <!--取得一个DataTable-->\r\n      ");
	string pagelist1 = get_page_link(10, page, totalcount, "userorder", action, "__id__");

	templateBuilder.Append(" <!--取得分页页码列表-->\r\n      ");
	foreach(DataRow dr in list1.Rows)
	{

	templateBuilder.Append("\r\n      <tr>\r\n        <td>" + Utils.ObjectToStr(dr["order_no"]) + "</td>\r\n        <td>\r\n          ");
	List<DTcms.Model.article> ls = get_order_goods_list(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0));

	if (ls!=null)
	{

	foreach(DTcms.Model.article modelt in ls)
	{

	templateBuilder.Append("\r\n          <a target=\"_blank\" title=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.id));

	templateBuilder.Append("\"><img width=\"40\" height=\"40\" alt=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.img_url));
	templateBuilder.Append("\"></a>\r\n          ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n        </td>\r\n        <td align=\"center\">" + Utils.ObjectToStr(dr["accept_name"]) + "</td>\r\n        <td align=\"center\"><strong>￥" + Utils.ObjectToStr(dr["order_amount"]) + "</strong><br />");
	templateBuilder.Append(get_payment_title(Utils.StrToInt(Utils.ObjectToStr(dr["payment_id"]), 0)).ToString());

	templateBuilder.Append("</td>\r\n        <td align=\"center\">" + Utils.ObjectToStr(dr["add_time"]) + "</td>\r\n        <td align=\"center\">\r\n          ");
	templateBuilder.Append(get_order_status(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0)).ToString());

	templateBuilder.Append("\r\n        </td>\r\n        <td align=\"center\">\r\n          <a href=\"");
	templateBuilder.Append(linkurl("userorder_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">查看订单</a><br />\r\n          ");
	if (get_order_payment_status(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0)))
	{

	templateBuilder.Append("\r\n          <a href=\"");
	templateBuilder.Append(linkurl("payment","confirm",Utils.ObjectToStr(dr["order_no"])));

	templateBuilder.Append("\">去付款</a> |\r\n          ");
	}	//end for if

	if (Utils.StrToInt(Utils.ObjectToStr(dr["status"]), 0)<2)
	{

	templateBuilder.Append("\r\n          <a href=\"javascript:;\" onclick=\"clickSubmit('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=order_cancel&order_no=" + Utils.ObjectToStr(dr["order_no"]) + "');\">取消</a>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </td>\r\n      </tr>\r\n      ");
	}	//end for if

	if (totalcount<1)
	{

	templateBuilder.Append("\r\n      <tr><td colspan=\"8\" align=\"center\">暂无记录</td></tr>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </table>\r\n    \r\n    <div class=\"page_foot\">\r\n      <div class=\"flickr right\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist1));
	templateBuilder.Append("</div><!--放置页码列表-->\r\n    </div>\r\n    <!--交易订单-->\r\n    \r\n    ");
	}
	else if (action=="close")
	{

	templateBuilder.Append("\r\n\r\n    \r\n    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"ftable\">\r\n      <tr>\r\n        <th width=\"16%\" align=\"left\">订单号</th>\r\n        <th align=\"left\">订单商品</th>\r\n        <th width=\"10%\">收货人</th>\r\n        <th width=\"12%\">订单金额</th>\r\n        <th width=\"11%\">下单时间</th>\r\n        <th width=\"10%\">订单状态</th>\r\n        <th width=\"12%\">操作</th>\r\n      </tr>\r\n      <!--");
	DataTable list2 = get_order_list(10, page, "user_id='"+userModel.id+"' and status>3", out totalcount);

	templateBuilder.Append("--> <!--取得一个DataTable-->\r\n      ");
	string pagelist2 = get_page_link(10, page, totalcount, "userorder", action, "__id__");

	templateBuilder.Append(" <!--取得分页页码列表-->\r\n      ");
	foreach(DataRow dr in list2.Rows)
	{

	templateBuilder.Append("\r\n      <tr>\r\n        <td>" + Utils.ObjectToStr(dr["order_no"]) + "</td>\r\n        <td>\r\n          ");
	List<DTcms.Model.article> ls = get_order_goods_list(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0));

	if (ls!=null)
	{

	foreach(DTcms.Model.article modelt in ls)
	{

	templateBuilder.Append("\r\n          <a target=\"_blank\" title=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.id));

	templateBuilder.Append("\"><img width=\"40\" height=\"40\" alt=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.img_url));
	templateBuilder.Append("\"></a>\r\n          ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n        </td>\r\n        <td align=\"center\">" + Utils.ObjectToStr(dr["accept_name"]) + "</td>\r\n        <td align=\"center\"><strong>￥" + Utils.ObjectToStr(dr["order_amount"]) + "</strong><br />");
	templateBuilder.Append(get_payment_title(Utils.StrToInt(Utils.ObjectToStr(dr["payment_id"]), 0)).ToString());

	templateBuilder.Append("</td>\r\n        <td align=\"center\">" + Utils.ObjectToStr(dr["add_time"]) + "</td>\r\n        <td align=\"center\">");
	templateBuilder.Append(get_order_status(Utils.StrToInt(Utils.ObjectToStr(dr["id"]), 0)).ToString());

	templateBuilder.Append("</td>\r\n        <td align=\"center\"><a href=\"");
	templateBuilder.Append(linkurl("userorder_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">查看订单</a></td>\r\n      </tr>\r\n      ");
	}	//end for if

	if (totalcount<1)
	{

	templateBuilder.Append("\r\n      <tr><td colspan=\"8\" align=\"center\">暂无记录</td></tr>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </table>\r\n    \r\n    <div class=\"page_foot\">\r\n      <div class=\"flickr right\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist2));
	templateBuilder.Append("</div><!--放置页码列表-->\r\n    </div>\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n  </div>\r\n</div>\r\n\r\n<div class=\"clear\"></div>\r\n\r\n<!--Footer-->\r\n\r\n<!--/Footer-->\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
