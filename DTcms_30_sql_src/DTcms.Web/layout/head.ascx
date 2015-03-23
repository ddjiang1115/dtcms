<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="head.ascx.cs" Inherits="DTcms.Web.layout.head" %>
<link rel="stylesheet" type="text/css" href="/Web/Css/style.css">
<script src="/Web/scripts/jquery-1.10.2.min.js"></script>
<style>
    .headerlogo{text-align:right; color:gray;}
        .headerlogo a {cursor:pointer;}
        .headerlogo label {color:blue;}
    .a_gray {color:gray;}
</style>
    <div class="header">
        <div class="header_ins">
            <h1 class="logo"><a href="javascript:;"></a></h1>
            <div class="txt"><a href="javascript:;">
                <img src="/web/images/tel.png" /></a></div>
            <div class="headerlogo">
            <div class="unonline" id="unonline" runat="server"><a href="/web/register.aspx">[注册]</a> <a href="/web/Login.aspx">[登录]</a></div>
            <div class="online" id="online" runat="server">会员ID:<label id="lblName" runat="server"></label>&nbsp;&nbsp;我的积分：<label runat="server" id="lblpoint"></label> &nbsp; &nbsp; &nbsp;<a class="a_gray" href="/web/integration.aspx">[我要积分]</a> <a class="a_gray" href="/web/member.aspx">[会员中心]</a> <a class="a_gray" id="exit">[退出]</a></div>
        </div>
        </div>
        
    </div>
    <div class="navArea">
        <div class="navBg">
            <ul class="nav">
                <li><a href="/">首  页</a></li>
                <li><a href="/web/import.aspx">100%美国进口</a></li>
                <li><a href="#">产品优势</a></li>
                <li><a href="/web/products.aspx">旭贝尔产品</a>
                    <ul class="nav_sub" style="display: none;">
                        <li><a href="/web/productsresult.aspx">美国生产流程</a></li>
                        <li><a href="/web/products.aspx">进口追溯体验</a></li>
                    </ul>
                </li>
                <li><a href="http://brightbeginnings.tmall.com/">在线购买</a></li>
                <li class="member_nav"><a  class="on2">会员俱乐部</a>
                    <ul class="nav_sub" style="display: none;">
                        <li><a href="/web/integration.aspx">我要积分</a></li>
                        <%--<li><a href="/web/Login.aspx">会员登录</a></li>
                        <li><a href="/user/center/index.html">会员中心</a></li>--%>
                        <li><a href="/web/member.aspx">会员中心</a></li>
                        
                        <li><a href="/qj_Point/product.aspx">积分商城</a></li>
                        <li><a href="/admin/Login.aspx">门店登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
<script type="text/javascript">
    $("#exit").click(function () {
        $.ajax({
            //async: false,
            type: "GET",
            url: "/ashx/Verification.ashx?action=Exit",
            success: function (msg) {
                window.top.opener = null; window.top.location = "/Default.aspx";
            }
        });
        
    });
</script>
<script type="text/javascript">
    $("li").mousemove(function () {
        $(this).children("ul").show();
    });
    $("li").mouseout(function () {
        $(this).children("ul").hide();
    });
</script>