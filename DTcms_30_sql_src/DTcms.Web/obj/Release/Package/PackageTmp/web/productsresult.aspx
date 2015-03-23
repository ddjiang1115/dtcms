<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productsresult.aspx.cs" Inherits="DTcms.Web.web.productsresult" %>
<%@ Register src="/layout/head.ascx" tagname="head" tagprefix="uc2" %>
<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>美国生产流程-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
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
        $(".tab-result_content").hide(); //Hide all content
        $("ul.tab-result li:first").addClass("active").show(); //Activate first tab
        $(".tab-result_content:first").show(); //Show first tab content

        //On Click Event
        $("ul.tab-result li").click(function () {
            $("ul.tab-result li").removeClass("active"); //Remove any "active" class
            $(this).addClass("active"); //Add "active" class to selected tab
            $(".tab-result_content").hide(); //Hide all tab content
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

<body class="productsresult">
<!-- header-->
<uc2:head ID="head1" runat="server" />  
<!-- /header--> 
<!-- banner-->
<div class="fan_products_result">
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
    <div class="result">
    	<div class="result_content">
  			<div class="container">
                <ul class="tab-result">
                    <li><a href="#tab1">
                    	<div class="content_name">
                            <p class="img"><img src="images/mgsc.png" /></p>
                            <p class="name">美国生产</p>
                        </div>
                        <div class="content_date">
                            <p class="date">2014.12.05</p>
                            <p class="text">每一罐官方销售的旭贝尔都有美国原产地证明，写明在美国原产地的官方认证信息等，表明旭贝尔来自美国，100%原装进口。</p>
                        </div>
                    </a></li>
                    <li><a href="#tab2">
                    	<div class="content_name">
                            <p class="img"><img src="images/mgrk.png" /></p>
                            <p class="name">美国认可</p>
                        </div>
                        <div class="content_date">
                            <p class="date">2014.12.15</p>
                            <p class="text">每一罐官方销售的旭贝尔都有美国原产地证明，写明在美国原产地的官方认证信息等，表明旭贝尔来自美国，100%原装进口。</p>
                        </div></a></li>
                    <li><a href="#tab3">
                    	<div class="content_name">
                            <p class="img"><img src="images/mgjk.png" /></p>
                            <p class="name">美国进口</p>
                        </div>
                        <div class="content_date">
                            <p class="date">2014.12.05</p>
                            <p class="text">每一罐官方销售的旭贝尔都有美国原产地证明，写明在美国原产地的官方认证信息等，表明旭贝尔来自美国，100%原装进口。</p>
                        </div></a></li>
                    <li><a href="#tab4">
                    	<div class="content_name">
                            <p class="img"><img src="images/zgxs.png" /></p>
                            <p class="name">中国销售</p>
                        </div>
                        <div class="content_date">
                            <p class="date">2014.12.05</p>
                            <p class="text">每一罐官方销售的旭贝尔都有美国原产地证明，写明在美国原产地的官方认证信息等，表明旭贝尔来自美国，100%原装进口。</p>
                        </div></a></li>
            
                </ul>
                <div class="tab-result_container">
                    <div id="tab1" class="tab-result_content">
                        <div class="content_mg">
                            <p class="img"><img src="images/mgsc_02.png" /></p>
                            <p class="date">美国生产&nbsp;&nbsp;&nbsp;2014.12.05</p>
                            <p class="text">中国所有旭贝尔配方奶粉100%由美国PBM工厂美国四大婴幼儿配方奶粉公司之一生产制造及包装全湿法生产，不加糖，不加香，不添加速溶剂
真正的100%美国原产、原罐原装进口至中国全程不分装、不换罐、保证产品最高质量</p>
							<p class="next"></p>
                        </div>
                        <div class="bottom"></div>
                    </div>
                    <div id="tab2" class="tab-result_content">
                        <div class="content_mg">
                            <p class="img"><img src="images/mgrk_02.png" /></p>
                            <p class="date">美国认可&nbsp;&nbsp;&nbsp;2014.12.15</p>
                            <p class="text">中国所有旭贝尔配方奶粉100%由美国PBM工厂美国四大婴幼儿配方奶粉公司之一生产制造及包装全湿法生产，不加糖，不加香，不添加速溶剂
真正的100%美国原产、原罐原装进口至中国全程不分装、不换罐、保证产品最高质量</p>
							<p class="next"></p>
                        </div>                        
                        <div class="bottom"></div>
                    </div>
                    <div id="tab3" class="tab-result_content">   
                        <div class="content_mg">
                            <p class="img"><img src="images/mgjk_02.png" /></p>
                            <p class="date">美国进口&nbsp;&nbsp;&nbsp;2014.12.05</p>
                            <p class="text">中国所有旭贝尔配方奶粉100%由美国PBM工厂美国四大婴幼儿配方奶粉公司之一生产制造及包装全湿法生产，不加糖，不加香，不添加速溶剂
真正的100%美国原产、原罐原装进口至中国全程不分装、不换罐、保证产品最高质量</p>
							<p class="next"></p>
                        </div>                 
                        <div class="bottom"></div>
                    </div>
                    <div id="tab4" class="tab-result_content">
                        <div class="content_mg">
                            <p class="img"><img src="images/zgxs_02.png" /></p>
                            <p class="date">中国销售&nbsp;&nbsp;&nbsp;2014.12.05</p>
                            <p class="text">中国所有旭贝尔配方奶粉100%由美国PBM工厂美国四大婴幼儿配方奶粉公司之一生产制造及包装全湿法生产，不加糖，不加香，不添加速溶剂
真正的100%美国原产、原罐原装进口至中国全程不分装、不换罐、保证产品最高质量</p>
							<p class="next"></p>
                        </div>
                       <div class="bottom"></div>
                    </div>
                </div>
            </div>
    	</div>
    </div>
</div>
<!-- /banner--> 
<!-- footer-->
<uc1:foot ID="foot1" runat="server" />
<!-- /footer-->

</body>
</html>
