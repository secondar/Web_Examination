<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="Admin1_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
     <head id="Head1" runat="server">
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
     <style type="text/css">
.c_1 {
	width: 400px;
	margin: 0px auto;
	height: 100px;
	margin-top: 10px;
}
.c_1 ul li {
	height: 25px;
	line-height: 25px;
	text-align: center;
	margin-top: 10px;
}
.btn {
	width: 400px;
	margin: 0px auto;
	height: 30px;
	line-height: 30px;
	text-align: center;
}
</style>
     </head>
     <body>
     <form id="form1" runat="server">
       <div>
           <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程信息 <span class="c-gray en">&gt;</span> 添加课程 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px;width:45px;" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
       </div>

       <div class="c_1" style="text-align:center;">
         <ul>
           <li> </li>
           <li> 课程名称
             <asp:TextBox class="input-text" ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="TextBox2" ErrorMessage="*请填写"></asp:RequiredFieldValidator>
           </li>
         </ul>
       </div>
       <div style="text-align:center;">
         <asp:Button ID="Button1" class="btn btn-success radius" runat="server" Text="添加课程" Width="100" OnClick="Button1_Click"/>
       </div>
     </form>
</body>
</html>
