﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.usermessage" ValidateRequest="false" %>
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
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>站内短信息 - ");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n<meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webkeyword));
	templateBuilder.Append("\" name=\"keywords\" />\r\n<meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webdescription));
	templateBuilder.Append("\" name=\"description\" />\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" />\r\n<link media=\"screen\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\">\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/lhgdialog/lhgdialog.js?skin=idialog\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n	function ExecPostBack(checkValue) {\r\n		if (arguments.length == 1) {\r\n			ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_message_delete', checkValue, 'turl');\r\n		}else{\r\n			var valueArr = '';\r\n			$(\"input[name='checkId']:checked\").each(function(i){\r\n				valueArr += $(this).val();\r\n				if(i < $(\"input[name='checkId']:checked\").length - 1){\r\n					valueArr += \",\"\r\n				}\r\n			});\r\n			ExecDelete('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_message_delete', valueArr, 'turl');\r\n		}\r\n    }\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body>\r\n<!--Header-->\r\n");

	templateBuilder.Append("<!--<div class=\"header\">\r\n  <div class=\"header_inner\">\r\n    <h1 class=\"logo\">\r\n      <a title=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.weburl));
	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</a>\r\n    </h1>\r\n    <ul class=\"nav\">\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">新闻资讯</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">购物商城</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">图片分享</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">资源下载</a></li>\r\n    </ul>\r\n    <div class=\"search\">\r\n      <input id=\"keywords\" name=\"keywords\" class=\"input\" type=\"text\" x-webkit-speech=\"\" autofocus=\"\" placeholder=\"输入回车搜索\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" />\r\n      <input class=\"submit\" type=\"submit\" value=\"搜索\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" />\r\n    </div>\r\n    <script type=\"text/javascript\">\r\n        $.ajax({\r\n            type: \"POST\",\r\n            url: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_check_login\",\r\n            dataType: \"json\",\r\n            timeout: 20000,\r\n            success: function (data, textStatus) {\r\n                if (data.status == 1) {\r\n                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a></li>');\r\n                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a></li>');\r\n                } else {\r\n                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a></li>');\r\n                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a></li>');\r\n                }\r\n            }\r\n        });\r\n    </");
	templateBuilder.Append("script>\r\n    <ul id=\"menu\" class=\"menu\">\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("shopping","cart"));

	templateBuilder.Append("\">购物车<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_cart_count\"></");
	templateBuilder.Append("script>件</a></li>\r\n    </ul>\r\n  </div>\r\n</div>-->\r\n<link href=\"/web/style/style.css\" rel=\"stylesheet\" />\r\n    <div class=\"header\">\r\n        <div class=\"header_ins\">\r\n            <h1 class=\"logo\"><a href=\"javascript:;\"></a></h1>\r\n            <div class=\"txt\"><a href=\"javascript:;\">\r\n                <img src=\"/web/images/tel.png\" /></a></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"navArea\">\r\n        <div class=\"navBg\">\r\n            <ul class=\"nav\">\r\n                <li><a href=\"/web/index.aspx\">首  页</a></li>\r\n                <li><a href=\"/web/import.aspx\">100%美国进口</a></li>\r\n                <li><a href=\"#\">产品优势</a></li>\r\n                <li><a href=\"/web/products.aspx\">旭贝尔产品</a>\r\n                    <ul class=\"nav_sub\" style=\"display: none;\">\r\n                        <li><a href=\"/web/productsresult.aspx\">美国生产流程</a></li>\r\n                        <li><a href=\"/web/products.aspx\">进口追溯体验</a></li>\r\n                    </ul>\r\n                </li>\r\n                <li><a href=\"#\">在线购买</a></li>\r\n                <li class=\"member_nav\"><a class=\"on2\">会员俱乐部</a>\r\n                    <ul class=\"nav_sub\" style=\"display: none;\">\r\n                        <li><a href=\"/web/Login.aspx\">会员登录</a></li>\r\n                        <li><a href=\"/user/center/index.html\">会员中心</a></li>\r\n                        <li><a href=\"/web/member.aspx\">会员设置</a></li>\r\n                        <li><a href=\"/qj_Point/product.aspx\">积分商城</a></li>\r\n                        <li><a href=\"/admin/Login.aspx\">经销商登录</a></li>\r\n                    </ul>\r\n                </li>\r\n            </ul>\r\n        </div>\r\n    </div>\r\n<script type=\"text/javascript\">\r\n    $(\"li\").mousemove(function () {\r\n        $(this).children(\"ul\").show();\r\n    });\r\n    $(\"li\").mouseout(function () {\r\n        $(this).children(\"ul\").hide();\r\n    });\r\n</");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"boxwrap\">\r\n  <div class=\"left180\">\r\n    <!--Sidebar-->\r\n    ");

	templateBuilder.Append("    <div class=\"sidebar\">\r\n      <h3>订单管理</h3>\r\n      <ul>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("userorder","list"));

	templateBuilder.Append("\">积分订单</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("userorder","close"));

	templateBuilder.Append("\">已关闭订单</a></li>\r\n      </ul>\r\n      <h3>账户管理</h3>\r\n      <ul>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("useramount","recharge"));

	templateBuilder.Append("\">账户余额</a></li>\r\n        <!--<li><a href=\"");
	templateBuilder.Append(linkurl("userpoint","convert"));

	templateBuilder.Append("\">我的积分</a></li>-->\r\n          <li><a href=\"/web/IntegralExchange.html\">我的积分</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\">站内短信</a></li>\r\n       <!-- <li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","invite"));

	templateBuilder.Append("\">邀请码</a></li>-->\r\n      </ul>\r\n      <h3>基本资料</h3>\r\n      <ul>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","proinfo"));

	templateBuilder.Append("\">个人资料</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","password"));

	templateBuilder.Append("\">修改密码</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出登录</a></li>\r\n      </ul>\r\n    </div>");


	templateBuilder.Append("\r\n    <!--/Sidebar-->\r\n  </div>\r\n  \r\n  <div class=\"right757\">\r\n    <h1 class=\"main_tit\">\r\n      <span><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">管理首页</a></span>\r\n      站内短信\r\n      <strong>Message</strong>\r\n    </h1>\r\n    ");
	if (action=="system")
	{

	templateBuilder.Append("\r\n    <!--系统消息-->\r\n    <div class=\"tab_head\">\r\n      <a class=\"add\" href=\"");
	templateBuilder.Append(linkurl("usermessage","add"));

	templateBuilder.Append("\">+ 写新消息</a>\r\n      <ul class=\"tabs\">\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\">收件箱</a></li>\r\n        <li class=\"selected\"><a href=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\">系统消息</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","send"));

	templateBuilder.Append("\">发件箱</a></li>\r\n      </ul>\r\n    </div>\r\n    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"mtable\">\r\n      ");
	DataTable list1 = get_user_message_list(10, page, "accept_user_name='"+userModel.user_name+"' and type=1", out totalcount);

	templateBuilder.Append(" <!--取得一个DataTable-->\r\n      ");
	string pagelist1 = get_page_link(10, page, totalcount, "usermessage1", action, "__id__");

	templateBuilder.Append(" <!--取得分页页码列表-->\r\n      ");
	int dr__loop__id=0;
	foreach(DataRow dr in list1.Rows)
	{
		dr__loop__id++;


	templateBuilder.Append("\r\n      <tr>\r\n        <td width=\"20\" align=\"center\">\r\n          ");
	if (Utils.ObjectToStr(dr["is_read"])=="1")
	{

	templateBuilder.Append("\r\n          <img title=\"已读\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/pm_1.gif\">\r\n          ");
	}
	else
	{

	templateBuilder.Append("\r\n          <img title=\"未读\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/pm_0.gif\">\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </td>\r\n        <td width=\"20\" align=\"center\"><input name=\"checkId\" class=\"checkall\" type=\"checkbox\" value=\"" + Utils.ObjectToStr(dr["id"]) + "\" ></td>\r\n        <td><a href=\"");
	templateBuilder.Append(linkurl("usermessage_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a></td>\r\n        <td width=\"150\">" + Utils.ObjectToStr(dr["post_time"]) + "</td>\r\n        <td width=\"38\"><a onclick=\"ExecPostBack('" + Utils.ObjectToStr(dr["id"]) + "');\" href=\"javascript:;\">删除</a></td>\r\n      </tr>\r\n      ");
	}	//end for if

	if (totalcount<1)
	{

	templateBuilder.Append("\r\n      <tr><td align=\"center\">暂无记录</td></tr>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </table>\r\n    \r\n    <div class=\"page_foot\">\r\n      <div class=\"flickr right\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist1));
	templateBuilder.Append("</div><!--放置页码列表-->\r\n      <div class=\"page_btns\">\r\n        <a onclick=\"checkAll(this);\" href=\"javascript:;\">全选</a>\r\n        <span class=\"pipe\">|</span>\r\n        <a onclick=\"ExecPostBack();\" href=\"javascript:;\">删除</a>\r\n      </div>\r\n    </div>\r\n    <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\" />\r\n    <!--系统消息-->\r\n    \r\n    <!--收件箱-->\r\n    ");
	}
	else if (action=="accept")
	{

	templateBuilder.Append("\r\n    <div class=\"tab_head\">\r\n      <a class=\"add\" href=\"");
	templateBuilder.Append(linkurl("usermessage","add"));

	templateBuilder.Append("\">+ 写新消息</a>\r\n      <ul class=\"tabs\">\r\n        <li class=\"selected\"><a href=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\">收件箱</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\">系统消息</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","send"));

	templateBuilder.Append("\">发件箱</a></li>\r\n      </ul>\r\n    </div>\r\n    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"mtable\">\r\n      ");
	DataTable list2 = get_user_message_list(10, page, "accept_user_name='"+userModel.user_name+"' and type=2", out totalcount);

	templateBuilder.Append(" <!--取得一个DataTable-->\r\n      ");
	string pagelist2 = get_page_link(10, page, totalcount, "usermessage1", action, "__id__");

	templateBuilder.Append(" <!--取得分页页码列表-->\r\n      ");
	int dr__loop__id=0;
	foreach(DataRow dr in list2.Rows)
	{
		dr__loop__id++;


	templateBuilder.Append("\r\n      <tr>\r\n        <td width=\"20\" align=\"center\">\r\n          ");
	if (Utils.ObjectToStr(dr["is_read"])=="1")
	{

	templateBuilder.Append("\r\n          <img title=\"已读\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/pm_1.gif\">\r\n          ");
	}
	else
	{

	templateBuilder.Append("\r\n          <img title=\"未读\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/pm_0.gif\">\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </td>\r\n        <td width=\"20\" align=\"center\"><input name=\"checkId\" class=\"checkall\" type=\"checkbox\" value=\"" + Utils.ObjectToStr(dr["id"]) + "\" ></td>\r\n        <td width=\"60\" align=\"center\">\r\n          ");
	string user_avatar = get_user_avatar(Utils.ObjectToStr(dr["post_user_name"]));

	if (user_avatar=="")
	{

	templateBuilder.Append("\r\n          <img src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/user_avatar.png\" width=\"48\" height=\"48\" />\r\n          ");
	}
	else
	{

	templateBuilder.Append("\r\n          <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(user_avatar));
	templateBuilder.Append("\" width=\"48\" height=\"48\" alt=\"" + Utils.ObjectToStr(dr["post_user_name"]) + "\" />\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </td>\r\n        <td><strong>" + Utils.ObjectToStr(dr["post_user_name"]) + "</strong><br /><a href=\"");
	templateBuilder.Append(linkurl("usermessage_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a></td>\r\n        <td width=\"150\">" + Utils.ObjectToStr(dr["post_time"]) + "</td>\r\n        <td width=\"30\"><a onclick=\"ExecPostBack('" + Utils.ObjectToStr(dr["id"]) + "');\" href=\"javascript:;\">删除</a></td>\r\n      </tr>\r\n      ");
	}	//end for if

	if (totalcount<1)
	{

	templateBuilder.Append("\r\n      <tr><td align=\"center\">暂无记录</td></tr>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </table>\r\n    \r\n    <div class=\"page_foot\">\r\n      <div class=\"flickr right\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist2));
	templateBuilder.Append("</div><!--放置页码列表-->\r\n      <div class=\"page_btns\">\r\n        <a onclick=\"checkAll(this);\" href=\"javascript:;\">全选</a>\r\n        <span class=\"pipe\">|</span>\r\n        <a onclick=\"ExecPostBack();\" href=\"javascript:;\">删除</a>\r\n      </div>\r\n    </div>\r\n    <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\" />\r\n    <!--/收件箱-->\r\n    \r\n    ");
	}
	else if (action=="send")
	{

	templateBuilder.Append("\r\n    <!--发件箱-->\r\n    <div class=\"tab_head\">\r\n      <a class=\"add\" href=\"");
	templateBuilder.Append(linkurl("usermessage","add"));

	templateBuilder.Append("\">+ 写新消息</a>\r\n      <ul class=\"tabs\">\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\">收件箱</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\">系统消息</a></li>\r\n        <li class=\"selected\"><a href=\"");
	templateBuilder.Append(linkurl("usermessage","send"));

	templateBuilder.Append("\">发件箱</a></li>\r\n      </ul>\r\n    </div>\r\n    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"mtable\">\r\n      ");
	DataTable list3 = get_user_message_list(10, page, "post_user_name='"+userModel.user_name+"' and type=3", out totalcount);

	templateBuilder.Append(" <!--取得一个DataTable-->\r\n      ");
	string pagelist3 = get_page_link(10, page, totalcount, "usermessage1", action, "__id__");

	templateBuilder.Append(" <!--取得分页页码列表-->\r\n      ");
	int dr__loop__id=0;
	foreach(DataRow dr in list3.Rows)
	{
		dr__loop__id++;


	templateBuilder.Append("\r\n      <tr>\r\n        <td width=\"20\" align=\"center\"><input name=\"checkId\" class=\"checkall\" type=\"checkbox\" value=\"" + Utils.ObjectToStr(dr["id"]) + "\" ></td>\r\n        <td width=\"60\" align=\"center\">\r\n          ");
	string user_avatar = get_user_avatar(Utils.ObjectToStr(dr["accept_user_name"]));

	if (user_avatar=="")
	{

	templateBuilder.Append("\r\n          <img src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/user_avatar.png\" width=\"48\" height=\"48\" />\r\n          ");
	}
	else
	{

	templateBuilder.Append("\r\n          <img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(user_avatar));
	templateBuilder.Append("\" width=\"48\" height=\"48\" alt=\"" + Utils.ObjectToStr(dr["accept_user_name"]) + "\" />\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </td>\r\n        <td><strong>" + Utils.ObjectToStr(dr["accept_user_name"]) + "</strong><br /><a href=\"");
	templateBuilder.Append(linkurl("usermessage_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a></td>\r\n        <td width=\"150\">" + Utils.ObjectToStr(dr["post_time"]) + "</td>\r\n        <td width=\"30\"><a onclick=\"ExecPostBack('" + Utils.ObjectToStr(dr["id"]) + "');\" href=\"javascript:;\">删除</a></td>\r\n      </tr>\r\n      ");
	}	//end for if

	if (totalcount<1)
	{

	templateBuilder.Append("\r\n      <tr><td align=\"center\">暂无记录</td></tr>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </table>\r\n    \r\n    <div class=\"page_foot\">\r\n      <div class=\"flickr right\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist3));
	templateBuilder.Append("</div><!--放置页码列表-->\r\n      <div class=\"page_btns\">\r\n        <a onclick=\"checkAll(this);\" href=\"javascript:;\">全选</a>\r\n        <span class=\"pipe\">|</span>\r\n        <a onclick=\"ExecPostBack();\" href=\"javascript:;\">删除</a>\r\n      </div>\r\n    </div>\r\n    <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("usermessage","send"));

	templateBuilder.Append("\" />\r\n    <!--、发件箱-->\r\n    \r\n    ");
	}
	else if (action=="add")
	{

	templateBuilder.Append("\r\n    <!--发布短信息-->\r\n    <link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/validate.css\" />\r\n	<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery.form.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/Validform_v5.3.2_min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n      $(function(){\r\n	    //初始化表单\r\n		AjaxInitForm('add_form', 'btnSubmit', 1, 'turl');\r\n	  });\r\n    </");
	templateBuilder.Append("script>\r\n    <div class=\"tab_head\">\r\n      <ul class=\"tabs\">\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","accept"));

	templateBuilder.Append("\">收件箱</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","system"));

	templateBuilder.Append("\">系统消息</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("usermessage","send"));

	templateBuilder.Append("\">发件箱</a></li>\r\n      </ul>\r\n    </div>\r\n    <div class=\"line10\"></div>\r\n    <form id=\"add_form\" name=\"add_form\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_message_add\">\r\n      <div class=\"form_box\">\r\n        <dl>\r\n          <dt>收件人：</dt>\r\n          <dd><input name=\"txtUserName\" id=\"txtUserName\" type=\"text\" class=\"input txt\" datatype=\"s1-50\"  nullmsg=\"请填写收件人用户名\" sucmsg=\" \" /></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt>标题：</dt>\r\n          <dd><input name=\"txtTitle\" id=\"txtTitle\" type=\"text\" class=\"input txt\" datatype=\"*1-50\" sucmsg=\" \" /></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt>内容：</dt>\r\n          <dd><textarea name=\"txtContent\" class=\"input required\" style=\"width:250px;height:80px;\" datatype=\"*\" sucmsg=\" \"></textarea></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt></dt>\r\n          <dd>\r\n            <label><input name=\"sendSave\" type=\"checkbox\" value=\"true\" checked=\"checked\" />保存到发件箱</label></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt></dt>\r\n          <dd>\r\n            <input id=\"txtCode\" name=\"txtCode\" class=\"input small\" type=\"text\" datatype=\"*\" sucmsg=\" \" style=\"ime-mode:disabled;text-transform:uppercase;\">\r\n              <a id=\"verifyCode\" href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"22\" /> 看不清楚？</a>\r\n          </dd>\r\n        </dl>\r\n        <dl>\r\n          <dt></dt>\r\n          <dd><input name=\"btnSubmit\" id=\"btnSubmit\" type=\"submit\" class=\"btn_submit\" value=\"确认发布\" /></dd>\r\n        </dl>\r\n      </div>\r\n    </form>\r\n    <input id=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(linkurl("usermessage","add"));

	templateBuilder.Append("\" />\r\n    <!--/发布短信息-->\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n    \r\n  </div>\r\n</div>\r\n\r\n<div class=\"clear\"></div>\r\n\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<!--<div class=\"footer\">\r\n  <div class=\"footer_inner\">\r\n    <div class=\"foot_nav\">\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首 页</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("content","about"));

	templateBuilder.Append("\">关于我们</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">新闻资讯</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">购物商城</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">资源下载</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">图片分享</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("feedback"));

	templateBuilder.Append("\">留言反馈</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("link"));

	templateBuilder.Append("\">友情链接</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a>|\r\n    </div>\r\n    <div class=\"clear\"></div>\r\n    <div class=\"copyright\">\r\n      <p>版权所有 动力启航软件工作室 粤ICP备11064298号 版本：V");
	templateBuilder.Append(Utils.GetVersion().ToString());

	templateBuilder.Append(" © Copyright 2009 - 2011. dtcms.net. All Rights Reserved. <script src=\"http://s24.cnzz.com/stat.php?id=1996164&web_id=1996164&show=pic\" language=\"JavaScript\"></");
	templateBuilder.Append("script>&nbsp; </p>\r\n    </div>\r\n  </div>\r\n</div>-->\r\n\r\n    <div class=\"footer\">\r\n        <div class=\"footer_ins\">\r\n            <div class=\"footer_nav\">\r\n                <div class=\"footer_nav_left\"><a href=\"javascript:;\"></a></div>\r\n                <div class=\"footer_nav_right\">\r\n                    <div class=\"footer_nav_right_top\">\r\n                        <ul>\r\n                            <li><a href=\"#\">网站地图</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li>\r\n                            <li><a href=\"#\">热点新闻</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li>\r\n                            <li><a href=\"#\">媒体中心</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li>\r\n                            <li><a href=\"#\">工作机会</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li>\r\n                            <li><a href=\"#\">联系我们</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"footer_nav_right_copyrihgt\">Copyright © Nutricia Early Life Nutrition (Shanghai) Co., Ltd. 沪ICP备13042062号-5 网站地图</div>\r\n                </div>\r\n            </div>\r\n            <div class=\"footer_logo\"><a href=\"javascript:;\"></a></div>\r\n        </div>\r\n    </div>");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
