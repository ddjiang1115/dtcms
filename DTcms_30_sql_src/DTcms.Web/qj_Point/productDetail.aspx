<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productDetail.aspx.cs" Inherits="DTcms.Web.qj_Point.productDetail" %>

<%@ Register Src="/layout/head.ascx" TagName="head" TagPrefix="uc1" %>

<%@ Register Src="/layout/foot.ascx" TagName="foot" TagPrefix="uc2" %>

<%@ Register src="/layout/userInfo.ascx" tagname="userInfo" tagprefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/cloudzoom/cloudzoom.js"></script>
    <script type="text/javascript" src="js/cloudzoom/thumbelina.js"></script>
    <script src="js/cart.js"></script>
    <script src="../scripts/jquery/jquery.form.min.js"></script>
    <script src="../scripts/jquery/Validform_v5.3.2_min.js"></script>
    <script src="../scripts/jquery/jquery.pagination.js"></script>
    <script src="../scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
    <link href="js/cloudzoom/cloudzoom.css" type="text/css" rel="stylesheet" />
    <link href="js/cloudzoom/thumbelina.css" type="text/css" rel="stylesheet" />
    <link href="../css/validate.css" rel="stylesheet" />
    <link href="../css/pagination.css" rel="stylesheet" />
    <link href="css/qj_productDetail.css" rel="stylesheet" />
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
    <script type="text/javascript">
        CloudZoom.quickStart();
        // Initialize the slider.
        $(function () {
            $('#slider1').Thumbelina({
                $bwdBut: $('#slider1 .left'),
                $fwdBut: $('#slider1 .right')
            });
        });


    </script>
    <script type="text/javascript">

        // The following piece of code can be ignored.
        $(function () {
            $(window).resize(function () {
                $('#info').text("Page width: " + $(this).width());
            });
            $(window).trigger('resize');
        });

        // The following piece of code can be ignored.
        if (window.location.hostname.indexOf("starplugins.") != -1) {
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-254857-7']);
            _gaq.push(['_trackPageview']);
            (function () {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        }

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
                <%--<div class="bread">
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
                                        <li><a href="#">201-500</a></li>
                                        <li><a href="#">501-1000</a></li>
                                        <li><a href="#">1001-2000</a></li>
                                        <li>

                                            <a href="#">2001-5000
                                            </a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="present">
                        <span class="top_shop">推荐礼品</span>
                        <ul class="menu">
                            <%System.Data.DataTable redgoods = get_article_list("goods", 0, 4, "is_red=1 and img_url<>''");
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
                    <div class="goodsarea">
                        <div class="fl">
                            <!-- 组图区域开始-->
                            <div id="surround">
                                <%string strPath = "";
                                  if (modelArticle.albums.Count > 0) { strPath = modelArticle.albums[0].original_path; } %>
                                <img class="cloudzoom" id="zoom1" src="<%=strPath%>"
                                    data-cloudzoom='
                           zoomSizeMode:"image",
                           autoInside: 550
                       '>


                                <div id="slider1">

                                    <ul>
                                        <%foreach (DTcms.Model.article_albums modelAlbums in modelArticle.albums)
                                          { %>
                                        <li>
                                            <img class='cloudzoom-gallery cloudzoom-gallery-active' src="<%=modelAlbums.original_path %>"
                                                data-cloudzoom="useZoom:'.cloudzoom', image:'<%=modelAlbums.original_path %>' "></li>
                                        <%}%>
                                    </ul>
                                </div>

                            </div>
                            <!-- 组图区域结束 -->
                        </div>
                        <!-- 商品信息开始 -->
                        <div class="fr">
                            <div class="title_detail">
                                <h2><%=modelArticle.title%></h2>
                                <p><%=modelArticle.fields["sub_title"]%></p>
                            </div>
                            <div class="buy_detail">
                                <div class="buy_detail_fl">
                                    <ul>
                                        <li>礼品号：<span><%=modelArticle.fields["goods_no"]%></span></li>
                                        <%--<li>品牌：<span>粉宝乐园</span></li>--%>
                                        <li>所需积分：<span><%=modelArticle.fields["point"]%>分</span></li>
                                        <li>库存：<span><%=modelArticle.fields["stock_quantity"]%>件</span></li>
                                    </ul>
                                    <div class="tb-action">
                                        <input name="goods_id" id="goods_id" type="hidden" value="<%=modelArticle.id%>" />
                                        <a href="javascript:void(0);" id="buynow" onclick="CartAdd(this,1, 'shopping.aspx?action=confirm');">立刻购买</a>
                                        <a href="javascript:void(0);" id="addcart" onclick="CartAdd(this,0, 'shopping.aspx?action=cart');">加入购物车</a>

                                    </div>
                                </div>
                                <div class="ewm">
                                    <p>
                                        扫描手机打开<br />
                                        扫一扫即可购买<br />
                                        方便快捷
                                    </p>
                                    <img src="images/code_ewm.jpg" width="123" height="123" alt="" />
                                </div>
                                <div class="cl"></div>
                            </div>

                        </div>
                        <!-- 商品信息结束 -->
                    </div>
                    <%int comment_count = get_comment_count(modelArticle.id, "is_lock=0");%>
                    <div class="container-xxy">
                        <ul class="tab-xxy">
                            <li><a href="#tab1" class="tab1"><span>商品介绍</span></a></li>
                            <%--<li><a href="#tab2" class="tab2"><span>商品评价<span class="red">(<%=comment_count%>)</span></span></a></li>--%>
                        </ul>
                        <div class="tab-xxy_container">
                            <div id="tab1" class="tab-xxy_content">
                                <%=modelArticle.content%>
                            </div>
                            <%--                        <div id="tab2" class="tab-xxy_content">
                        </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /banner-->
        <!-- footer-->
        <uc2:foot ID="foot1" runat="server" />
        <!-- /footer-->

        <script type="text/javascript" src="js/menu.js"></script>
    </form>
</body>
</html>
