<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarCodeCreateList.aspx.cs" Inherits="DTcms.Web.admin.BarCode.BarCodeCreateList" %>
<%@ Import Namespace="DTcms.Common" %>
<%@ Import Namespace="DTcms.BLL" %>
<%@ Import Namespace="System.Collections.Generic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>条码生成操作列表</title>
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
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>条码生成</span>
  <i class="arrow"></i>
  <span>条码生成操作列表</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
    
    <table id="list_data" cellspacing="0" cellpadding="0" >
                </table>
<!--/工具栏-->
    <script type="text/javascript">
        //$.ajax({
        //    url: "/ashx/BarCodeCreateList.ashx",
        //    type: "POST",
        //    data: "page=1&&rows=10",
        //    success: function (msg) {
        //        alert(msg);
        //        //$(".sb").html(msg);

        //    }

        //});

        //datagrid初始化 
        $('#list_data').datagrid({
            title: '条码生成列表',
            iconCls: 'icon-edit',//图标 
            width: 'auto',
            height: 'auto',
            nowrap: true,
            striped: true,
            border: true,
            collapsible: false,//是否可折叠的 
            fit: false,//自动大小 
            fitColumns:true,
            url: '/ashx/BarCodeCreateList.ashx?type=select',
            //sortName: 'code', 
            //sortOrder: 'desc', 
            remoteSort: false,
            idField: 'BarCodeCreateRecordID',
            singleSelect: false,//是否单选 
            pagination: true,//分页控件 
            rownumbers: true,//行号 
            columns: [[
                { field: 'RetrospectCode', title: '追溯码', width: $(this).width() * 0.1 },
                { field: 'BoxSum', title: '箱数', width: $(this).width() * 0.1 },
                { field: 'GoodCount', title: '商品件数', width: $(this).width() * 0.1 },
                { field: 'user_name', title: '操作人', width: $(this).width() * 0.1 },
                //{
                //    field: 'State', title: '状态', width: $(this).width() * 0.1,
                //    formatter: function (value, rowData, rowIndex) {

                //        //return GetState(rowData.state);
                //        return rowData.State;
                //    }
                //},
                { field: 'CreateTime', title: '操作日期', width: $(this).width() * 0.1 },
                { field: 'Remark', title: '备注', width: $(this).width() * 0.1 },
                {
                    field: 'BarCodeCreateRecordID', title: '操作', 
                    formatter: function (value, rowData, rowIndex) {
                        
                        return "<a href='/admin/BarCode/BarCodeCreateDetail.aspx?id=" + rowData.BarCodeCreateRecordID + "'>详情</a>&nbsp&nbsp<a href='/ashx/BarCodeCreateDetail.ashx?type=2&id=" + rowData.BarCodeCreateRecordID + "'>导出</a>";
                    }
                }
            ]],
            frozenColumns: [[
                { field: 'ck', checkbox: true }
            ]],
            toolbar: [
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

                            parm = n.BarCodeCreateRecordID;

                        } else {

                            parm += "," + n.BarCodeCreateRecordID;
                        }
                    });
                    $.ajax({
                        url: "/ashx/BarCodeCreateList.ashx?type=del&ids="+parm,
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
