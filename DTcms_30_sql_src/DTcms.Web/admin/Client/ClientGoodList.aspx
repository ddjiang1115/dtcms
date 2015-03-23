<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientList.aspx.cs" Inherits="DTcms.Web.admin.Client.ClientList" %>
<%@ Import Namespace="DTcms.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>客户商品列表</title>
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
  <span>客户商品列表</span>
</div>
<div class="line10"></div>
<!--/导航栏-->
    <table id="list_data" cellspacing="0" cellpadding="0" >
                </table>
    <script type="text/javascript" src="/scripts/common.js"></script>
    <script type="text/javascript">
        //datagrid初始化 
        $('#list_data').datagrid({
            title: '客户商品列表',
            iconCls: 'icon-edit',//图标 
            width: 'auto',
            height: 'auto',
            nowrap: true,
            striped: true,
            border: true,
            collapsible: false,//是否可折叠的 
            fit: false,//自动大小 
            fitColumns: true,
            url: '/ashx/ClientGoodList.ashx?type=select',
            //sortName: 'code', 
            //sortOrder: 'desc', 
            remoteSort: false,
            idField: 'GoodCategoryID',
            singleSelect: false,//是否单选 
            pagination: true,//分页控件 
            rownumbers: true,//行号 
            columns: [[
                { field: 'ClientName', title: '客户', width: $(this).width() * 0.1 },
                { field: 'GoodCategoryName', title: '商品名称', width: $(this).width() * 0.1 },
                //{
                //    field: 'State', title: '状态', width: $(this).width() * 0.1,
                //    formatter: function (value, rowData, rowIndex) {
                        
                //        if (rowData.State == "1") {
                //            return '有效'
                //        } else {
                //            return '无效';
                //        }
                //    }

                //},
                { field: 'CreateTime', title: '操作日期', width: $(this).width() * 0.1 },
                { field: 'Remark', title: '备注', width: $(this).width() * 0.1 },
                {
                    field: '', title: '操作',width: $(this).width() * 0.1,
                    formatter: function (value, rowData, rowIndex) {
                        return "<a href='/admin/Client/ClientGoodMaintain.aspx?GoodCategoryID=" + rowData.GoodCategoryID + "'>修改</a></a>";
                    }
                }
            ]],
            frozenColumns: [[
                { field: 'ck', checkbox: true }
            ]],
            toolbar: [
                {
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    location.href = '/admin/client/ClientGoodMaintain.aspx';
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-remove',
                handler: function () {
                    var rows = $('#list_data').datagrid('getSelections');
                    if (!rows || rows.length == 0) {
                        $.messager.alert('提示', '请选择要删除的数据!', 'info');
                        return;
                    }
                    var parm;
                    $.each(rows, function (i, n) {
                        if (i == 0) {

                            parm = n.GoodCategoryID;

                        } else {

                            parm += "," + n.GoodCategoryID;
                        }
                    });
                    $.ajax({
                        url: "/ashx/ClientGoodList.ashx?type=del&ids=" + parm,
                        success: function (msg) {
                            //重新加载当前页
                            $('#list_data').datagrid('reload');
                        }

                    });
                }
            }],
        });
        //设置分页控件 
        var p = $('#list_data').datagrid('getPager');
        $(p).pagination({
            showPageList: true,
            pageSize: 10,//每页显示的记录条数，默认为10 
            pageList: [5, 10, 15],//可以设置每页记录条数的列表 
            beforePageText: '第',//页数文本框前显示的汉字 
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        });
    </script>
</form>
</body>
</html>