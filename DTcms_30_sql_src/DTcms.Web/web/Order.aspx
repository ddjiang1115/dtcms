<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="DTcms.Web.web.Order" %>
<%@ Register src="/layout/PersonCenter.ascx" tagname="PersonCenter" tagprefix="uc1" %>
<%@ Register src="/layout/head.ascx" tagname="head" tagprefix="uc2" %>
<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title> 订单管理-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
    <script src="/Web/Script/jquery-1.10.2.min.js"></script>
    
    <script charset="utf-8" src="/scripts/jquery.easyui.min.js"></script>
    <script src="/web/js/layer.min.js"></script>
    
    <script charset="utf-8" src="/scripts/jquery.easyui.min.js"></script>

    <script src="/scripts/easyui-lang-zh_CN.js"></script>
    <link href="/web/style/layer.css" rel="stylesheet" />
    <link href="/web/style/layer.ext.css" rel="stylesheet" />
    
    <link href="/css/easyui.css" rel="stylesheet" />

    <link href="/css/icon.css" rel="stylesheet" />
    <link href="/templates/green/css/style.css" rel="stylesheet" />
    <link href="/Web/Css/Order.css" rel="stylesheet" />
<script type="text/javascript">

    $(document).ready(function () {

        //Default Action
        $(".tab-xbe_content").hide(); //Hide all content
        $("ul.tab-xbe li:first").addClass("active").show(); //Activate first tab
        $(".tab-xbe_content:first").show(); //Show first tab content

        //On Click Event
        $("ul.tab-xbe li").click(function () {
            $("ul.tab-xbe li").removeClass("active"); //Remove any "active" class
            $(this).addClass("active"); //Add "active" class to selected tab
            $(".tab-xbe_content").hide(); //Hide all tab content
            var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
            $(activeTab).show(); //Fade in the active content
            if (activeTab == "#tab2")
            {
                GetData();
            }
            return false;
        });

    });
</script>
<script type="text/javascript">

    $(function () {

        /*当前页面导航高亮*/
        var href = window.location.href.split('/')[window.location.href.split('/').length - 1].substr(0, 4);
        if (href.length > 0) {
            $(function () {
                $("ul.nav a:first[href^='" + href + "']").attr("class", "on");
                if ($("ul.nav a:first[href^='" + href + "']").size() == 0) {
                    $("ul.nav a:first[href^='index']").attr("class", "on");
                }
            });
        } else {
            $(function () { $("ul.nav a:first[href^='index']").attr("class", "on") });
        }

        /*下拉菜单*/
        $(".nav li").hover(function () {
            $(this).parents(".nav > li").find("a:first").addClass("on2");
            $(this).find("ul:first").show(); //鼠标滑过查找li下面的第一个ul显示
        }, function () {
            var navobj = $(this).find("ul:first");
            navobj.hide();

            //鼠标离开隐藏li下面的ul
            if (navobj.attr("class") == "nav_sub") {
                $(this).find("a:first").removeClass("on2");
            }
        })

        //给li下面ul是s的样式的前一个同辈元素添加css
        $(".nav li ul li ul").prev().addClass("t");
    })

</script>
</head>

<body class="integration">
<!-- header-->
<uc2:head ID="head2" runat="server" />
<!-- /header--> 
<!-- banner-->
<div class="fan_banner_member">
	<div class="bannBg_all">
		<div class="bannerCont">                
			<uc1:PersonCenter ID="PersonCenter1" runat="server" />
            <div class="member_right">
             <div class="container">
                <ul class="tab-xbe">
                	<p class="left"></p>
                    <li><a href="#tab1" class="tab1"><span>积分订单</span></a></li>
                    <li><a href="#tab2" class="tab2"><span>已关闭订单</span></a></li>
                    <li><a href="#tab3" class="tab3"></a></li>
            		<p class="right"></p>
                </ul>
                <div class="tab-xbe_container">
                    <div id="tab1" class="tab-xbe_content">
                          <table id="list_data" cellspacing="0" cellpadding="0" >
                </table>
                    </div>
                    <div id="tab2" class="tab-xbe_content">
    
                             <table id="list_data2" cellspacing="0" cellpadding="0" >
                </table>
                      
                    </div>
                    
                </div>
            </div>
            </div>
		</div>	
	</div>
    <input type="hidden" id="hd" />
