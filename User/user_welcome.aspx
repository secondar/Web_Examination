<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_welcome.aspx.cs" Inherits="User_user_welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="../lib/html5shiv.js"></script>
<script type="text/javascript" src="../lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
    <title>我的桌面</title>
    <style type="text/css">
        .auto-style1 {
            height: 37px;
        }
    </style>
    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
    <script>
        window.onload = function ()
        {
            document.getElementById("IP").innerText = returnCitySN['cip'];
            document.getElementById("weizhi").innerText = returnCitySN['cname'];
        }
    </script> 
</head>
<body>
    <form id="form1" runat="server">
    <div>   
        <div class="page-container">
	        <p class="f-20 text-success">
                <asp:Label ID="lb_name" runat="server" Text="Label"></asp:Label>，欢迎使用在线考试系统</p>
            <p>登录位置：<label id="IP"></label><label id="weizhi" style="margin-left:15px;"></label></p>	
        </div>
        <div style="border:none;width:100%;height:500px;overflow:hidden;margin-top:20px;">   
            <div style="width:100%;height:800px;margin:-45px 0px 0px -10px;">  
                <iframe src="user_cjfx.aspx" width="100%" height="600" scrolling="no"></iframe>  
            </div>   
        </div>         
    <script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
    </div>
    </form>
</body>
</html>
