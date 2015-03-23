<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarCodeCreate.aspx.cs" Inherits="DTcms.Web.admin.BarCode.BarCodeCreate" %>
<%@ Import Namespace="DTcms.Common" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>条码生成管理</title>
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

</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>条码生成</span>
  <i class="arrow"></i>
  <span>条码生成管理</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">条码生成管理</a></li>
        
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">

<%--  <dl>
      <dl>
    <dt>客户</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddlGroupId" runat="server"></asp:DropDownList>
      </div>
    </dd>
  </dl>
    <dt>商品名称</dt>
      <dd>
    <div class="rule-single-select">
        <asp:DropDownList id="DropDownList1" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>
      </div>
          </dd>
  </dl>--%> 
  <dl>
    <dt>商品件数</dt>
    <dd><asp:TextBox ID="txtGoodCount" runat="server" CssClass="input normal"  datatype="n" nullmsg="请设置商品件数" errormsg="必须是数字类型" sucmsg=" "  ></asp:TextBox></dd>
  </dl>
  <%--  <dl>
    <dt>商品条码</dt>
    <dd><asp:TextBox ID="TextBox5" runat="server" CssClass="input normal"  datatype="*6-20" nullmsg="请设置密码" errormsg="密码范围在6-20位之间" sucmsg=" "></asp:TextBox> <span class="Validform_checktip">*登录的密码，至少6位</span></dd>
  </dl>--%>
  <dl>
    <dt>追溯码</dt>
    <dd><asp:TextBox ID="txtRetrospect" runat="server" CssClass="input normal"  datatype="n4-4"  nullmsg="请输入追溯码" errormsg="4位数字的追溯码" sucmsg=" "></asp:TextBox> <span class="Validform_checktip"></span></dd>
  </dl>
    <dl>
    <dt>商品条码</dt>
    <dd><asp:TextBox ID="txtGoodBarCode" runat="server" CssClass="input normal" datatype="n2-2" errormsg="2位数字的商品条码" sucmsg=" "></asp:TextBox></dd>
  </dl>
  
  <dl>
    <dt>商品批次号</dt>
    <dd><asp:TextBox ID="txtBatch" runat="server" CssClass="input normal" datatype="s1-10" sucmsg=" " nullmsg="请输入批号" errormsg="1到10位字符串；"></asp:TextBox> <span class="Validform_checktip"></span></dd>
  </dl>
  <dl>
    <dt>商品箱数</dt>
    <dd><asp:TextBox ID="txtBoxsum" runat="server" CssClass="input normal" datatype="n" nullmsg="请设置商品箱数" errormsg="必须是数字类型" sucmsg=" "  ></asp:TextBox></dd>
  </dl>
  <%--<dl>
    <dt>操作人</dt>
    <dd><asp:TextBox ID="TextBox1" runat="server" CssClass="input normal"></asp:TextBox></dd>
  </dl>--%>
  
  <dl>
    <dt>生成时间</dt>
    <dd><asp:TextBox ID="txtCreateTime" runat="server" CssClass="input normal" ReadOnly="true"></asp:TextBox></dd>
  </dl>
    <dl>
    <dt>备注</dt>
    <dd><asp:TextBox ID="txtRemark" runat="server" CssClass="input normal"></asp:TextBox></dd>
  </dl>
    <dl>
    <dt><asp:Button ID="Button1" runat="server" Text="生成条形码" CssClass="btn" OnClick="Button1_Click" /></dt>
    <dd></dd>
  </dl>
    
    </div>
    
<!--/工具栏-->
    <script type="text/javascript">
        $(function () {
            //初始化表单验证
            $("#form1").Validform({
                tiptype:3,
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
                    },
                    "Boxsum": function (gets, obj, curform, regxp) {
                        //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
                        reg2 = /^\d{4}$/;
                        if (gets.length == 0 || reg2.test(gets)) {
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
    <script type="text/javascript" src="/scripts/common.js"></script>
    <script type="text/javascript">
        $("#txtBatch").blur(function () {
            if ($("#txtBatch").val().trim().length > 0) {
                $.ajax({
                    url: "/ashx/GetModel.ashx?id=" + $("#DropDownList1").val(),
                    success: function (msg) {
                        var myObject = JSON.parse(msg);
                        //var myObject = eval("(" + msg + ")");
                        $("#txtNickName").val(parseInt($("#txtBatch").val()) / parseInt(myObject.Standard));

                    }

                });
            }
        });
    </script>
</form>
</body>
</html>
