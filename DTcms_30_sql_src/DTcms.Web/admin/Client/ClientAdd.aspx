<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientAdd.aspx.cs" Inherits="DTcms.Web.admin.Client.ClientAdd" %>
<%@ Import Namespace="DTcms.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加客户</title>
<script type="text/javascript" src="/scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="/scripts/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="/scripts/swfupload/swfupload.js"></script>
<script type="text/javascript" src="/scripts/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="/scripts/swfupload/swfupload.handlers.js"></script>
<script type="text/javascript" src="../js/layout.js"></script>
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />

<link href="/css/common.css" rel="stylesheet" />
<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
    });
</script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="user_list.aspx" class="back"><i></i><span>返回列表页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
    <i class="arrow"></i>
  <span>客户管理</span>
  <i class="arrow"></i>
  <span>客户管理</span>
  <i class="arrow"></i>
  <span>添加客户</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">添加客户</a></li>
        
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">

  <dl>
    <dt>客户账号</dt>
    <dd><asp:TextBox ID="txtClientAccount" runat="server" CssClass="input normal" datatype="*2-20" sucmsg=" " ajaxurl="/ashx/ClientList.ashx?type=exit"></asp:TextBox> </dd>
  </dl> 
    <dl>
    <dt>客户全称</dt>
    <dd><asp:TextBox ID="txtClientName" runat="server" CssClass="input normal" datatype="*2-20" sucmsg=" " ></asp:TextBox></dd>
  </dl>
<%--  <dl>
    <dt>密码</dt>
    <dd><asp:TextBox ID="txtBatch" runat="server" CssClass="input normal" TextMode="Password" datatype="*6-20" nullmsg="请设置密码" errormsg="密码范围在6-20位之间" sucmsg=" "></asp:TextBox> <span class="Validform_checktip">*登录的密码，至少6位</span></dd>
  </dl>
  <dl>
    <dt>确认密码</dt>
    <dd><asp:TextBox ID="txtRetrospect" runat="server" CssClass="input normal" TextMode="Password" datatype="*" recheck="txtPassword" nullmsg="请再输入一次密码" errormsg="两次输入的密码不一致" sucmsg=" "></asp:TextBox> <span class="Validform_checktip">*再次输入密码</span></dd>
  </dl>--%>
  <dl>
    <dt>手机</dt>
    <dd><asp:TextBox ID="txtPhone" runat="server" CssClass="input normal" datatype="m" sucmsg=" "></asp:TextBox> </dd>
  </dl>
  <dl>
    <dt>地址</dt>
    <dd><asp:TextBox ID="txtClientAddress" runat="server" CssClass="input normal" datatype="*1-100" sucmsg=" "></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>邮箱</dt>
    <dd><asp:TextBox ID="txtEmail" runat="server" CssClass="input normal" datatype="e"></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>备注</dt>
    <dd><asp:TextBox ID="txtRemark" runat="server" CssClass="input normal"></asp:TextBox></dd>
  </dl>
    <dl>
    <dt></dt>
    <dd><asp:Button ID="Button1" runat="server" Text="提交"  CssClass="btn" OnClick="Button1_Click" /></dd>
  </dl>
    
    </div>
    
<!--/内容-->

<!--工具栏-->

<!--/工具栏-->
    <script type="text/javascript" src="/scripts/common.js"></script>
</form>
</body>
</html>
