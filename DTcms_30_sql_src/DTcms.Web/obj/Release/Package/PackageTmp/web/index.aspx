<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DTcms.Web.web.index" %>

<%@ Register Src="/layout/head.ascx" TagName="head" TagPrefix="uc2" %>
<%@ Register Src="/layout/foot.ascx" TagName="foot" TagPrefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>旭贝尔-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
    <meta name="keywords" content="旭贝尔" />
    <meta name="description" content="旭贝尔" />
    <link rel="stylesheet" type="text/css" href="style/style.css" id="style">
</head>

<body style="height: 100%; overflow: hidden;">
    <div id="contpar" class="contpar">
        <div id="" class="cont cont0">
            <!-- header-->
            <uc2:head ID="head1" runat="server" />
            <div class="navArea_s" id="nav">
                <div class="navBg_s">
                    <ul class="nav_s">
                        <li class="logo_s"><a href="index.html">
                            <img src="/web/images/logo_02.png" width="140" height="50"></a>
                        </li>
                        <li><a href="import.html" class="">100%美国进口</a>
                        </li>
                        <li><a href="#" class="">产品优势</a>
                        </li>
                        <li><a href="#">旭贝尔产品</a>
                            <ul class="nav_sub" style="display: none;">
                                <li><a href="#">旭贝尔产品一</a></li>
                                <li><a href="#">旭贝尔产品二</a></li>
                                <li><a href="#">旭贝尔产品三</a></li>
                            </ul>
                        </li>
                        <li><a href="#">在线购买</a>

                        </li>
                        <li class="member_nav"><a href="#">会员俱乐部</a>
                            <ul class="nav_sub" style="display: none;">
                                <li><a href="#">栏目一</a></li>
                                <li><a href="#">栏目二</a></li>
                                <li><a href="#">栏目三</a></li>
                                <li><a href="#">栏目四</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- /header-->
            <div id="btn_down" class="png btn_down"></div>
        </div>
        <div class="cont cont1">
            <div class="png videopar" id="videopar">
                <div class="video">
                    <ul style="left: 0px;">
                        <li>
                            <img src="images/wenzi_01.png" alt="旭贝尔">
                    </ul>
                </div>
            </div>
        </div>
        <div class="cont cont2">
            <div class="img0" id="cont2_img0">
                <img class="png" src="images/wenzi_02.png" alt="旭贝尔"></div>
        </div>
        <div class="cont cont3">
            <div class="img8_consub1" id="cont3_img8">
                <img class="png" src="images/wenzi_03.png" alt="旭贝尔"></div>
        </div>
        <div class="cont cont4">
            <div class="img0" id="cont4_img0">
                <img class="png" src="images/wenzi_04.png" alt="旭贝尔"></div>
            <div class="img4" id="cont4_img4">
                <div class="footer">
                    <div class="footer_ins">
                        <div class="footer_nav">
                            <div class="footer_nav_left"><a href="javascript:;"></a></div>
                            <div class="footer_nav_right">
                                <div class="footer_nav_right_top">
                                    <ul>
                                        <li><a href="#">首页</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li>
                                        <li><a href="#">热点新闻</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li>
                                        <li><a href="#">产品中心</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li>
                                        <li><a href="#">会员中心</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li>
                                        <li><a href="#">联系我们</a></li>
                                    </ul>
                                </div>
                                <div class="footer_nav_right_copyrihgt">Copyright © Nutricia Early Life Nutrition (Shanghai) Co., Ltd. 沪ICP备13042062号-5 </div>
                            </div>
                        </div>
                        <div class="footer_logo"><a href="javascript:;"></a></div>
                    </div>
                </div>
            </div>
            <div class="tit-consub2"></div>
        </div>
    </div>
    <ul class="btnlistpar" id="btnlistpar">
        <a class="png mar-t-0" onclick="highline.scroll_To($('.cont0'))"></a>
        <a class="png" onclick="highline.scroll_To($('.cont1'))"></a>
        <a class="png" onclick="highline.scroll_To($('.cont2'))"></a>
        <a class="png" onclick="highline.scroll_To($('.cont3'))"></a>
        <a class="png" onclick="highline.scroll_To($('.cont4'))"></a>
    </ul>
    <!--[if IE 6]>
    <script language="javascript" type="text/javascript" src="js/ie6_png.js"></script>
    <script language="javascript" type="text/javascript">
    DD_belatedPNG.fix(".png");
    </script>
	<![endif]-->

    <script type="text/javascript" src="/web/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/web/js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="/web/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script type="text/javascript" src="/web/js/vender.js"></script>
    <script src="/web/js/slides.min.jquery.js"></script>

    <script type="text/javascript" src="/web/js/common.js"></script>
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
    <script type='text/javascript'>
        var nt = !1;
        $(window).bind("scroll",
            function () {
                var st = $(document).scrollTop();//往下滚的高度
                nt = 160;
                // document.title=st;
                var sel = $("#nav");
                if (nt < st) {
                    sel.addClass("nav_fixed");
                } else {
                    sel.removeClass("nav_fixed");
                }
            });
    </script>
</body>
</html>
