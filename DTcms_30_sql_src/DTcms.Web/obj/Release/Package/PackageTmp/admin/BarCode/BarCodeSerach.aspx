<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarCodeSerach.aspx.cs" Inherits="DTcms.Web.admin.BarCode.BarCodeSerach" %>
<%@ Import Namespace="DTcms.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>条码综合查询</title>
<script type="text/javascript" src="/scripts/jquery/jquery-1.10.2.min.js"></script>
<%--<script type="text/javascript" src="../js/layout.js"></script>--%>
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<script src="/web/js/layer.min.js"></script>
    <link href="/web/style/layer.css" rel="stylesheet" />
    <link href="/web/style/layer.ext.css" rel="stylesheet" />
<link href="/css/common.css" rel="stylesheet" />
    <script charset="utf-8" src="/scripts/jquery.easyui.min.js"></script>

    <script src="/scripts/easyui-lang-zh_CN.js"></script>

    <link href="/css/easyui.css" rel="stylesheet" />

    <link href="/css/icon.css" rel="stylesheet" />
<style>
    .popup dl {clear:both;}
        .popup dl dt {float:left; text-align:right;width:110px;
        }
        .popup dl dd {float:left;margin-left:10px;
        }
</style>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>条码报表查询</span>
  <i class="arrow"></i>
  <span>条码综合查询</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">条码综合查询</a></li>
        
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">

<%--  <dl>
    <dt>商品名称</dt>
    <dd><asp:TextBox ID="txtGoodCategoryName" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" " ajaxurl="/tools/admin_ajax.ashx?action=validate_username"></asp:TextBox> <span class="Validform_checktip"></span></dd>
  </dl>
     <dl>
    <dt>客户</dt>
    <dd><asp:TextBox ID="txtClientName" runat="server" CssClass="input normal "></asp:TextBox></dd>
  </dl> --%>
    <dl>
    <dt>箱码</dt>
    <dd><asp:TextBox ID="txtBoxCode" runat="server" CssClass="input normal"></asp:TextBox></dd>
  </dl>
    <dl>
    <dt>物流码</dt>
    <dd><asp:TextBox ID="txtLogisticsCode" runat="server" CssClass="input normal"></asp:TextBox></dd>
  </dl>
    <dl>
    <dt>积分码</dt>
    <dd><asp:TextBox ID="txtIntegralCode" runat="server" CssClass="input normal"></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>条码批次号</dt>
    <dd><asp:TextBox ID="txtBatch" runat="server" CssClass="input normal" ></asp:TextBox> </dd>
  </dl>
  <dl>
    <dt>追溯码</dt>
    <dd><asp:TextBox ID="txtRetrospect" runat="server" CssClass="input normal" ></asp:TextBox> </dd>
  </dl>
  <dl>
    <dt>出库扫描时间</dt>
    <dd>从<input type="text" class="easyui-datebox" id="oTimeFrom" /> 到<input type="text" class="easyui-datebox" id="oTimeTo"/></dd>
  </dl>
 <dl>
    <dt>物流码提交时间</dt>
    <dd>从<input type="text" class="easyui-datebox" id="pTimeFrom" /> 到<input type="text" class="easyui-datebox" id="pTimeTo"/></dd>
  </dl>
  <dl>
    <dt>积分码提交时间</dt>
    <dd>从<input type="text" class="easyui-datebox" id="iTimeFrom" /> 到<input type="text" class="easyui-datebox" id="iTimeTo"/></dd>
  </dl>
  
  
    <dl>
    <%--<dt><asp:Button ID="Button1" runat="server" Text="查询" CssClass="btn" /></dt>--%>
        <dt><input type="button" id="Post" value="查询" class="btn" /></dt>
    <dd></dd>
  </dl>
    
    <dl>
        <table id="list_data" cellspacing="0" cellpadding="0" >
                </table>
    </dl>
    </div>
    
<!--/内容-->

<!--工具栏-->
<%--<div class="page-footer">
  <div class="btn-list">
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript: history.back(-1);" />
  </div>
  <div class="clear"></div>
