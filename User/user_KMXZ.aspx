<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_KMXZ.aspx.cs" Inherits="User_user_KMXZ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:400px;height:300px;margin:50px auto;">
        <div style="border-bottom:1px solid #e5e5e5;font-family:'微软雅黑';font-size:25px;text-align:center;margin-bottom:30px;">选择试题</div>
        <div style="width:270px;margin:0 auto;">
            <asp:Label ID="Label3" runat="server" Text="科 目："></asp:Label>
            <asp:DropDownList ID="ddlLesson" runat="server" Width="200px" Height="30px" AutoPostBack="True" onselectedindexchanged="ddlLesson_SelectedIndexChanged"></asp:DropDownList>
        </div>        
        <br />
        <div style="width:270px;margin:0 auto;">
            <asp:Label ID="Label1" runat="server" Text="试 卷："></asp:Label>
            <asp:DropDownList ID="ddlQueName" runat="server" Width="200px" Height="30px"></asp:DropDownList>
        </div>
        <br />
        <div style="margin-left:170px;">
            <asp:Button ID="Button1" runat="server" Text="确  定" Width="120px" Height="30px" OnClick="Button1_Click"/>
        </div>                
    </div>
    <div style="float:right;margin-top:50px;">
        <img src="../images/sj1.jpg" />
    </div>
    </form>
</body>
</html>
