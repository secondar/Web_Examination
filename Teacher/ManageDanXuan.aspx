<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageDanXuan.aspx.cs" Inherits="Admin1_Default2" %>
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
<title>单选题列表</title>
</head>
<body>
<form id="form1" runat="server">
  <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 试题 <span class="c-gray en">&gt;</span> 单选题列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
  <div class="page-container">
    <div class="text-c"> 查询条件:
      <asp:DropDownList ID="DropDownList_flag" runat="server" class="input-text" style="margin-top:2px" Width="99px">
        <asp:ListItem Value="c_id">课程号</asp:ListItem>
        <asp:ListItem Value="Title">题目</asp:ListItem>
      </asp:DropDownList>
      <asp:TextBox ID="TextBox_select" class="input-text" style="width:250px" placeholder="关键字" runat="server"></asp:TextBox>
      <asp:Button ID="Button_select" class="btn btn-success radius" runat="server" Text="查询" OnClick="Button_select_Click" />
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadelAll()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong>
      <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
      </strong>条</span> </div>
    <div class="mt-20">
      <table class="table table-border table-bordered table-hover table-bg table-sort">
        <thead>
          <tr class="text-c">
            <th width="70"><input style="margin-left:20px;" type="checkbox" name="" value="">
              选择</th>
            <th>课程号</th>
            <th>题目</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <asp:Repeater ID="Repeater_dh" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
              <tr class="text-c">
                <td><input type="checkbox" value="<%#Eval("ID") %>" name="checkbox"></td>
                <td><%#Eval("c_id") %></td>
                <td><%#Eval("Title") %></td>
                <td><a title="编辑" href="ChangeDanXuan.aspx?ID=<%#Eval("ID") %>" Class="btn btn-primary radius" style="text-decoration:none">编辑</a> <a title="删除" href="javascript:;" onclick="Delete(this,'<%#Eval("ID") %>')" class="btn btn-danger radius" style="text-decoration:none">删除</a></td>
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
<script type="text/javascript">
    function datadelAll() {
        var s = document.getElementsByName("checkbox");
        var s2 = "";
        for (var i = 0; i < s.length; i++) {
            if (s[i].checked) {
                s2 += s[i].value + "*";
            }
        }
        s2 = s2.substr(0, s2.length - 1);
        layer.confirm('确认要删除选中项目吗？', function (index) {
            $.ajax({
                url: "ManageDanXuan.aspx/DeleteAll",
                type: "post",
                data: "{'s':'" + s2 + "'}",
                dataType: 'json',
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    if (data.d == "true") {
                        layer.msg('已删除!', { icon: 1, time: 1000 });
                    } else {
                        layer.msg('删除失败!', { icon: 1, time: 1000 });
                    }
                    setTimeout("location.href = 'ManageDanXuan.aspx'", 1000);
                },
                error: function (data) {
                    layer.msg('删除失败!', { icon: 1, time: 3000 });
                    setTimeout("location.href = 'ManageDanXuan.aspx'", 1000);
                },
            });
        });
    }
    function Delete(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                url: "ManageDanXuan.aspx/Delete",
                type: "post",
                data: "{'s':'" + id + "'}",
                dataType: 'json',
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    if (data.d == "true") {
                        layer.msg('已删除!', { icon: 1, time: 1000 });
                    } else {
                        layer.msg('删除失败!', { icon: 1, time: 1000 });
                    }
                    setTimeout("location.href = 'ManageDanXuan.aspx'", 1000);
                },
                error: function (data) {
                    layer.msg('删除失败!', { icon: 1, time: 3000 });
                    setTimeout("location.href = 'ManageDanXuan.aspx'", 1000);
                },
            });
        });
    }
    function show(title, url, w, h) {
        layer_show(title, url, w, h);
    }
</script>
</body>
</html>
