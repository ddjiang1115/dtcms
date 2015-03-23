<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonCenter.ascx.cs" Inherits="DTcms.Web.layout.PersonCenter" %>
<script src="/web/js/layer.min.js"></script>
    <link href="/web/style/layer.css" rel="stylesheet" />
    <link href="/web/style/layer.ext.css" rel="stylesheet" />
<div class="member_left">
            	<p class="member_title">会员中心</p>
                <p class="member_pic"><span></span><img id="img" runat="server" src="/templates/green/images/user_avatar.png" width="145" height="145"></p>
                <p class="member_name"><%--<asp:Label ID="lblUserName" runat="server"></asp:Label>--%><a id="changeimg" href="javascript:void(0)">设置头像</a></p>
                <div class="list">
                	<ul>
                    	<li><a href="member.aspx" class="on">我的资料</a></li>
                    	<li><a href="/qj_Point/product.aspx">积分商城</a></li>
                    	<li><a href="/web/Order.aspx">兑换明细</a></li>
                    	<li><a href="/web/integration.aspx">我要兑换</a></li>
                    	<%--<li><a href="#">最新活动</a></li>
                    	<li><a href="#">宝贝相册</a></li>
                    	<li><a href="#">我的兑换</a></li>
                    	<li><a href="#">我的记录</a></li>
                    	<li><a href="#">修改密码</a></li>--%>
                    	<li><a id="exit2" style="cursor:pointer;">退出</a></li>
                    </ul>
                </div>
            </div>
<script type="text/javascript">
    $("#exit2").click(function () {
        $.ajax({
            async: false,
            type: "GET",
            url: "/ashx/Verification.ashx?action=Exit",
            success: function (msg) {
                location.href = "/Default.aspx";
            }
        });

    });
    $("#changeimg").click(function () {
        $.layer({
            type: 2,
            shadeClose: true,
            title: false,
            closeBtn: [0, true],
            shade: [0.8, '#000'],
            border: [0],
            offset: ['20px', ''],
            area: ['1000px', ($(window).height() - 50) + 'px'],
            iframe: { src: '/user/center/avatar.html' },
            close: function (index)
            {
                //location.href = '/web/member.aspx'
                $.ajax({
                    async: false,
                    type: "GET",
                    url: "/ashx/Verification.ashx?action=Avatar",
                    success: function (msg) {
                        location.href = "/web/member.aspx";
                    }
                });
            }
        });
    });
    var url = location.href;
    $(".list a").removeClass("on");
    if (url.indexOf('integration')>-1)
    {
        $("a:contains('我要兑换')").addClass("on");
    }
    if (url.indexOf('Order') > -1) {
        $("a:contains('兑换明细')").addClass("on");
    }
    if (url.indexOf('member') > -1) {
        $("a:contains('我的资料')").addClass("on");
    }
</script>