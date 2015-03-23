<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DTcms.Web.admin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        VIH_DisplayOnPage = "no";
    </script> 
<%--<script type="text/javascript" src="http://scripts.hashemian.com/js/visitorIPHOST.js.php"></script> --%>
    <script language="JavaScript" src="http://www.hashemian.com/js/visitorIP.js.php"></script>
<script type="text/javascript">
    $.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=' + VIH_HostIP, function (_result) {
        var ipData = ""; //初始化保存内容变量
        if (remote_ip_info.ret == '1') {
            ipData += "IP 详细信息：<br>";
            ipData += "IP：" + VIH_HostIP + "<br>";
            ipData += "国家：" + remote_ip_info.country + "<br>";
            ipData += "省份：" + remote_ip_info.province + "<br>";
            ipData += "城市：" + remote_ip_info.city + "<br>";
            ipData += "区：" + remote_ip_info.district + "<br>";
            ipData += "ISP：" + remote_ip_info.isp + "<br>";
            ipData += "类型：" + remote_ip_info.type + "<br>";
            ipData += "其他：" + remote_ip_info.desc + "<br>";
            alert(ipData); //显示处理后的数据
        } else {
            alert('错误', '没有找到匹配的 IP 地址信息！');
        }
    });
</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input type="hidden" id="ip" runat="server" />
        fdsfdsfdsfdsf
    </div>



    </form>
</body>
</html>