</div>--%>
<!--/工具栏-->
    <script type="text/javascript" src="/scripts/common.js"></script>
            <script type="text/javascript">
                $(function () {
                    //datagrid初始化 
                    $('#list_data').datagrid({
                        title: '条码综合查询',
                        iconCls: 'icon-edit',//图标 
                        width: 'auto',
                        height: 'auto',
                        nowrap: true,
                        striped: true,
                        border: true,
                        collapsible: false,//是否可折叠的 
                        fit: false,//自动大小 
                        fitColumns: true,
                        url: '/ashx/BarCodeSerach.ashx?type=select',
                        //sortName: 'code', 
                        //sortOrder: 'desc', 
                        remoteSort: false,
                        //idField: 'PromotionID',
                        singleSelect: false,//是否单选 
                        pagination: true,//分页控件 
                        rownumbers: true,//行号 
                        columns: [[
                            { field: 'BoxCode', title: '箱码', width: $(this).width() * 0.1 },
                            {
                                field: 'LogisticsCode', title: '物流码', width: $(this).width() * 0.1, formatter: function (value, rowData, rowIndex) {

                                    return "<a href='javascript:void(0)' onclick='GetByLogisticsCode(" + rowData.LogisticsCode + ");'>" + rowData.LogisticsCode + "</a>";
                                }
                            },
                            {
                                field: 'IntegralCode', title: '积分码', width: $(this).width() * 0.1, formatter: function (value, rowData, rowIndex) {

                                    return "<a href='javascript:void(0)' onclick='GetByIntegralCode(" + rowData.IntegralCode + ");'>" + rowData.IntegralCode + "</a>";
                                }
                            },
                            { field: 'oCreateTime', title: '出库扫描时间', width: $(this).width() * 0.1 },
                            { field: 'pCreateTime', title: '物流码提交时间', width: $(this).width() * 0.1 },
                            { field: 'iCreateTime', title: '积分码提交时间', width: $(this).width() * 0.1 }
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
                })
    </script>
    <script type="text/javascript">
        function getQueryParams(queryParams) {
            var OTimeFrom = $("#oTimeFrom").datebox("getValue");
            var OTimeTo = $("#oTimeTo").datebox("getValue");
            var PTimeFrom = $("#pTimeFrom").datebox("getValue");
            var PTimeTo = $("#pTimeTo").datebox("getValue");
            var ITimeFrom = $("#iTimeFrom").datebox("getValue");
            var ITimeTo = $("#iTimeTo").datebox("getValue");
            var BoxCode = document.getElementById("txtBoxCode").value;
            var LogisticsCode = document.getElementById("txtLogisticsCode").value;
            var IntegralCode = document.getElementById("txtIntegralCode").value;
            var Batch = document.getElementById("txtBatch").value;
            var Retrospect = document.getElementById("txtRetrospect").value;


            queryParams.OTimeFrom = OTimeFrom;
            queryParams.OTimeTo = OTimeTo;
            queryParams.PTimeFrom = PTimeFrom;
            queryParams.PTimeTo = PTimeTo;
            queryParams.ITimeFrom = ITimeFrom;
            queryParams.ITimeTo = ITimeTo;
            queryParams.BoxCode = BoxCode;
            queryParams.LogisticsCode = LogisticsCode;
            queryParams.IntegralCode = IntegralCode;
            queryParams.Batch = Batch;
            queryParams.Retrospect = Retrospect;

            return queryParams;

        }
        //增加查询参数，重新加载表格 
        function reloadgrid() {
           
            //查询参数直接添加在queryParams中      
            var queryParams = $('#list_data').datagrid('options').queryParams;
            getQueryParams(queryParams);
            //queryParams.Retrospect = "aaa";
            //$('#list_data').datagrid('options').queryParams = queryParams;
            $("#list_data").datagrid('reload');

        }
        $("#Post").click(function () {
            //$('#list_data').datagrid('loadData', { total: 0, rows: [] });//清空下方DateGrid 
            reloadgrid();
            //$("#list_data").datagrid("load", sy.serializeObject($("#form1").form()));
        });
        function GetByLogisticsCode(LogisticsCode)
        {

            $.ajax({
                type: "get",
                url: "/ashx/Verification.ashx?action=SearchLogisticsCode&LogisticsCode=" + LogisticsCode,
                success: function (msg) {
                    var dataObj = eval("(" + msg + ")");
                    layer.alert("<div class='popup'><dl><dt>促销员姓名:</dt><dd>" + dataObj[0].user_name + "</dd></dl><dl><dt>物流码佣金金额:</dt><dd>" + dataObj[0].BrokerageRatio + "</dd></dl><dl><dt>箱码:</dt><dd>" + dataObj[0].BoxCode + "</dd></dl><dl><dt>状态:</dt><dd>" + GetState(dataObj[0].State) + "</dd></dl><dl><dt>物流码提交时间:</dt><dd>" + dataObj[0].CreateTime + "</dd></dl><dl><dt>出库日期:</dt><dd>" + dataObj[0].oCreateTime + "</dd></dl></div>", -1, !1);
                }
            });
        }
        function GetByIntegralCode(IntegralCode) {

            $.ajax({
                type: "get",
                url: "/ashx/Verification.ashx?action=SearchIntegralCode&IntegralCode=" + IntegralCode,
                success: function (msg) {
                    var dataObj = eval("(" + msg + ")");
                    layer.alert("<div class='popup'><dl><dt>消费者姓名:</dt><dd>" + dataObj[0].user_name + "</dd></dl><dl><dt>手机号码:</dt><dd>" + dataObj[0].mobile + "</dd></dl><dl><dt>积分码兑换时间:</dt><dd>" + dataObj[0].CreateTime + "</dd></dl><dl><dt>积分分值:</dt><dd>" + dataObj[0].IntegralRatio + "</dd></dl><dl><dt>出库日期:</dt><dd>" + dataObj[0].oCreateTime + "</dd></dl><dl><dt>箱码:</dt><dd>" + dataObj[0].BoxCode + "</dd></dl></div>", -1, !1);
                }
            });
        }
        function GetState(state) {
            var result;
            $.ajax({
                url: "/ashx/Verification.ashx?action=State&State=" + state,
                type: "get",
                async: false,
                success: function (msg) {
                    result = msg;
                }
            });
            return result;
        }
    </script>
</form>
</body>
</html>
