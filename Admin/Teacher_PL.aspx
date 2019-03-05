<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teacher_PL.aspx.cs" Inherits="Admin_Teacher_PL" %>

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
         <style type="text/css">
         .xs {
            margin-left:25%;
        }
             .table-bordered {
                 width:50%;
             }
     </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 教师管理 <span class="c-gray en">&gt;</span> 批量添加教师账号 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
        <div style="text-align: center">
        <br />
        <br />
        <asp:FileUpload runat="server" class="btn btn-primary radius" ID="FuTest" Width="500px" /> &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button class="btn btn-success radius" ID="Button2" runat="server" Text="上传" OnClick="Button2_Click" />&nbsp;&nbsp;
        <asp:Button class="btn btn-primary radius" ID="Button1" runat="server" Text="批量导入账号" OnClick="Button1_Click" Width="120px" />
        <br />
        <br />
        <div class="bg">
            <div class="table table-border table-bordered table-bg xs">
        <asp:GridView  ID="GridView1" runat="server" Width="100%" BorderStyle="None">
        </asp:GridView>
        </div>

        </div>
        
    </div>

    </div>
    </form>
</body>
</html>
