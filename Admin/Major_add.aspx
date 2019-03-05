<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Major_add.aspx.cs" Inherits="Admin_zhuanye_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="../favicon.ico" >
<link rel="Shortcut Icon" href="../favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
    <title></title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div class="tj">
    
        <br />
        <br />
        专业名称：<asp:TextBox class="input-text" ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
        <br />
        <br />
        <asp:Button class="btn btn-primary radius " ID="Button1" runat="server" Text="提 交" Width="100px" OnClick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>
