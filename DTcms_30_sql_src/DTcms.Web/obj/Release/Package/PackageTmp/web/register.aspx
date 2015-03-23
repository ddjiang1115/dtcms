<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DTcms.Web.web.register" %>

<%@ Register Src="/layout/head.ascx" TagName="head" TagPrefix="uc2" %>
<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员中心注册-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
    <script type="text/javascript" src="/scripts/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/scripts/jquery/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" src="/scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
    <script type="text/javascript" src="/scripts/datepicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/admin/js/layout.js"></script>
    <script src="/scripts/jquery.validate.min.js"></script>
    <script src="/web/js/layer.min.js"></script>
    <link href="/web/style/layer.css" rel="stylesheet" />
    <link href="/web/style/layer.ext.css" rel="stylesheet" />
    <style>
        label.error {
            margin-left: 5px;
            color: red;
            float:left;
        }
        
    </style>
   <%-- <script type="text/javascript">
        $(function () {
            //初始化表单验证
            $("#signupForm").initValidform();
        });
</script>--%>
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
    <div class="fan_banner_register">
        <div class="bannBg_all">
            <div class="bannerCont">
                <div class="fan_register">
                    <div class="fan_register_top">
                        <span class="top">会员注册</span>
                    </div>

                    <div class="">
                        <form id="signupForm" method="post" runat="server">
                            <div class="middle_register">
                                <dl>
                                    <dt>手机号码：</dt>
                                    <dd>
                                        <input type="text" name="tel" id="tel" class="input_register" runat="server" datatype="m" nullmsg="请输入手机号码！" errormsg="手机号码格式不对！" ajaxurl="/ashx/Verification.ashx?action=tel" /><label class="Validform_checktip"></label></dd>
                                    <dd><label></label></dd>
                                </dl>
                                <%--<dl>
                                    <dt>验证码：</dt>
                                    <dd>
                                        <input type="text" name="validate" id="validate" class="input_register" runat="server" style="width: 60px;" />&nbsp;&nbsp;
                                <a id="verifyCode" href="javascript:;">
                                    <img src="/tools/verify_code.ashx" id="imgverify" width="80" height="22" style="position: relative; top: 7px;" />
                                    看不清楚？</a>

                                    </dd>
                                </dl>--%>


                                <dl>
                                    <dt>短信验证码：</dt>
                                    <dd>
                                        <input type="text" name="telvalidate" id="telvalidate" class="input_register" runat="server" style="width: 60px;" />&nbsp;
                                <input type="button" value="获取验证码" style="padding: 4px;" id="imgverify" /></dd>
                                    <dd><label></label></dd>
                                </dl>
                                <dl>
                                    <dt>登录密码：</dt>
                                    <dd>
                                        <input type="password" name="txtPassword" id="txtPassword" class="input_register" runat="server" datatype="*6-15" errormsg="密码范围在6~15位之间！" /></dd>
                                    <dd><label></label></dd>
                                </dl>
                                <dl>
                                    <dt>确认密码：</dt>
                                    <dd>
                                        <input type="password" name="confirm_password" id="confirm_password" class="input_register" runat="server" datatype="*" recheck="txtPassword" errormsg="您两次输入的账号密码不一致！" /></dd>
                                    <dd><label></label></dd>
                                </dl>
                                <dl>
                                    <dt>
                                        <input id="qryd" name="qryd" type="checkbox" datatype="*" errormsg="密码范围在6~15位之间！"/><label></label></dt>
                                    <dd>我已阅读并接受旭贝尔会员中心服务条款</dd>
                                    <dd><label></label></dd>
                                </dl>
                                <dl>
                                    <dt>&nbsp;</dt>
                                    <dd>
                                        <asp:Button ID="btnpost" runat="server" Text="立即注册" CssClass="sub" OnClick="btnpost_Click" /></dd>
                                </dl>
                            </div>
                            <script type="text/javascript">
                                $("#verifyCode").click(function () {
                                    $("#imgverify").attr("src", "/tools/verify_code.ashx?t=" + (new Date()).valueOf());
                                });
</script>
                            <script type="text/javascript">

                                //$("#verifyCode").click(function () {
                                //    $("#imgverify").attr("src", "/tools/verify_code.ashx?t=" + (new Date()).valueOf());
                                //});

                                $("#imgverify").click(function () {
                                    $.ajax({
                                        url: "/tools/verify_code.ashx?tel="+$("#tel").val()+"&t=" + (new Date()).valueOf(),
                                        type: "get",
                                        sucess: function () { }
                                    });
                                    $(this).attr("disabled", "disabled");
                                    var t = 60;
                                    var _interval = window.setInterval(function () {
                                        t=t-1
                                         $("#imgverify").val(t + "秒后发送短信");
                                          
                                    }, 1000);
                                    window.setTimeout(function () {
                                        clearInterval(_interval);
                                        $("#imgverify").removeAttr("disabled");
                                        $("#imgverify").val("获取验证码");
                                    }, 60000);
                                });
                                $().ready(function () {
                                    jQuery.validator.addMethod("isMobile", function (value, element) {
                                        var tel = /^(130|131|132|133|134|135|136|137|138|139|150|153|157|158|159|180|187|188|189|186|170)\d{8}$/;
                                        return tel.test(value) || this.optional(element);
                                    }, "请输入正确的手机号码");

                                    $("#signupForm").validate({
                                        rules: {
                                            tel: {
                                                required: true,
                                                isMobile: true,
                                                remote: {
                                                    type: "GET",
                                                    url: "/ashx/Verification.ashx?action=tel2",
                                                    data: {
                                                        tel: function () { return $("#tel").val(); }
                                                    }
                                                }
                                            },
                                            txtPassword: {
                                                required: true,
                                                minlength: 6
                                            },
                                            confirm_password: {
                                                required: true,
                                                minlength: 6,
                                                equalTo: "#txtPassword"
                                            },
                                           
                                            telvalidate: {
                                                required: true,
                                                remote: {
                                                    type: "POST",
                                                    url: "/ashx/verifyCode.ashx",
                                                    data: {
                                                        name: function () { return $("#telvalidate").val(); }
                                                    }
                                                }
                                            },
                                            qryd: {
                                                required: true
                                                }

                                        },
                                        messages: {
                                            tel: {
                                                required: "请输入手机号码",
                                                isMobile: "手机格式错误",
                                                remote: "该手机号码已存在"
                                            },
                                            txtPassword: {
                                                required: "6-18位",
                                                minlength: "6-18位"
                                            },
                                            confirm_password: {
                                                required: "6-18位",
                                                minlength: "6-18位",
                                                equalTo: "两次密码不一致"
                                            },
                                            qryd: {
                                                required: "您还未接受服务条款"
                                            },
                                            telvalidate: "错误"

                                        },
                                        submitHandler: function (form) {
                                            form.submit(); //没有这一句表单不会提交
                                        },
                                        errorElement:"label",
                                        errorPlacement: function (error, element) {
                                            //var placement = $(element.parent("td").parent("tr").next("tr").find("td").get(1));
                                            //placement.text('');
                                            error.appendTo(element.parent().parent());
                                        }
                                    });
                                });
                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /banner-->
    <!-- footer-->
    <uc1:foot ID="foot1" runat="server" />
    <!-- /footer-->
    
</body>
</html>
