<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="DTcms.Web.web.products" %>
<%@ Register src="/layout/head.ascx" tagname="head" tagprefix="uc2" %>
<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>产品-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
<link rel="stylesheet" type="text/css" href="style/style.css" id="style">
<link rel="stylesheet" type="text/css" href="style/animate.css">
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/maxshu.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/divselect.js"></script>
    <link href="/templates/green/css/style.css" rel="stylesheet" />
<script type="text/javascript">
    $(function () {
        $.divselect("#divselect", "#inputselect");
    });
</script>
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

<body class="products">
<!-- header-->
<uc2:head ID="head1" runat="server" />  
<!-- /header--> 
<!-- banner-->
<div class="fan_products">
	<div class="bannBg_all">
		<div class="bannerCont">                
			<div class="products_word"></div>
            <div class="products_usa"></div>
            <div class="contents">
            	<ul>
                <li class="title">批号查询：</li>
                <li class="border"><input name="method" type="submit" value="批号查看方法" class="method"/><input type="text" name="method-t" id="method-t" class="input-t" maxlength="50" /><form action="" method="post" class="stage">
                    <div id="divselect">
                          <cite>一阶段</cite>
                          <ul>
                             <li><a href="javascript:;" selectid="1">一阶段</a></li>
                             <li><a href="javascript:;" selectid="2">二阶段</a></li>
                             <li><a href="javascript:;" selectid="3">三阶段</a></li>
                             <li><a href="javascript:;" selectid="4">四阶段</a></li>
                             <li><a href="javascript:;" selectid="5">妈妈粉</a></li>
                          <p></p>
                          </ul>
                      </div>
                      <input name="" type="hidden" value="" id="inputselect"/>
                    
                    </form></li>
                <li>
                  <p><input name="提交" type="submit" class="sub" value="即刻体验" /></p></li>
                <li class="texts">输入罐底批次号和阶段（三阶段），即可透明追溯生产以及进口的相关信息</li>
                </ul>
            </div>
		</div>	
	</div>
</div>
<!-- /banner--> 
<!-- footer-->
<uc1:foot ID="foot1" runat="server" />
<!-- /footer-->
<script>
    (function ($) {
        $.fn.fadeAnimate = function (options) {
            options = $.extend({
                liDomList: $(this).find('li'),
                liDomListLen: $(this).find('li').length,
                disableAutoEle: $('#account-box'),
                curIndex: 0,
                nextIndex: 1,
                curDom: undefined,
                nextDom: undefined,
                curLeft: 0,
                minLeft: -246,
                fadeLock: false,
                fadeTime: 5000,
                imgWidth: 246,
                controller: $('#top-main .controller'),
                controllerList: $('#top-main .controller li'),
                timer: undefined,
                accSpeed: 4,
                Cx: 0.02, //
                minRes: 1, //
                curSpeed: 0
            }, options);

            //
            function changeTo(index) {
                if (true == options.fadeLock) { return; }
                window.clearTimeout(options.timer);
                options.nextIndex = index;
                options.fadeLock = true;

                //
                options.curDom = options.liDomList.eq(options.curIndex);
                options.nextDom = options.liDomList.eq(options.nextIndex);
                options.nextDom.css('opacity', 0);
                options.curLeft = 0;
                options.curSpeed = 0;
                options.nextDom.css('left', options.curLeft + options.imgWidth);
                controlChange(options.nextIndex);

                move();
            }

            //
            function move() {
                var nextLeft = getNextLeft();
                var opacity = Math.abs(nextLeft / options.imgWidth);
                var opacityPer = parseInt(opacity * 100);
                options.curDom.css({ 'left': nextLeft, 'opacity': 1 - opacity, 'filter': 'alpha(opacity=' + (100 - opacityPer) + ')' });

                options.nextDom.css({ 'left': nextLeft + options.imgWidth, 'opacity': opacity, 'filter': 'alpha(opacity=' + opacityPer + ')' });
                if (nextLeft <= options.minLeft) {
                    options.curIndex = options.nextIndex;
                    options.fadeLock = false;
                    autoFade();
                } else {
                    window.setTimeout(move, 20);
                }
            }


            function getNextSpeed() {
                var incSpeed = options.accSpeed - options.minRes - options.curSpeed * options.Cx;
                return options.curSpeed += incSpeed;
            }


            function getNextLeft() {
                var nextSpeed = getNextSpeed();
                options.curLeft = options.curLeft - nextSpeed < options.minLeft ? options.minLeft : options.curLeft - nextSpeed;
                return options.curLeft;
            }

            //ȡ¸
            function changeNext() {
                var nextIndex = options.curIndex + 1 >= options.liDomListLen ? 0 : options.curIndex + 1;
                changeTo(nextIndex);
            }


            options.controller.delegate('li', 'click', function (e) {
                var index = $(e.currentTarget).index();
                changeTo(index);
            });



            function controlChange(index) {
                options.controllerList.eq(index).addClass('current').siblings('.current').removeClass('current');
            }


            function autoFade() {
                window.clearTimeout(options.timer);
                options.timer = window.setTimeout(changeNext, options.fadeTime);
            }

            autoFade();

            /*
            options.disableAutoEle.focusin(function(){
                window.clearTimeout(options.timer);	
            }).focusout(function(){
                autoFade();
            })
            */

            $(this).mouseenter(function () {
                window.clearTimeout(options.timer);
            }).mouseleave(function () {
                autoFade();
            });

            return $(this);
        }
    })
    $('#top-main .left-banner').fadeAnimate({});

</script>
</body>
</html>
