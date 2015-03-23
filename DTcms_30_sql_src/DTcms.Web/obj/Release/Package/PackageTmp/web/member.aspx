<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="DTcms.Web.web.member" %>
<%@ Register src="/layout/PersonCenter.ascx" tagname="PersonCenter" tagprefix="uc1" %>
<%@ Register src="/layout/head.ascx" tagname="head" tagprefix="uc2" %>
<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>会员中心-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
<link rel="stylesheet" type="text/css" href="style/style.css" id="style">
<link rel="stylesheet" type="text/css" href="style/animate.css">
<%--<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/maxshu.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/divselect.js"></script>--%>
<script type="text/javascript" src="/scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="/scripts/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="/admin/js/layout.js"></script>
    <script src="../scripts/jquery.validate.min.js"></script>
    <script src="/web/Using/layer/layer.min.js"></script>
    <link href="/web/Using/layer/skin/layer.css" rel="stylesheet" />
    <link href="/templates/green/css/style.css" rel="stylesheet" />
    <style>        body {
            text-align:left;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //初始化表单验证
            //$("#fpass").initValidform({
            //    btnSubmit: "#change",
            //    ajaxPost: true,
            //    callback: function (data) {
            //        if (data.status == "y") {
            //            setTimeout(function () {
            //                $.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes here.");
            //            }, 2000);
            //        }
            //    }

            //});
            //var demo = $("#fpass").Validform();
            //$("#change").click(function () {
            //    demo.ajaxPost();
            //    return false;
            //});

        //    demo.config={
        //        ajaxpost:{
        //            url:"",
        //                success:function(data,obj){
        //                    //data是返回的json数据;
        //                    //obj是当前表单的jquery对象;
        //                },
        //    error:function(data,obj){
        //        //data是{ status:**, statusText:**, readyState:**, responseText:** };
        //        //obj是当前表单的jquery对象;
        //    }
        //}
            //}

        });
</script>
    <style>
       
    </style>
<script type="text/javascript">

    $(document).ready(function () {

        //Default Action
        $(".tab-xbe_content").hide(); //Hide all content
        $("ul.tab-xbe li:first").addClass("active").show(); //Activate first tab
        $(".tab-xbe_content:first").show(); //Show first tab content

        //On Click Event
        $("ul.tab-xbe li").click(function () {
            $("ul.tab-xbe li").removeClass("active"); //Remove any "active" class
            $(this).addClass("active"); //Add "active" class to selected tab
            $(".tab-xbe_content").hide(); //Hide all tab content
            var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
            $(activeTab).fadeIn(); //Fade in the active content
            return false;
        });

    });
</script>
<script type="text/javascript">

    $(function () {

        /*当前页面导航高亮*/
        var href = window.location.href.split('/')[window.location.href.split('/').length - 1].substr(0, 4);
        if (href.length > 0) {
            $(function () {
                $("ul.nav a:first[href^='" + href + "']").attr("class", "on");
                if ($("ul.nav a:first[href^='" + href + "']").size() == 0) {
                    $("ul.nav a:first[href^='index']").attr("class", "on");
                }
            });
        } else {
            $(function () { $("ul.nav a:first[href^='index']").attr("class", "on") });
        }

        /*下拉菜单*/
        $(".nav li").hover(function () {
            $(this).parents(".nav > li").find("a:first").addClass("on2");
            $(this).find("ul:first").show(); //鼠标滑过查找li下面的第一个ul显示
        }, function () {
            var navobj = $(this).find("ul:first");
            navobj.hide();

            //鼠标离开隐藏li下面的ul
            if (navobj.attr("class") == "nav_sub") {
                $(this).find("a:first").removeClass("on2");
            }
        })

        //给li下面ul是s的样式的前一个同辈元素添加css
        $(".nav li ul li ul").prev().addClass("t");
    })

</script>
</head>

<body>
<!-- header-->
    <uc2:head ID="head1" runat="server" />
