<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="DTcms.Web.qj_Point.userLogin" %>

<%@ Register Src="../layout/head.ascx" TagName="head" TagPrefix="uc1" %>

<%@ Register Src="../layout/foot.ascx" TagName="foot" TagPrefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员登录-旭贝尔积分商城</title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/maxshu.js"></script>
    <script src="js/member.js"></script>
    <script src="../templates/green/js/login_validate.js"></script>
</head>
<body>
    <form id="loginform" name="loginform" url="/tools/submit_ajax.ashx?action=user_login" runat="server">
        <uc1:head ID="head1" runat="server" />
        <div class="fan_banner_register">
            <div class="bannBg_all">
                <div class="bannerCont">
                    <div class="fan_register">
                        <div class="fan_register_top">
                            <span class="top">会员登录</span>
                        </div>
                        <div class="middle">
                            <div class="middle_register">
                                <p class="title">请输入您的用户名：</p>
                                <p class="reg_input"><span class="star">*</span><input type="text" name="txtUserName" id="txtUserName" class="input" /></p>
                                <p class="title">密码：</p>
                                <p class="reg_input"><span class="star">*</span><input type="password" name="txtPassword" id="txtPassword" class="input" /></p>
<%--                                  <p class="title">验证码：</p>
                              <p class="reg_input">
                                    <span class="star">*</span><input type="text" name="validate" id="validate" class="input" maxlength="4" />
                                    <span>
                                        <input name="code" class="code" type="submit" value="发送验证码" /></span>
                                </p>--%>
<%--                                <p class="title">
                                    <input name="qryd" type="checkbox" value="" />
                                    &nbsp;我已阅读并接受旭贝尔会员中心服务条款</p>--%>
                                <div class="sub_div">
                                    <p>
                                        <input type="submit" value="登录" id="btnSubmit" name="btnSubmit" class="sub" /></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <uc2:foot ID="foot1" runat="server" />
    </form>
</body>
</html>
