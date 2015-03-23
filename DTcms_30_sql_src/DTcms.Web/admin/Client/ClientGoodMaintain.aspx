<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientGoodMaintain.aspx.cs" Inherits="DTcms.Web.admin.Client.ClientGoodMaintain" %>
<%@ Import Namespace="DTcms.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>客户商品管理</title>
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
        $("#form1").Validform({
            tiptype: 3,
            datatype: {
                "BrokerageRatio": function (gets, obj, curform, regxp) {
                    //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
                    reg1 = /^[0-9]+\.{0,1}[0-9]*$/;
                    if (reg1.test(gets)) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
            }
        });
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
  <span>客户商品管理</span>
  <i class="arrow"></i>
  <span>客户商品维护</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">客户商品维护</a></li>
        
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">

  <dl>
    <dt>客户名称</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddlGroupId" runat="server" ></asp:DropDownList>
      </div>
    </dd>
  </dl> 
  <dl>
    <dt>商品名称</dt>
    <dd><asp:TextBox ID="txtGoodCategoryName" runat="server" CssClass="input normal"  datatype="*2-50" nullmsg="请设置商品名称" errormsg="商品名称在2-50位之间" sucmsg=" " ajaxurl="/ashx/ClientGoodList.ashx?type=exit"></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>佣金比值</dt>
    <dd><asp:TextBox ID="txtBrokerageRatio" runat="server" CssClass="input normal" datatype="BrokerageRatio" sucmsg=" "></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>积分比值</dt>
    <dd><asp:TextBox ID="txtIntegralRatio" runat="server" CssClass="input normal" datatype="n" nullmsg="请设置积分比值" errormsg="必须是数字类型" sucmsg=" "  ></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>状态</dt>
      
    <dd><div class="rule-single-select">
        <asp:DropDownList id="drpState" runat="server" >
            <asp:ListItem Value="1">有效</asp:ListItem>
        <asp:ListItem Value="2">无效</asp:ListItem>
        </asp:DropDownList>
      </div>
        </dd>
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