<!-- /header--> 
<!-- banner-->
<div class="fan_banner_member">
	<div class="bannBg_all">
		<div class="bannerCont">                           
            <uc1:PersonCenter ID="PersonCenter1" runat="server" />
                <div class="member_right">
             <div class="container">
                <ul class="tab-xbe">
                	<p class="left"></p>
                    <li><a href="#tab1" class="tab1"><span>我的资料</span></a></li>
                    <li><a href="#tab2" class="tab2"><span>修改资料</span></a></li>
                    <li><a href="#tab3" class="tab3"><span>修改密码</span></a></li>
            		<p class="right"></p>
                </ul>
                <div class="tab-xbe_container">
                    <form id="form1" runat="server">
                        
                    <div id="tab1" class="tab-xbe_content">
                        <div class="tab1_left usershow" >
                        	<%--<ul>
                            	<li><span>网站登录账号：</span><asp:Label runat="server" ID="user_name"></asp:Label></li>
                            	<li><span>会员昵称：</span><asp:Label runat="server" ID="nick_name"></asp:Label></li>
                            	<li><span>宝宝姓名：</span><asp:Label runat="server" ID="BabyName"></asp:Label></li>
                            	<li><span>宝宝昵称：</span><asp:Label runat="server" ID="BabyNickName"></asp:Label></li>
                            	<li><span>宝宝年龄：</span><asp:Label runat="server" ID="BabyAge"></asp:Label></li>
                            	<li class="notes">请不要随意修改日期，以免影响您的会员权益。</li>
                            </ul>--%>
                            <dl><dt>登录账号：</dt><dd><asp:Label runat="server" ID="user_name"></asp:Label></dd></dl>
                                <dl><dt>会员昵称：</dt><dd><asp:Label runat="server" ID="nick_name"></asp:Label></dd></dl>
                                <dl><dt>宝宝姓名：</dt><dd><asp:Label runat="server" ID="BabyName"></asp:Label></dd></dl>
                            <dl><dt>宝宝昵称：</dt><dd><asp:Label runat="server" ID="BabyNickName"></asp:Label></dd></dl>
                            <dl><dt>宝宝年龄：</dt><dd><asp:Label runat="server" ID="BabyAge"></asp:Label></dd></dl>
                        </div>                        
                     <%--   <div class="tab1_right">
                        	<div id="top-main">
                                <span></span>
                                <div class="mid w960 clearfix pr">
                                    <ul class="left-banner">
                                        <li>
                                        <img src="images/bb.jpg" /></li>
                                        <li style="left:-246px">
                                        <img src="images/bb01.jpg" />
                                        </li>
                                    </ul>
                                    <ul class="controller">
                                        <li data-ca="main-slide1" class="current"></li>
                                        <li data-ca="main-slide2"></li>
                                    </ul>
                        
                                </div>
                            </div>
                            <p class="red">您的宝宝正处于幼儿期</p>
                        </div>--%>
                    </div>
                    <div id="tab2" class="tab-xbe_content">
                        <div class="tab1_left">
                        	<%--<ul>
                            	<li><span>网站登录账号：</span><asp:Label runat="server" ID="lbluser_name"></asp:Label></li>
                            	<li><span>会员昵称：</span><asp:TextBox runat="server" ID="txtnick_name"></asp:TextBox></li>
                            	<li><span>宝宝姓名：</span><asp:TextBox runat="server" ID="txtBabyName"></asp:TextBox></li>
                            	<li><span>宝宝昵称：</span><asp:TextBox runat="server" ID="txtBabyNickName"></asp:TextBox></li>
                            	<li><span>宝宝年龄：</span><asp:TextBox runat="server" ID="txtBabyAge"></asp:TextBox></li>
                            	<li><span>&nbsp</span><asp:Button ID="btnUpdate" Text="修改" runat="server" CssClass="BtnPost" OnClick="btnUpdate_Click1" /></li>
                            </ul>--%>
                            <dl><dt>登录账号：</dt><dd><asp:Label runat="server" ID="lbluser_name"></asp:Label></dd></dl>
                                <dl><dt>会员昵称：</dt><dd><asp:TextBox runat="server" ID="txtnick_name"></asp:TextBox></dd></dl>
                                <dl><dt>宝宝姓名：</dt><dd><asp:TextBox runat="server" ID="txtBabyName"></asp:TextBox></dd></dl>
                            <dl><dt>宝宝昵称：</dt><dd><asp:TextBox runat="server" ID="txtBabyNickName"></asp:TextBox></dd></dl>
                            <dl><dt>宝宝年龄：</dt><dd><asp:TextBox runat="server" ID="txtBabyAge"></asp:TextBox></dd></dl>
                                <dl><dt>&nbsp;</dt><dd><asp:Button ID="btnUpdate" Text="修改" runat="server" CssClass="BtnPost" OnClick="btnUpdate_Click1" /></dd></dl>
                        </div>
                    </div>
                    </form>
                    <div id="tab3" class="tab-xbe_content">
                        <div class="tab1_left" style="width:550px">
                            <form id="fpass" >
                                <dl><dt>旧密码：</dt><dd><input type="password" id="oldpass" name="oldpass" class="input_register" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！" /></dd></dl>
                                <dl><dt>新密码：</dt><dd><input type="password" id="newpass" name="newpass" class="input_register" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！" /></dd></dl>
                                <dl><dt>确认新密码：</dt><dd><input type="password" name="confirm_password" class="input_register" datatype="*" recheck="newpass" errormsg="您两次输入的账号密码不一致！" /></dd></dl>
                                <dl><dt>&nbsp;</dt><dd><input type="button" value="修改" id="change" class="BtnPost"/></dd></dl>
                                </form>
                        </div>                       
                    </div>
                    
                </div>
            </div>
            </div>
            
		    
            
		</div>	
	</div>
</div>
<!-- /banner--> 
<!-- footer-->
    <uc3:foot ID="foot" runat="server" />
