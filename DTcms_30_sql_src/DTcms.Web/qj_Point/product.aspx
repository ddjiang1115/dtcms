<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="DTcms.Web.qj_Point.product" %>

<%@ Register Src="/layout/head.ascx" TagName="head" TagPrefix="uc1" %>

<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc2" %>

<%@ Register src="/layout/userInfo.ascx" tagname="userInfo" tagprefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>积分商城-旭贝尔</title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/pagination.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            //Default Action
            $(".tab-xxy_content").hide(); //Hide all content
            $("ul.tab-xxy li:first").addClass("active").show(); //Activate first tab
            $(".tab-xxy_content:first").show(); //Show first tab content

            //On Click Event
            $("ul.tab-xxy li").click(function () {
                $("ul.tab-xxy li").removeClass("active"); //Remove any "active" class
                $(this).addClass("active"); //Add "active" class to selected tab
                $(".tab-xxy_content").hide(); //Hide all tab content
                var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
                $(activeTab).fadeIn(); //Fade in the active content
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

<body class="integration_shop">
    <form id="form1" runat="server">
        <!-- header-->
        <uc1:head ID="head1" runat="server" />
        <!-- /header-->
        <!-- banner-->
        <div class="fan_integration_shop">
            <div class="main">
               <%-- <div class="bread">
<uc3:userInfo ID="userInfo1" runat="server" />
                </div>--%>
                <div class="shop_left">
                    <div class="category">
                        <span class="top_shop">积分类别</span>
                        <div class="box">
                            <ul class="menu">
                                <li class="level1"><a href="#one" class="cur">积分分段</a>
                                    <ul class="level2" style="display: block;">
                                        <li><a href="#">1-100</a></li>
                                        <li><a href="#">101-200</a></li>
                                        <li><a href="#">201-500
                                        </a></li>
                                        <li><a href="#">501-1000</a></li>
                                        <li><a href="#">1001-2000</a></li>
                                        <li><a href="#">2001-5000
                                            
                                            </a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="present">
                        <span class="top_shop">推荐礼品</span>
                        <ul class="menu">
                            <%System.Data.DataTable redgoods = get_article_list("goods", 0, 6, "is_red=1 and img_url<>''");
                              for (int i = 0; i < redgoods.Rows.Count; i++)
                              {
                            %>
                            <li><a href="productDetail.aspx?id=<%=redgoods.Rows[i]["id"]%>">
                                <img width="75" height="90" src="<%=redgoods.Rows[i]["img_url"]%>" /></a><p><%=(redgoods.Rows[i]["title"].ToString().Length >=5 ? redgoods.Rows[i]["title"].ToString().Substring(0,5) +"..." : redgoods.Rows[i]["title"].ToString()) %></p>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <div class="shop_right">
                    <div class="goodslist">
                        <div id="paginationdemo" class="demo">
                            <div id="p1" class="pagedemo _current" style="">
                                <div class="boxBor"></div>
                                <div class="lanrenzhijia" id="divProductShow" runat="server">
                                </div>
                            </div>
                            <div class="flickr" id="pageContent" runat="server"></div>
                            <%--                        <div id="demo5">
                        </div>--%>
                        </div>
                        <script type="text/javascript">
                            $(function () {
                                $('.box_list').bind('mouseover', function () {
                                    var oPosition = $(this).position();
                                    var oThis = $(this);
                                    $('.boxBor').queue('fnHide');
                                    if ($(".boxBor").attr('deta-switch') !== 'true') {
                                        $(".boxBor").attr('deta-switch', 'true');
                                        $(".boxBor").css({
                                            width: '100%',
                                            height: $(window).height(),
                                            left: '-10px',
                                            top: '-10px',
                                            opacity: 0,
                                            display: 'block'
                                        })
                                    }
                                    $(".boxBor").stop(false, false).animate({
                                        opacity: 0.8,
                                        left: oPosition.left,
                                        top: oPosition.top + 1,
                                        width: oThis.width(),
                                        height: oThis.height()
                                    }, 250)
                                });
                            })
                        </script>
                    </div>


                </div>
            </div>
        </div>

    </form>
    <!-- /banner-->
    <!-- footer-->
    <uc2:foot ID="foot1" runat="server" />
    <!-- /footer-->

    <script type="text/javascript" src="js/menu.js"></script>
    <script src="js/jquery.paginate.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

            $("#demo5").paginate({
                count: 10,
                start: 1,
                display: 7,
                border: true,
                border_color: '#fff',
                text_color: '#fff',
                background_color: '#bcbcbc',
                border_hover_color: '#e5e5e5',
                text_hover_color: '#1ea5d5',
                background_hover_color: '#fff',
                images: false,
                mouse: 'press',
                onChange: function (page) {
                    $('._current', '#paginationdemo').removeClass('_current').hide();
                    $('#p' + page).addClass('_current').show();
                }
            });
        });
    </script>
</body>
</html>
