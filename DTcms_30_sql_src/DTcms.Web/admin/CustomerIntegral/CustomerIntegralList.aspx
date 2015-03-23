<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerIntegralList.aspx.cs" Inherits="DTcms.Web.admin.CustomerIntegral.CustomerIntegralList" %>
<%@ Import Namespace="DTcms.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>消费者积分列表</title>
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
        <script charset="utf-8" src="/scripts/jquery.easyui.min.js"></script> 

<script src="/scripts/easyui-lang-zh_CN.js"></script> 

<link href="/css/easyui.css" rel="stylesheet" /> 

<link href="/css/icon.css" rel="stylesheet" /> 
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
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="user_list.aspx" class="back"><i></i><span>返回列表页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>消费者积分管理</span>
  <i class="arrow"></i>
  <span>消费者积分列表</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<table id="list_data" cellspacing="0" cellpadding="0" > 
</table>

<%--<div class="tab-content">

    <dl>
        <div class="d_result">           
            <div>
                <p class="sum">共有100条</p>
                <table class="t_result">
                    <tr><th>操作时间</th><th>消费者账号</th><th>商品</th><th>积分码</th><th>积分值</th><th>状态</th><th>备注</th><td>操作</td></tr>
                    <tr><td>333</td><td>333</td><td>333</td><td>333</td><td>333</td><td>3333</td><td>3333</td><td>3333</td></tr>
                    <tr><td>333</td><td>333</td><td>333</td><td>333</td><td>333</td><td>3333</td><td>3333</td><td>3333</td></tr>
                </table>
            </div>

        </div>
    </dl>
    </div>--%>
    

<!--/工具栏-->
    <script type="text/javascript" src="/scripts/common.js"></script>
    <script type="text/javascript">
            $('#list_data').datagrid({
                title: '消费者积分列表',
                iconCls: 'icon-edit',//图标 
                width: 'auto',
                height: 'auto',
                nowrap: true,
                striped: true,
                border: true,
                collapsible: false,//是否可折叠的 
                fit: false,//自动大小 
                fitColumns: true,
                url: '/ashx/CustomerIntegralList.ashx?type=select',
                //sortName: 'code', 
                //sortOrder: 'desc', 
                remoteSort: false,
                //idField: 'GoodCategoryID',
                singleSelect: false,//是否单选 
                //pagination: true,//分页控件 
                rownumbers: true,//行号 
                columns: [[
                    { field: 'IntegralCode', title: '条码编号', width: $(this).width() * 0.1 },
                    {
                        field: 'q', title: '条码属性', width: $(this).width() * 0.1,
                        formatter: function (value, rowData, rowIndex) {
                            return "积分码";
                        }
                    },
                    { field: 'IntegralRatio', title: '积分值', width: $(this).width() * 0.1 },
                    { field: 'CreateTime', title: '创建时间', width: $(this).width() * 0.1 },
                    { field: 'Remark', title: '备注', width: $(this).width() * 0.1 }
                ]]
            });
    </script>
</form>
</body>
</html>
