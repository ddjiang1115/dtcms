<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarOut.aspx.cs" Inherits="DTcms.Web.admin.BarCode.BarOut" %>
<%@ Import Namespace="DTcms.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>出库条码导入</title>
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
  <span>出库条码管理</span>
  <i class="arrow"></i>
  <span>出库条码导入</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">仓库出库条码操作</a></li>
        
      </ul>
    </div>
  </div>
</div>
    

<div class="tab-content">

  <dl>
      
      
    <dt></dt>
      <dd>保存路径：<asp:FileUpload ID="FileUpload1" runat="server" /><asp:Button ID="Button1" runat="server" Text="提交" CssClass="btn left20" OnClick="Button1_Click" /><a class="left20">导入表格模板下载</a></dd>

    <%--<dd><asp:TextBox ID="txtGoodName" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" " ajaxurl="/tools/admin_ajax.ashx?action=validate_username"></asp:TextBox> <span class="Validform_checktip">*登录的用户名，支持中文</span></dd>--%>
  </dl> 
    

    <dl>
        <table id="list_data" cellspacing="0" cellpadding="0" >
                </table>
    
    </dl>
    </div>
    

    <script type="text/javascript" src="/scripts/common.js"></script>
    <script type="text/javascript">
        //datagrid初始化 
        $('#list_data').datagrid({
            title: '出库条码导入',
            iconCls: 'icon-edit',//图标 
            width: 'auto',
            height: 'auto',
            nowrap: true,
            striped: true,
            border: true,
            collapsible: false,//是否可折叠的 
            fit: false,//自动大小 
            fitColumns: true,
            url: '/ashx/BarOut.ashx?type=select',
            //sortName: 'code', 
            //sortOrder: 'desc', 
            remoteSort: false,
            idField: 'BarCodeCreateRecordID',
            singleSelect: false,//是否单选 
            pagination: true,//分页控件 
            rownumbers: true,//行号 
            columns: [[
                { field: '箱码', title: '箱码', width: $(this).width() * 0.1 },
                { field: '物流码', title: '物流码', width: $(this).width() * 0.1 },
                { field: '积分码', title: '积分码', width: $(this).width() * 0.1 },
                { field: '客户', title: '客户', width: $(this).width() * 0.1 }
            ]]
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
