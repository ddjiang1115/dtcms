<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpLoadFile.aspx.cs" Inherits="DTcms.Web.UpLoadFile.UpLoadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="/scripts/jquery/jquery-1.10.2.min.js"></script>
    <link href="/admin/skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function GetExcel(filename) {
            window.parent.GetExcel(filename);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:FileUpload ID="FileUpload1" runat="server" /><asp:Button ID="Button1" runat="server" Text="导入" CssClass="btn left20" OnClick="Button1_Click" /><a class="left20">导入表格模板下载</a>
    </div>
    </form>
    
</body>
</html>