</div>
<!-- /banner--> 
<!-- footer-->
<uc3:foot ID="foot" runat="server" />
<!-- /footer-->
    
    <script>
        
        //datagrid初始化 
        $('#list_data').datagrid({
            title: '积分订单',
            //iconCls: 'icon-edit',//图标 
            width: 'auto',
            height: 'auto',
            nowrap: true,
            striped: true,
            border: true,
            collapsible: false,//是否可折叠的 
            fit: false,//自动大小 
            fitColumns: true,
            url: '/ashx/Order.ashx?action=select',
            //sortName: 'code', 
            //sortOrder: 'desc', 
            remoteSort: false,
            //idField: 'GoodCategoryID',
            singleSelect: false,//是否单选 
            pagination: true,//分页控件 
            rownumbers: true,//行号 
            columns: [[
                { field: 'order_no', title: '订单号', width: 110 },

                { field: 'accept_name', title: '收货人', width: 130 },
        { field: 'add_time', title: '下单时间', width: 120 },
                {
                    field: 'status', title: '状态', width: 55, formatter: function (value, rowData, rowIndex) {
                        return GetState(rowData.status);
                    }
                },
                {
                    field: '', title: '操作', width: 300, formatter: function (value, rowData, rowIndex) {
                       
                        //return "<a href='javascript:void(0)' onclick='aa(" + rowData.id + ");'>查看订单</a>&nbsp;&nbsp;<a href='javascript:void(0)' onclick='Cannel(" + rowData.order_no + ");'>取消</a>";
                        return "<a href='javascript:void(0)' onclick='aa(" + rowData.id + ");'>查看订单</a>&nbsp;&nbsp;<a href='javascript:void(0)' onclick='Cannel(\"" + rowData.order_no + "\");'>取消</a>";
                    }
                } 

            ]]
        });
        
        //设置分页控件 
        var p = $('#list_data').datagrid('getPager');
        $(p).pagination({
            showPageList: false,
            pageSize: 10,//每页显示的记录条数，默认为10 
            pageList: [5, 10],//可以设置每页记录条数的列表 
            beforePageText: '第',//页数文本框前显示的汉字 
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        });
        function aa(id) {
            $.layer({
                type: 2,
                shadeClose: true,
                title: false,
                closeBtn: [0, true],
                shade: [0.8, '#000'],
                border: [0],
                offset: ['20px', ''],
                area: ['1000px', ($(window).height() - 50) + 'px'],
                iframe: { src: "/user/order/show-" + id + ".html" }
                //close: function (index) {
                //    //location.href = '/web/member.aspx'
                //    $.ajax({
                //        async: false,
                //        type: "GET",
                //        url: "/ashx/Verification.ashx?action=Avatar",
                //        success: function (msg) {
                //            location.href = "/web/member.aspx";
                //        }
                //    });
                //}
            })
        }
        function GetData() {
            $('#list_data2').datagrid({
                title: '积分订单',
                //iconCls: 'icon-edit',//图标 
                width: 'auto',
                height: 'auto',
                nowrap: true,
                striped: true,
                border: true,
                collapsible: false,//是否可折叠的 
                fit: false,//自动大小 
                fitColumns: true,
                url: '/ashx/Order.ashx?action=select2',
                //sortName: 'code', 
                //sortOrder: 'desc', 
                remoteSort: false,
                //idField: 'GoodCategoryID',
                singleSelect: false,//是否单选 
                pagination: true,//分页控件 
                rownumbers: true,//行号 
                columns: [[
                    { field: 'order_no', title: '订单号', width: 110 },

                    { field: 'accept_name', title: '收货人', width: 130 },
            { field: 'add_time', title: '下单时间', width: 120 },
                    {
                        field: 'status', title: '状态', width: 55, formatter: function (value, rowData, rowIndex) {
                            return GetState(rowData.status);
                        }
                    },
                    {
                        field: '', title: '操作', width: 400, formatter: function (value, rowData, rowIndex) {

                            return "<a href='javascript:void(0)' onclick='aa(" + rowData.id + ");'>查看订单</a>";
                        }
                    }

                ]]
            });

            //设置分页控件 
            var p = $('#list_data2').datagrid('getPager');
            $(p).pagination({
                showPageList: false,
                pageSize: 10,//每页显示的记录条数，默认为10 
                pageList: [5, 10],//可以设置每页记录条数的列表 
                beforePageText: '第',//页数文本框前显示的汉字 
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
            });
        }
        function GetState(state) {
            var aa;
            $.ajax({
                url: "/ashx/Verification.ashx?action=OrderState&State=" + state,
                type: "get",
                async: false,
                success: function (msg) {
                    aa = msg;
                }
            });
            return aa;
        };
        function Cannel(order_no)
        {
            $.ajax({
                url: "/tools/submit_ajax.ashx?action=order_cancel&order_no=" + order_no,
                type: "get",
                async: false,
                success: function (msg) {
                    $('#list_data').datagrid('reload');
                }
            });
        }
    </script>
</body>
</html>
