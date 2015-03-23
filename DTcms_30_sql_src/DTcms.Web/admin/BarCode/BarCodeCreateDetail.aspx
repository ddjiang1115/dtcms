<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarCodeCreateDetail.aspx.cs" Inherits="DTcms.Web.admin.BarCode.BarCodeCreateDetail" %>
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
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">条码生成列表</a></li>
        
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
    <a id="out"  class="btn left20" style="color:white;">导出</a><input type="button" id="Button1" value="返回列表" class="btn left20" onclick="location.href='/admin/BarCode/BarCodeCreateList.aspx'" />
  <div class="left20 sb" runat="server" id="d_result" style="height:500px">           
            
                

            
        </div>
    
    </div>
    
<!--/内容-->

    <script type="text/javascript" src="/scripts/common.js"></script>
    <script type="text/javascript">
        var id=<%=Request.QueryString["id"]%>;
        $.ajax({
            url: "/ashx/BarCodeCreateDetail.ashx?type=1&id="+id,
            success: function (msg) {
                $(".sb").html(msg);

            }

        });
        //$(function () {
        //    //datagrid初始化 
        //    $('#list_data').datagrid({
        //        title: '条码综合查询',
        //        iconCls: 'icon-edit',//图标 
        //        width: 'auto',
        //        height: 'auto',
        //        nowrap: true,
        //        striped: true,
        //        border: true,
        //        collapsible: false,//是否可折叠的 
        //        fit: false,//自动大小 
        //        fitColumns: true,
        //        url: '/ashx/BarCodeSerach.ashx?type=select',
        //        //sortName: 'code', 
        //        //sortOrder: 'desc', 
        //        remoteSort: false,
        //        //idField: 'PromotionID',
        //        singleSelect: false,//是否单选 
        //        pagination: true,//分页控件 
        //        rownumbers: true,//行号 
        //        columns: [[
        //            { field: 'BoxCode', title: '箱码', width: $(this).width() * 0.1 },
        //            {
        //                field: 'LogisticsCode', title: '物流码', width: $(this).width() * 0.1, formatter: function (value, rowData, rowIndex) {

        //                    return "<a href='javascript:void(0)' onclick='GetByLogisticsCode(" + rowData.LogisticsCode + ");'>" + rowData.LogisticsCode + "</a>";
        //                }
        //            },
        //            {
        //                field: 'IntegralCode', title: '积分码', width: $(this).width() * 0.1, formatter: function (value, rowData, rowIndex) {

        //                    return "<a href='javascript:void(0)' onclick='GetByIntegralCode(" + rowData.IntegralCode + ");'>" + rowData.IntegralCode + "</a>";
        //                }
        //            },
        //            { field: 'oCreateTime', title: '出库扫描时间', width: $(this).width() * 0.1 },
        //            { field: 'pCreateTime', title: '物流码提交时间', width: $(this).width() * 0.1 },
        //            { field: 'iCreateTime', title: '积分码提交时间', width: $(this).width() * 0.1 }
        //        ]]
        //    });
        //    //设置分页控件 
        //    var p = $('#list_data').datagrid('getPager');
        //    $(p).pagination({
        //        showPageList: true,
        //        pageSize: 10,//每页显示的记录条数，默认为10 
        //        pageList: [5, 10, 15],//可以设置每页记录条数的列表 
        //        beforePageText: '第',//页数文本框前显示的汉字 
        //        afterPageText: '页    共 {pages} 页',
        //        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        //    });
        //})
        $("#out").attr("href","/ashx/BarCodeCreateDetail.ashx?type=2&id="+id);

    </script>

</form>
</body>
</html>
