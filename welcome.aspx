<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>我的桌面</title>
</head>
<body>
    <div class="page-container">
	<p class="f-20 text-success">欢迎使用在线考试系统 <span class="f-14">v1.0</span></p>
<p>本次登录IP：<script type="text/javascript" src="http://ip.chinaz.com/getip.aspx"></script></asp:Label></p>
    <table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">信息统计</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">单选题</th>
				<td><span id="Span1">
                    <asp:Label ID="Label_DanXuan" runat="server" Text="Label"></asp:Label></asp:Label></span></td>
			</tr>
            <tr>
				<td>多选题</td>
				<td><asp:Label ID="Label_DuoXuan" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>判断题</td>
				<td><asp:Label ID="Label_PanDuan" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>课程数</td>
				<td><asp:Label ID="Label_KeCheng" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>学生数</td>
				<td><asp:Label ID="Label_Stu" runat="server" Text="Label"></asp:Label></td>
			</tr>
            <tr>
				<td>学生数</td>
				<td><asp:Label ID="Label_ShiJuan" runat="server" Text="Label"></asp:Label></td>
			</tr>
            <tr>
				<td>试卷数</td>
				<td><asp:Label ID="Label_ChengJi" runat="server" Text="Label"></asp:Label></td>
			</tr>
		</tbody>
	</table>


	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">信息</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">服务器计算机名</th>
				<td><span id="lbServerName">
                    <asp:Label ID="Sever_Name" runat="server" Text="Label"></asp:Label></span></td>
			</tr>
            <tr>
				<td>客户端计算机名 </td>
				<td><asp:Label ID="Label_Name" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>服务器IP地址</td>
				<td><asp:Label ID="Sever_Ip" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>服务器域名</td>
				<td><asp:Label ID="Sever_YuMing" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>系统信息</td>
				<td><asp:Label ID="Sever_System" runat="server" Text="Label"></asp:Label></td>
			</tr>
		</tbody>
	</table>
</div>
<footer class="footer mt-20">
	<div class="container">
	</div>
</footer>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
</body>
</html>
