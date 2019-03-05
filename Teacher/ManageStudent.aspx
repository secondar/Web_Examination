<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageStudent.aspx.cs" Inherits="Admin1_Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<title>学生信息</title>
</head>
<body>
<form id="form1" runat="server">
  <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 学生管理 <span class="c-gray en">&gt;</span> 学生信息 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
  <div class="page-container">
    <div class="text-c"> 查询条件:
      <asp:DropDownList ID="DropDownList_flag" runat="server" class="input-text" style="margin-top:2px" Width="99px">
        <asp:ListItem Value="Name">姓名</asp:ListItem>
        <asp:ListItem Value="ID">学号</asp:ListItem>
      </asp:DropDownList>
      <asp:TextBox ID="TextBox_select" class="input-text" style="width:250px" placeholder="关键字" runat="server"></asp:TextBox>
      <asp:Button ID="Button_select" class="btn btn-success radius" runat="server" Text="查询" OnClick="Button_select_Click" />
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="r">共有数据：<strong>
      <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
      </strong>条</span> </div>
    <div class="mt-20">
      <table class="table table-border table-bordered table-hover table-bg table-sort">
        <thead>
          <tr class="text-c">
            <th>学号</th>
            <th>姓名</th>
            <th>密码</th>
            <th>性别</th>
            <th>加入时间</th>
            <th>密码问题</th>
            <th>密码答案</th>
            <th>专业</th>
          </tr>
        </thead>
        <tbody>
          <asp:Repeater ID="Repeater_dh" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
              <tr class="text-c">
                <td><%#Eval("ID") %></td>
                <td><%#Eval("Name") %></td>
                <td><%#Eval("PWD") %></td>
                <td><%#Eval("Sex") %></td>
                <td><%#Eval("JoinTime") %></td>
                <td><%#Eval("Question") %></td>
                <td><%#Eval("Answer") %></td>
                <td><%#Eval("profession") %></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </tbody>
      </table>
    </div>
  </div>
  <!--_footer 作为公共模版分离出去--> 
  <script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
  <script type="text/javascript" src="../lib/layer/2.4/layer.js"></script> 
  <script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
  <script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去--> 
  
  <!--请在下方写此页面业务相关的脚本--> 
  <script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script> 
  <script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
  <script type="text/javascript" src="../lib/laypage/1.2/laypage.js"></script>
</form>
</body>
</html>
