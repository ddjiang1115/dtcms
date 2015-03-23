<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="integration.aspx.cs" Inherits="DTcms.Web.web.integration" %>

<%@ Register Src="/layout/PersonCenter.ascx" TagName="PersonCenter" TagPrefix="uc1" %>
<%@ Register Src="/layout/head.ascx" TagName="head" TagPrefix="uc2" %>
<%@ Register Src="/layout/foot.ascx" TagName="foot" TagPrefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>积分消费列表-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
<script type="text/javascript" src="/scripts/jquery/jquery-1.10.2.min.js"></script>
    <script src="/web/Using/Validform/js/Validform_v5.3.2_min.js"></script>

    <script charset="utf-8" src="/scripts/jquery.easyui.min.js"></script>

    <script src="/scripts/easyui-lang-zh_CN.js"></script>

    
    <script src="/web/Using/layer/layer.min.js"></script>
    <link href="/css/easyui.css" rel="stylesheet" />

    <link href="/css/icon.css" rel="stylesheet" />
    <link href="/templates/green/css/style.css" rel="stylesheet" />
    <link href="/web/Using/layer/skin/layer.css" rel="stylesheet" />

    <style>
        .Validform_checktip {margin-left:-80px;
        }
        .Validform_right {margin-left:-180px
        }
        body {
            text-align:left;
        }
        td {text-align:center;
        }
    </style>
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

                $(activeTab).fadeIn(); //Fade in the active content
                if (activeTab == "#tab2") {
                    GetDatagrid();
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
    <uc2:head ID="head1" runat="server" />
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
                            <li><a href="#tab1" class="tab1"><span>我要兑换</span></a></li>
                            <li><a href="#tab2" class="tab2"><span>积分兑换列表</span></a></li>
                            <li><a href="#tab3" class="tab3"></a></li>
                            <p class="right"></p>
                        </ul>
                        <div class="tab-xbe_container">
                            <div id="tab1" class="tab-xbe_content">
                                <div class="tab1_left" style="width: 550px">
                                    <form id="form1">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mtable">
                                            <!--取得一个DataTable-->
                                            <!--取得分页页码列表-->

                                            <tr>
                                                <td width="50" align="center">积分码</td>
                                                <td width="150">
                                                    <input type="text" name="IntegralCode" id="IntegralCode" class="input txt" datatype="n10-10" nullmsg="请输入10位数字的积分码！" errormsg="请输入10位数字的积分码！" ajaxurl="/ashx/Verification.ashx?action=IntegralCode"/></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td width="20" align="center"></td>
                                                <td width="150" align="left">
                                                    <input type="submit" id="btnSubmit" class="btn_submit" value="提交" /></td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>

                            </div>
                            <div id="tab2" class="tab-xbe_content">
                                <table id="list_data" cellspacing="0" cellpadding="0">
                                </table>
                            </div>
                            <%--<div id="tab3" class="tab-xbe_content">
                                <div class="tab1_integration">
                                </div>
                            </div>--%>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /banner-->
    <!-- footer-->
    <uc3:foot ID="foot" runat="server" />

    <script type="text/javascript">
        $(function () {
            //初始化表单验证
            $("#form1").Validform({
                tiptype:2,
                beforeSubmit:function(curform){
                    //在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
                    //这里明确return false的话表单将不会提交
                    $.ajax({
                        type: "get",
                        url: "/ashx/Integration.ashx?type=exchange&IntegralCode=" + $("#IntegralCode").val(),
                        success: function (msg) {
                            if (msg == "true") {
                                layer.alert('积分成功', 1, !1);
                            }
                            else {
                                layer.alert('积分失败', 8, !1);
                            }
                        }
                    });
                    return false;
                }
            });
            
        });
        

    </script>
    <!-- /footer-->
    <script>
        function GetDatagrid() {
            //datagrid初始化 
            $('#list_data').datagrid({
                title: '积分兑换列表',
                iconCls: 'icon-edit',//图标 
                width: 'auto',
                height: 'auto',
                nowrap: true,
                striped: true,
                border: true,
                collapsible: false,//是否可折叠的 
                fit: false,//自动大小 
                fitColumns: true,
                url: '/ashx/IntegralExchange.ashx?type=select',
                //sortName: 'code', 
                //sortOrder: 'desc', 
                remoteSort: false,
                //idField: 'GoodCategoryID',
                singleSelect: false,//是否单选 
                pagination: true,//分页控件 
                rownumbers: true,//行号 
                columns: [[
                    { field: 'user_name', title: '用户名称', width: $(this).width() * 0.1 },
                    { field: 'IntegralCode', title: '积分码', width: $(this).width() * 0.1 },
                    //{ field: 'ip', title: 'IP地址', width: $(this).width() * 0.1 },
                    { field: 'IntegralRatio', title: '积分比值', width: $(this).width() * 0.1 },
                    { field: 'CreateTime', title: '兑换时间', width: $(this).width() * 0.1 }

                ]]
            });
            //设置分页控件 
            var p = $('#list_data').datagrid('getPager');
            $(p).pagination({
                showPageList: true,
                pageSize: 10,//每页显示的记录条数，默认为10 
                pageList: [5, 10],//可以设置每页记录条数的列表 
                beforePageText: '第',//页数文本框前显示的汉字 
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
            });
        }
        $.ajax({
            url: "/user/point/list.html", //这里是静态页的地址
            type: "GET", //静态页用get方法，否则服务器会抛出405错误
            success: function (data) {
                var result = $(data).find(".mtable");
                $("#tab3").html(result);
                $(".mtable a").hide();

            }
        });
    </script>
</body>
</html>
