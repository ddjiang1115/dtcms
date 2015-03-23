<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="DTcms.Web.admin.SellerManage.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>代消费者会员积分</title>
<script type="text/javascript" src="/scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="/scripts/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="/admin/js/layout.js"></script>
<link href="/admin/skin/default/style.css" rel="stylesheet" type="text/css" />
<link href="/css/common.css" rel="stylesheet" />
    <script src="/web/Using/layer/layer.min.js"></script>
    <link href="/web/Using/layer/skin/layer.css" rel="stylesheet" />
<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
        //初始化上传控件
        $(".upload-img").each(function () {
            $(this).InitSWFUpload({ sendurl: "/tools/upload_ajax.ashx", flashurl: "/scripts/swfupload/swfupload.swf" });
        });
    });
</script>
    <style>
        .IntegralCode{background:url("/web/images/seatch.ele.png") no-repeat;margin-left:-15px; cursor:pointer;}
    </style>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
    <i class="arrow"></i>
  <span>促销员管理</span>

  <i class="arrow"></i>
  <span>代消费者会员积分</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">代消费者会员积分</a></li>
        
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
    <dl>
    <dt>手机号码</dt>
    <dd><asp:TextBox ID="tel" runat="server" CssClass="input normal" datatype="m" nullmsg="请输入手机号码！" errormsg="手机号码格式不对！" ajaxurl="/ashx/Verification.ashx?action=tel"></asp:TextBox><label class="Validform_checktip"></label> </dd>
  </dl>
    <dl>
    <dt>确认手机号码</dt>
    <dd><asp:TextBox ID="TextBox1" runat="server" CssClass="input normal" datatype="*" recheck="tel" nullmsg="请再输入一次手机号码！" errormsg="您两次输入的手机号码不一致！"></asp:TextBox><label class="Validform_checktip"></label> </dd>
  </dl>
 <%-- <dl>
    <dt>积分码</dt>
    <dd><asp:TextBox ID="IntegralCode" runat="server" CssClass="input normal"></asp:TextBox> </dd>
  </dl>--%>
    <dl>
    <dt></dt>
    <dd><asp:Button ID="Button1" runat="server" Text="提交"  CssClass="btn" OnClick="Button1_Click" /></dd>
  </dl>
    
    </div>
    
<!--/内容-->

<!--工具栏-->

<!--/工具栏-->
    <script type="text/javascript" src="/scripts/common.js"></script>
    <script type="text/javascript">
        
        function CreateTxt() {
            var $input = $("<dl><dt>积分码：</dt><dd><input name='IntegralCode' type='text' class='input normal ' datatype='n10-10' nullmsg='请输入10位数字！' errormsg='请输入10位数字！' ajaxurl='/ashx/Verification.ashx?action=IntegralCode'/><a class='IntegralCode'>&nbsp;&nbsp;&nbsp;</a> <tr/><label >&nbsp;&nbsp;回车可增加多个积分码</label></dd></dl>");
            //$input.find("input").focus();
            var $btn = $("#Button1").parent().parent();
            $("#Button1").parent().parent().remove();           
            $(".tab-content").append($input);
            $(".tab-content").append($btn);
            $(".IntegralCode").click(function () {
                $(this).parent().parent().remove();
            });
        };
        CreateTxt();
        //$(".IntegralCode").click(function () {
        //    $(this).parent().parent().remove();
        //});
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 27) { // 按 Esc 
                //要做的事情
            }
            if (e && e.keyCode == 113) { // 按 F2 
                //要做的事情
            }
            if (e && e.keyCode == 13) { // enter 键
                //$(".tab-content").append("<dl><dt>&nbsp;</dt><dd><asp:TextBox  runat='server' CssClass='input normal'></asp:TextBox> </dd></dl>");
                CreateTxt();
                //return false;
            }
        };
        function TipSuccess()
        {
            layer.alert('积分成功', 1, !1);
        }
        function TipFail() {
            layer.alert('积分失败', 8, !1);
        }
</script>
    
</form>
</body>
</html>
