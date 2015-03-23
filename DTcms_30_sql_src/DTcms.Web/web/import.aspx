<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="import.aspx.cs" Inherits="DTcms.Web.web.import" %>
<%@ Register src="/layout/head.ascx" tagname="head" tagprefix="uc2" %>
<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>100%美国进口-美国旭贝尔婴幼儿配方奶粉官方网站-今天旭贝尔，明天诺贝尔！</title>
<link rel="stylesheet" type="text/css" href="style/style.css" id="style">
<link rel="stylesheet" type="text/css" href="style/animate.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/maxshu.js"></script>
    <link href="/templates/green/css/style.css" rel="stylesheet" />
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

<body>
<!-- header-->
<uc2:head ID="head1" runat="server" />    
<!-- /header--> 
<!-- banner-->
<div class="fan_banner">
	<div class="bannBg_all">
		<div class="bannerCont">                
			<div class="fan_vermont"><img src="images/vermont_01.png"></div>
			<div class="fan_vermont_bt"><img src="images/down_02.png"></div>
			<div class="fan_100"><img src="images/100_02.png" /></div>
			<div class="fan_100_bt"><img src="images/down_02.png" /></div>
			<div class="fan_zhijian"><img src="images/zhijian_03.png" /></div>
			<div class="fan_zhijian_bt"><img src="images/down_02.png" /></div>
			<div class="fan_perrigo"><img src="images/perrigo_04.png"/></div>
			<div class="fan_perrigo_bt"><img src="images/down_02.png"/></div>
		</div>	
	</div>
</div>
<!-- /banner--> 
<!-- footer-->
<uc1:foot ID="foot1" runat="server" />
<!-- /footer-->
</body>
</html>
