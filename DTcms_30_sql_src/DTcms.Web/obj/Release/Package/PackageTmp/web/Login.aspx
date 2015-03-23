<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DTcms.Web.web.Login" %>
<%@ Register src="/layout/head.ascx" tagname="head" tagprefix="uc2" %>
<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
    <link href="/templates/green/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="/templates/green/js/login_validate.js"></script>

</head>
<body>
    <uc2:head ID="head1" runat="server" />
    <div class="clear"></div>
        <div class="boxwrap">
  <div class="main_box" style="padding-top:50px;">
    <h1 class="main_tit">
      会员登录<strong></strong>
    </h1>

    <div class="login-box">
    <div class="left-box">
      <form id="loginform" name="loginform" url="/tools/submit_ajax.ashx?action=user_login">
      <dl>
        <dt>用户名：</dt>
        <dd><input id="txtUserName" name="txtUserName" class="input txt" type="text" maxlength="50" /></dd>
      </dl>
      <dl>
        <dt>密　码：</dt>
        <dd><input id="txtPassword" name="txtPassword" class="input txt required" type="password" maxlength="100" /></dd>
      </dl>
      <dl>
        <dt></dt>
        <dd>
          <input id="chkRemember" name="chkRemember" class="checkbox" type="checkbox" style="vertical-align:middle">
          <label class="red" for="chkRemember">一周内自动登录</label>
        </dd>
      </dl>
      <dl>
        <dt></dt>
        <dd>
          <input id="btnSubmit" name="btnSubmit" type="submit" class="btn_login" value="会员登录" /> <a class="btn_login" href="/admin/login.aspx">门店登录</a>
          <%--<a href="/repassword/confirm.html">忘记密码？</a>--%>
        </dd>
      </dl>
      <dl id="msgtips">
        <dt></dt>
        <dd></dd>
      </dl>
      <input id="turl" name="turl" type="hidden" value="/web/member.aspx" />
      </form>
      <!--第三方登录-->
      <%--<div class="oauth_inner">
        <label>其它登录方式</label>
        <div class="oauth_list">
           <!--取得一个DataTable-->
          
          <a title="用QQ帐号登录" href="/api/oauth/qq/index.aspx"><img src="/upload/201301/22/201301222356267017.png" /></a>
          
          <a title="用新浪微博登录" href="/api/oauth/sina/index.aspx"><img src="/upload/201301/22/201301222358108990.png" /></a>
          
          <a title="用淘宝账号登录" href="/api/oauth/taobao/index.aspx"><img src="/upload/201301/22/201301222359116140.png" /></a>
          
          <a title="用开心网帐号登录" href="/api/oauth/kaixin/index.aspx"><img src="/upload/201301/22/201301222359597445.png" /></a>
          
          <a title="用人人网帐号登录" href="/api/oauth/renren/index.aspx"><img src="/upload/201301/23/201301230000421311.png" /></a>
          
          <a title="用飞信账号登录" href="/api/oauth/feixin/index.aspx"><img src="/upload/201301/23/201301230001220360.png" /></a>
          
        </div>
      </div>--%>
      <!--/第三方登录-->
    </div>
    <div class="center-box"></div>
    <div class="right-box">
      <p class="note">我们诚挚地邀请您加入我们<br /></p>
      <p>如果您还没有会员(门店)账户</p>
      <p class="button">
        <a href="/web/register.aspx">会员注册</a> <a href="/admin/Register.aspx">门店注册</a>
      </p>
    </div>
    <div class="clear"></div>
  </div>

    <div class="clear"></div>
  </div>
</div>

<div class="clear"></div>
     <uc3:foot ID="foot" runat="server" />
    <%--</form>--%>
</body>
</html>
