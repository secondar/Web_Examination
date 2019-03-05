<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div class="page-container">
	<p class="f-20 text-success">欢迎使用在线考试系统</p>

<p>登录位置：<script type="text/javascript" src="http://ip.chinaz.com/getip.aspx"></script></p>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th colspan="7" scope="col">信息统计</th>
			</tr>
			<tr class="text-c">
				<th>统计</th>
				<th>教师</th>
				<th>学生</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<td>总数</td>
				<td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
				<td>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
			</tr>
			
		</tbody>
	</table>
	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">服务器信息</th>
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
				<td>服务器端口 </td>
				<td><asp:Label ID="Sever_DuanKou" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>服务器IIS版本 </td>
				<td><asp:Label ID="Sever_IIS" runat="server" ></asp:Label></td>
			</tr>
			<tr>
				<td>本文件所在文件夹 </td>
				<td><asp:Label ID="Sever_Src" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>服务器操作系统 </td>
				<td><asp:Label ID="Sever_System" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>系统所在文件夹 </td>
				<td>C:\WINDOWS</td>
			</tr>
			<tr>
				<td>服务器脚本超时时间 </td>
				<td><asp:Label ID="Sever_bat" runat="server" Text="30000"></asp:Label></td>
			</tr>
			<tr>
				<td>服务器的语言种类 </td>
				<td><asp:Label ID="Sever_Lan" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>.NET Framework 版本 </td>
				<td><asp:Label ID="Sever_Net" runat="server" Text="Label"></asp:Label></td>
			</tr>
			
			<tr>
				<td>服务器IE版本 </td>
				<td>9.0000</td>
			</tr>
			<tr>
				<td>逻辑驱动器 </td>
				<td>C:\</td>
			</tr>
			<tr>
				<td>CPU 总数 </td>
				<td><asp:Label ID="Sever_Cpu" runat="server" Text="Label"></asp:Label></td>
			</tr>
			<tr>
				<td>CPU 类型 </td>
				<td><asp:Label ID="Sever_CpuClass" runat="server" Text="Label"></asp:Label></td>
			</tr>
			
			
		</tbody>
	</table>
</div>

<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 

    </div>
    </form>
</body>
</html>
