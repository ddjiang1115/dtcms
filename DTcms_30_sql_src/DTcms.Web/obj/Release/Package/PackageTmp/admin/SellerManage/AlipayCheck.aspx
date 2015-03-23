<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlipayCheck.aspx.cs" Inherits="DTcms.Web.admin.SellerManage.AlipayCheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>促销员支付审核列表</title>
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
  <span>促销员管理</span>
  <i class="arrow"></i>
  <span>促销员支付审核列表</span>
</div>
<div class="line10"></div>
    <table id="list_data" cellspacing="0" cellpadding="0" >
                </table>
    <script type="text/javascript" src="/scripts/common.js"></script>
    <script>

        //datagrid初始化 
        $('#list_data').datagrid({
            title: '促销员支付审核列表',
            iconCls: 'icon-edit',//图标 
            width: 'auto',
            height: 'auto',
            nowrap: true,
            striped: true,
            border: true,
            collapsible: false,//是否可折叠的 
            fit: false,//自动大小 
            fitColumns: true,
            url: '/ashx/AlipayCheck.ashx?type=select',
            //sortName: 'code', 
            //sortOrder: 'desc', 
            remoteSort: false,
            idField: 'PromotionID',
            singleSelect: false,//是否单选 
            pagination: true,//分页控件 
            rownumbers: true,//行号 
            columns: [[
                { field: 'user_name', title: '促销员名称', width: $(this).width() * 0.1 },
                { field: 'LogisticsCode', title: '物流码', width: $(this).width() * 0.1 },
                { field: 'BrokerageRatio', title: '佣金金额', width: $(this).width() * 0.1 },
                { field: 'CreateTime', title: '时间', width: $(this).width() * 0.1 },
                { field: 'state', title: '状态', width: $(this).width() * 0.1 }
            ]],
            frozenColumns: [[
                { field: 'ck', checkbox: true }
            ]],
            toolbar: [
            //{
            //    text: '删除',
            //    iconCls: 'icon-remove',
            //    handler: function () {
            //        var rows = $('#list_data').datagrid('getSelections');
            //        if (!rows || rows.length == 0) {
            //            $.messager.alert('提示', '请选择要删除的数据!', 'info');
            //            return;
            //        }
            //        var parm;
            //        $.each(rows, function (i, n) {
            //            if (i == 0) {

            //                parm = n.PromotionID;

            //            } else {

            //                parm += "," + n.PromotionID;
            //            }
            //        });
            //        $.ajax({
            //            url: "/ashx/BrokerageCheck.ashx?type=del&ids=" + parm,
            //            success: function (msg) {
            //                //重新加载当前页
            //                $('#list_data').datagrid('reload');
            //            }

            //        });
            //    }
            //}, '-',
            {
                text: '激活',
                iconCls: 'icon-remove',
                handler: function () {
                    var rows = $('#list_data').datagrid('getSelections');
                    if (!rows || rows.length == 0) {
                        $.messager.alert('提示', '请选择要激活的数据!', 'info');
                        return;
                    }
                    var parm;
                    $.each(rows, function (i, n) {
                        if (i == 0) {

                            parm = n.PromotionID;

                        } else {

                            parm += "," + n.PromotionID;
                        }
                    });
                    $.ajax({
                        url: "/ashx/AlipayCheck.ashx?type=up&ids=" + parm,
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
            //onBeforeRefresh: function () {
            //    $(this).pagination('loading');
            //    alert('before refresh');
            //    $(this).pagination('loaded');
            //}
            //onChangePageSize: function () {

            //},
            //onSelectPage: function (pageList, pageSize) {
            //    alert(pageNumber);
            //    alert(pageSize);
            //}
            /*onBeforeRefresh:function(){
                $(this).pagination('loading');
                alert('before refresh');
                $(this).pagination('loaded');
            }*/
        });
    </script>

</form>
</body>
</html>
