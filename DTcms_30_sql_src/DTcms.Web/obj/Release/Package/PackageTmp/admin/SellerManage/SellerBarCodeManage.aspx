<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellerBarCodeManage.aspx.cs" Inherits="DTcms.Web.admin.SellerManage.SellerBarCodeManage" %>
<%@ Import Namespace="DTcms.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>促销员物流码管理</title>
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
    <script src="/web/Using/layer/layer.min.js"></script>
    <link href="/web/Using/layer/skin/layer.css" rel="stylesheet" />
</head>

<body class="mainbody">
    
<%--<form/ id="Form2" method="post" action="/ashx/SellerBarCodeManage.ashx" enctype="multipart/form-data" target="hd">
<div id="screenshot" style="display:block; background-color:#FFFF99; position:absolute;width:350px; left:8px; bottom:137px;border:1px; border-color:Gray;border-style:solid; z-index:1;"> 
<input type="file" id="file1" name="upfile" size="28"/>
<input type="submit" value="发送" onclick="return checksn();"/> 
</div>
</form>--%>
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>促销员管理</span>
  <i class="arrow"></i>
  <span>促销员物流码管理</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">单个物流码提交</a></li>
        <li><a href="javascript:;" onclick="tabs(this);" >批量物流码导入</a></li>
      </ul>
    </div>
  </div>
</div>
    

<div class="tab-content">
    <dl>
        
    <dt>物流码</dt>
      <dd><asp:TextBox ID="txtLogisticsCode" runat="server"></asp:TextBox><input type="button" class="btn left20" value="提交" id="btnPostOne"/></dd>

    <%--<dd><asp:TextBox ID="txtGoodName" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" " ajaxurl="/tools/admin_ajax.ashx?action=validate_username"></asp:TextBox> <span class="Validform_checktip">*登录的用户名，支持中文</span></dd>--%>
  </dl> 
   

    <dl>
        <table id="list_data" cellspacing="0" cellpadding="0" >
                </table>
       
    </dl>
    
    </div>
    <div class="tab-content" style="display:none;">
  <dl>
    <dt>保存路径</dt>
      <dd><iframe src="/UpLoadFile/UpLoadFile.aspx" width="500" height="30" scrolling="no"></iframe></dd>

    <%--<dd><asp:TextBox ID="txtGoodName" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" " ajaxurl="/tools/admin_ajax.ashx?action=validate_username"></asp:TextBox> <span class="Validform_checktip">*登录的用户名，支持中文</span></dd>--%>
  </dl> 

    <dl>
        <table id="list_data2" cellspacing="0" cellpadding="0" >
                </table>
    </dl>
</div>
<!--/内容-->
    <%--<asp:HiddenField ID="json" runat="server" />--%>
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
        function GetExcel(filename) {
            $('#list_data2').datagrid({
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
                url: "/ashx/SellerBarCodeManage.ashx?type=two&filename=" + filename,
                //sortName: 'code', 
                //sortOrder: 'desc', 
                remoteSort: false,
                //idField: 'GoodCategoryID',
                singleSelect: false,//是否单选 
                pagination: true,//分页控件 
                rownumbers: true,//行号 
                columns: [[
                    { field: '物流码', title: '物流码', width: $(this).width() * 0.1 },
                    {
                        field: '1', title: '条码属性', width: $(this).width() * 0.1,
                        formatter: function (value, rowData, rowIndex) {
                            return '积分码'
                        }
                    },
                    { field: 'CreateTime', title: '创建时间', width: $(this).width() * 0.1 },
                    {
                        field: '2', title: '状态', width: $(this).width() * 0.1,
                        formatter: function (value, rowData, rowIndex) {
                            return '销售'
                        }

                    }
                ]]
            });

            //设置分页控件 
            var p = $('#list_data2').datagrid('getPager');
            $(p).pagination({
                showPageList: true,
                pageSize: 10,//每页显示的记录条数，默认为10 
                pageList: [5, 10, 15],//可以设置每页记录条数的列表 
                beforePageText: '第',//页数文本框前显示的汉字 
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
            });
        }
    </script>
  <script type="text/javascript">

      GetData();
        //datagrid初始化 
      $("#btnPostOne").click(function () {
          $.ajax({
              url: "/ashx/SellerBarCodeManage.ashx?type=Three&code=" + $("#txtLogisticsCode").val(),
                      success: function (data) {
                          if (data == "true") {
                              GetData($("#txtLogisticsCode").val());
                          }
                          else {
                              layer.alert('该物流码不存在', 8, !1);
                          }
                      }
                  });
           
        })

        //$("#btnPostTwo").click(function () {
        //    //alert($("#FileUpload2").val());
        //    $.ajax({
        //        url: "SellerBarCodeManage.aspx?type=1",
        //        success: function (data) {
        //            alert(data);
        //        }
        //    });
        //   // GetExcel("");
        //})
        function GetData(code)
        {
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
                url: "/ashx/SellerBarCodeManage.ashx?type=one&code="+code,
                //sortName: 'code', 
                //sortOrder: 'desc', 
                remoteSort: false,
                idField: 'GoodCategoryID',
                singleSelect: false,//是否单选 
                pagination: false,//分页控件 
                rownumbers: true,//行号 
                columns: [[
                    { field: 'LogisticsCode', title: '条码编号', width: $(this).width() * 0.1 },
                    {
                        field: 'GoodCategoryName', title: '条码属性', width: $(this).width() * 0.1,
                        formatter: function (value, rowData, rowIndex) {

                            return "积分码"
                        }
                    },
                    { field: 'CreateTime', title: '创建时间', width: $(this).width() * 0.1 },
                    {
                        field: 'State', title: '状态', width: $(this).width() * 0.1,
                        formatter: function (value, rowData, rowIndex) {

                            if (rowData.State == "1") {
                                return '销售'
                            } else {
                                return '销售';
                            }
                        }

                    }
                ]],
                onLoadSuccess: function (data) {
                    if (data.total == 0)
                    {
                        alert("fdf");
                    }
                }
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
        }
        $(window).bind('beforeunload', function () { return '您输入的内容尚未保存，确定离开此页面吗？'; });
        function beforeunload()
        {
        <%=Remove()%>;
        }
        //解除绑定 $(window).unbind('beforeunload'); 
    </script>
</form>
</body>
</html>
