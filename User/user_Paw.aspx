<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_Paw.aspx.cs" Inherits="User_user_Paw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">    
    <div style="width:300px;height:300px;margin:50px auto;">
        <div style="border-bottom:1px solid #e5e5e5;font-family:'微软雅黑';font-size:25px;text-align:center;margin-bottom:20px;">修改密码</div>
        <div style="margin-left:15px;">
            <asp:Label ID="Label3" runat="server" Text="旧密码："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        </div>        
        <br />
        <div style="margin-left:15px;">
            <asp:Label ID="Label1" runat="server" Text="新密码："></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="Label2" runat="server" Text="确认密码："></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <br />
        <div style="margin-left:105px;">
            <asp:Button ID="Button1" runat="server" Text="确  定" Width="120px" Height="30px" OnClick="Button1_Click" />
        </div>                
     </div>
    </form>
</body>
</html>
