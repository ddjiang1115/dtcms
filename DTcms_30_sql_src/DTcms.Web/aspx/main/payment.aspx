﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.payment" ValidateRequest="false" %>
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
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>支付中心－");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n<link media=\"screen\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\">\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/js/base.js\"></");
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


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"boxwrap\">\r\n  <div class=\"cart_box\">\r\n    <h1 class=\"main_tit\">\r\n      支付中心<strong>Payment</strong>\r\n    </h1>\r\n    ");
	if (action=="confirm")
	{

	templateBuilder.Append("\r\n    <!--提交支付-->\r\n    <form id=\"pay_form\" name=\"pay_form\" method=\"post\" action=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("api/payment/");
	templateBuilder.Append(Utils.ObjectToStr(payModel.api_path));
	templateBuilder.Append("/index.aspx\" target=\"_blank\">\r\n    <input id=\"pay_order_no\" name=\"pay_order_no\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(order_no));
	templateBuilder.Append("\" />\r\n    <input id=\"pay_order_amount\" name=\"pay_order_amount\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(order_amount));
	templateBuilder.Append("\" />\r\n    <input id=\"pay_user_name\" name=\"pay_user_name\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.user_name));
	templateBuilder.Append("\" />\r\n    ");
	if (order_type=="recharge")
	{

	templateBuilder.Append("\r\n    <div class=\"form_box\">\r\n      <dl>\r\n        <dt>订单号：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(order_no));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>充值金额：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(order_amount));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>支付方式：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(payModel.title));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt></dt>\r\n        <dd><input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"btn_submit\" value=\"确认支付\" /></dd>\r\n      </dl>\r\n    </div>\r\n    <input id=\"pay_subject\" name=\"pay_subject\" type=\"hidden\" value=\"账户充值\" />\r\n    ");
	}
	else if (order_type=="buygoods")
	{

	templateBuilder.Append("\r\n    <div class=\"cart_step\">\r\n      <ul>\r\n        <li><span>1</span>放进购物车</li>\r\n        <li class=\"item\"><span>2</span>填写订单信息</li>\r\n        <li class=\"last selected\"><span>3</span>支付/确定订单</li>\r\n      </ul>\r\n    </div>\r\n    <div class=\"form_box\">\r\n      <dl>\r\n        <dt>订单号：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(order_no));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>收货人姓名：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.accept_name));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>送货地址：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.address));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>手机号码：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.mobile));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>固定电话：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.telphone));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>备注留言：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(orderModel.message));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>支付金额：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(order_amount));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>支付方式：</dt>\r\n        <dd>");
	templateBuilder.Append(Utils.ObjectToStr(payModel.title));
	templateBuilder.Append("</dd>\r\n      </dl>\r\n      <dl>\r\n        <dt></dt>\r\n        <dd><input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" class=\"btn_submit\" value=\"确认支付\" /></dd>\r\n      </dl>\r\n    </div>\r\n    <input id=\"pay_subject\" name=\"pay_subject\" type=\"hidden\" value=\"购买商品\" />\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n    </form>\r\n    <!--提交支付-->\r\n    ");
	}	//end for if

	if (action=="succeed")
	{

	templateBuilder.Append("\r\n    <!--支付成功-->\r\n    <div class=\"msg_tips\">\r\n      <div class=\"ico\"></div>\r\n      <div class=\"msg\">\r\n        <strong>支付成功啦！</strong>\r\n        <p>恭喜您，您的支付已经成功！</p>\r\n        <p>您可以点击这里进入<a href=\"/web/member.aspx\">会员中心</a>查看订单状态！</p>\r\n        <p>如有其它问题，请立即与我们客服人员联系。</p>\r\n      </div>\r\n    </div>\r\n    <!--支付成功-->\r\n    ");
	}	//end for if

	if (action=="error")
	{

	templateBuilder.Append("\r\n    <!--支付出错-->\r\n    <div class=\"msg_tips\">\r\n      <div class=\"ico error\"></div>\r\n      <div class=\"msg\">\r\n        <strong>出错啦，支付失败！</strong>\r\n        <p>支付过程中发生意处错误！</p>\r\n        <p>您可以点击这里进入<a href=\"/web/member.aspx\">会员中心</a>查看订单状态！</p>\r\n        <p>如您确实已经支付，请立即与我们客服人员联系。</p>\r\n      </div>\r\n    </div>\r\n    <!--支付出错-->\r\n    ");
	}	//end for if

	if (action=="login")
	{

	templateBuilder.Append("\r\n    <!--用户未登录-->\r\n    <div class=\"msg_tips\">\r\n      <div class=\"ico warning\"></div>\r\n      <div class=\"msg\">\r\n        <strong>对不起，请登录后再进行支付！</strong>\r\n        <p>您尚未登录或已经超时啦！</p>\r\n        <p>如果您已是会员用户，请<a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">点击这里进行登录</a>！</p>\r\n        <p>如果您尚未成为我们会员，请<a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">点击这里注册</a>。</p>\r\n      </div>\r\n    </div>\r\n    <!--用户未登录-->\r\n    ");
	}	//end for if

	if (action=="recharge")
	{

	templateBuilder.Append("\r\n    <!--用户余额不足-->\r\n    <div class=\"msg_tips\">\r\n      <div class=\"ico warning\"></div>\r\n      <div class=\"msg\">\r\n        <strong>对不起，您的余额不足本次支付！</strong>\r\n        <p>由于您选择的是余额支付，请确定您的余额是否足够！</p>\r\n        <p>如果余额不足，请<a href=\"");
	templateBuilder.Append(linkurl("useramount","recharge"));

	templateBuilder.Append("\">点击这里充值</a>后再进行后续支付！</p>\r\n        <p>如果有任何问题，请与我们客服取得联系。</p>\r\n      </div>\r\n    </div>\r\n    <!--用户余额不足-->\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n    <div class=\"clear\"></div>\r\n  </div>\r\n</div>\r\n\r\n<div class=\"clear\"></div>\r\n\r\n<!--Footer-->\r\n");

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
