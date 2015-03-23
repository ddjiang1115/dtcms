<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userInfo.ascx.cs" Inherits="DTcms.Web.layout.userInfo" %>
<ul>
    <%if (modelUser != null)
      { %>

    <li>欢迎您，会员：<span class="red"><%=modelUser.user_name%></span></li>
    <li>账户积分：<span class="red"><%=modelUser.point%></span></li>
    <li><a id="exit" href="javascript:void(0)">【退出】</a></li>
    <%}
      else
      { %>
    <li><a href="userLogin.aspx">【请登录】</a></li>
    <%}%>
</ul>
<script type="text/javascript">
    $("#exit").click(function () {
        $.ajax({
            type: "GET",
            url: "/ashx/Verification.ashx?action=Exit"
        });
        location.href = "/web/index.aspx";
    });
</script>