<!-- /footer-->
<script>
    //ҳֲ
    ; (function ($) {
        $.fn.fadeAnimate = function (options) {
            options = $.extend({
                liDomList: $(this).find('li'),
                liDomListLen: $(this).find('li').length,
                disableAutoEle: $('#account-box'),
                curIndex: 0,
                nextIndex: 1,
                curDom: undefined,
                nextDom: undefined,
                curLeft: 0,
                minLeft: -246,
                fadeLock: false,
                fadeTime: 5000,
                imgWidth: 246,
                controller: $('#top-main .controller'),
                controllerList: $('#top-main .controller li'),
                timer: undefined,
                accSpeed: 4,
                Cx: 0.02, //ϵ
                minRes: 1, //С
                curSpeed: 0
            }, options);

            //ƶ
            function changeTo(index) {
                if (true == options.fadeLock) { return; }
                window.clearTimeout(options.timer);
                options.nextIndex = index;
                options.fadeLock = true;

                //ʼ
                options.curDom = options.liDomList.eq(options.curIndex);
                options.nextDom = options.liDomList.eq(options.nextIndex);
                options.nextDom.css('opacity', 0);
                options.curLeft = 0;
                options.curSpeed = 0;
                options.nextDom.css('left', options.curLeft + options.imgWidth);
                controlChange(options.nextIndex);

                move();
            }

            //
            function move() {
                var nextLeft = getNextLeft();
                var opacity = Math.abs(nextLeft / options.imgWidth);
                var opacityPer = parseInt(opacity * 100);
                options.curDom.css({ 'left': nextLeft, 'opacity': 1 - opacity, 'filter': 'alpha(opacity=' + (100 - opacityPer) + ')' });

                options.nextDom.css({ 'left': nextLeft + options.imgWidth, 'opacity': opacity, 'filter': 'alpha(opacity=' + opacityPer + ')' });
                if (nextLeft <= options.minLeft) {
                    options.curIndex = options.nextIndex;
                    options.fadeLock = false;
                    autoFade();
                } else {
                    window.setTimeout(move, 20);
                }
            }

            //ȡ´ٶ
            function getNextSpeed() {
                var incSpeed = options.accSpeed - options.minRes - options.curSpeed * options.Cx;
                return options.curSpeed += incSpeed;
            }

            //ȡ´αleft
            function getNextLeft() {
                var nextSpeed = getNextSpeed();
                options.curLeft = options.curLeft - nextSpeed < options.minLeft ? options.minLeft : options.curLeft - nextSpeed;
                return options.curLeft;
            }

            //ȡ¸
            function changeNext() {
                var nextIndex = options.curIndex + 1 >= options.liDomListLen ? 0 : options.curIndex + 1;
                changeTo(nextIndex);
            }

            //ֲͼťЧ
            options.controller.delegate('li', 'click', function (e) {
                var index = $(e.currentTarget).index();
                changeTo(index);
            });


            //ֶ
            function controlChange(index) {
                options.controllerList.eq(index).addClass('current').siblings('.current').removeClass('current');
            }

            //Զֲ
            function autoFade() {
                window.clearTimeout(options.timer);
                options.timer = window.setTimeout(changeNext, options.fadeTime);
            }

            autoFade();

            /*
            options.disableAutoEle.focusin(function(){
                window.clearTimeout(options.timer);	
            }).focusout(function(){
                autoFade();
            })
            */

            $(this).mouseenter(function () {
                window.clearTimeout(options.timer);
            }).mouseleave(function () {
                autoFade();
            });

            return $(this);
        }
    })(jQuery);
    $('#top-main .left-banner').fadeAnimate({});
    
  
    $("#change").click(function () {
        if ($("#fpass").valid()) {
                $.ajax({
                    url: "/ashx/ChangePassword.ashx",
                    type: "Post",
                    data: "oldpass=" + $("#oldpass").val() + "&newpass=" + $("#newpass").val(),
                    success: function (msg) {
                        if (msg == "0")
                        {
                            layer.alert('原密码错误', 8, !1);
                        }
                        if (msg == "1") {
                            layer.alert('修改成功', 1, !1);
                        }
                        if (msg == "2") {
                            layer.alert('修改失败', 8, !1);
                        }
                    }
                });
        }
    })
    $().ready(function () {
        jQuery.validator.addMethod("isMobile", function (value, element) {
            var tel = /^(130|131|132|133|134|135|136|137|138|139|150|153|157|158|159|180|187|188|189)\d{8}$/;
            return tel.test(value) || this.optional(element);
        }, "请输入正确的手机号码");
        $("#fpass").validate({
            rules: {
                oldpass: {
                    required: true,
                    minlength: 6
                },
                newpass: {
                    required: true,
                    minlength: 6
                },
                confirm_password: {
                    required: true,
                    minlength: 6,
                    equalTo: "#newpass"
                }
            },
            messages: {
                oldpass: {
                    required: "6-18位",
                    minlength: "6-18位"
                },
                newpass: {
                    required: "6-18位",
                    minlength: "6-18位"
                },
                confirm_password: {
                    required: "6-18位",
                    minlength: "6-18位",
                    equalTo: "两次密码不一致"
                }
            }
        });
    });
    $(".usershow dl").each(function (i) {
        if (i % 2 == 0)
        {
            $(this).css("background", "#FFF8DE");
        }
    });
</script>
</body>
</html>
