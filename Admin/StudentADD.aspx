<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentADD.aspx.cs" Inherits="Admin_StudentADD" %>

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
    <title>学生</title>
</head>
<body>
<form id="form1" runat="server">
    <div>
    

                <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 学生管理 <span class="c-gray en">&gt;</span> 学生列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">


    <div class="page-container">
	<div class="text-c">
	 <span class=" inline">
         查询条件：&nbsp;
		<asp:DropDownList class="select" ID="DropDownList1" runat="server" Width="90px" Height="30px">
                  <asp:ListItem Value="name">姓名</asp:ListItem>
                  <asp:ListItem Value="id">帐号</asp:ListItem>
            <asp:ListItem Value="JoinTime">加入时间</asp:ListItem>
            <asp:ListItem Value="profession">专业</asp:ListItem>
            <asp:ListItem Value="Sex">性别</asp:ListItem>
              </asp:DropDownList>
		</span>
        <asp:TextBox ID="TextBox1" runat="server" style="width:250px" class="input-text" ></asp:TextBox>

            &nbsp;&nbsp;&nbsp;<asp:Button class="btn btn-success Hui-iconfont" ID="ImageButton1" runat="server" Text="&#xe665;&nbsp;搜索" onclick="ImageButton1_Click" Width="100px"></asp:Button>
       


	</div>
    </div>



	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
        <asp:Button class="btn btn-danger radius" ID="Button3" runat="server" onclick="ImageButton3_Click" Text="全选" />

         <asp:Button class="btn btn-danger radius Hui-iconfont" ID="Button4" runat="server" Text="&#xe6e2;&nbsp;批量删除" onclick="ImageButton2_Click"/>

    <a href="javascript:;" onclick="Student_add('添加学生','Student_add.aspx','550','520')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加学生</a>
       
     </span> <span class="r">共有数据：<strong><asp:Label ID="Label5" runat="server" Text="0"></asp:Label></strong> 条</span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col">学生列表</th>
			</tr>
			
		</thead>


	</table>


            <div class="m_box">

      <div class="table table-border table-bordered table-bg">
          

          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
              Height="23px" Width="100%" 
              onpageindexchanging="GridView1_PageIndexChanging" 
              onrowdeleting="GridView1_RowDeleting" 
              onrowcancelingedit="GridView1_RowCancelingEdit" onrowediting="GridView1_RowEditing" 
              onrowupdating="GridView1_RowUpdating" BorderStyle="None">
              <Columns>
                  <asp:TemplateField HeaderText="选择">
                      <ItemTemplate>
                          <asp:CheckBox ID="CheckBox1" runat="server" />
                      </ItemTemplate>    
                      <ItemStyle/>                 
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="学号">
                      <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate><asp:TextBox ID="TextBox1"  CssClass="tb" Width="70px" runat="server" Text='<%# Bind("ID") %>' ReadOnly="True" BorderStyle="None"></asp:TextBox></EditItemTemplate>
                  <ItemStyle/>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="姓名">
                      <ItemTemplate>
                          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate><asp:TextBox ID="TextBox2"  CssClass="tb" Width="40px" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox></EditItemTemplate>       
                      <ItemStyle/>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="密码">
                      <ItemTemplate>
                          <asp:Label ID="Label3" runat="server" Text='<%# Bind("PWD") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate><asp:TextBox ID="TextBox3"   CssClass="tb" Width="80px" runat="server" Text='<%# Bind("PWD") %>'></asp:TextBox></EditItemTemplate>   
                      <ItemStyle/>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="性别">
                      <ItemTemplate>
                          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Sex") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate><asp:TextBox ID="TextBox4"  CssClass="tb"  Width="20px" runat="server" Text='<%# Bind("Sex") %>'></asp:TextBox></EditItemTemplate>
                  <ItemStyle/>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="加入时间">
                      <ItemTemplate>
                          <asp:Label ID="Label5" runat="server" Text='<%# Bind("JoinTime") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate><asp:TextBox ID="TextBox5"  CssClass="tb" Width="150px" runat="server" Text='<%# Bind("JoinTime") %>'></asp:TextBox></EditItemTemplate>
                      <ItemStyle/>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="密码问题">
                      <ItemTemplate>
                          <asp:Label ID="Label6" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate><asp:TextBox ID="TextBox6"  CssClass="tb" Width="80px"  runat="server" Text='<%# Bind("Question") %>'></asp:TextBox></EditItemTemplate>
                      <ItemStyle/>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="密码答案">
                      <ItemTemplate>
                          <asp:Label ID="Label7" runat="server" Text='<%# Bind("Answer") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate><asp:TextBox ID="TextBox7"  CssClass="tb" Width="60px"  runat="server" Text='<%# Bind("Answer") %>'></asp:TextBox></EditItemTemplate>
                      <ItemStyle/>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="专业">
                      <ItemTemplate>
                          <asp:Label ID="Label8" runat="server" Text='<%# Bind("profession") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate><asp:TextBox ID="TextBox8"  CssClass="tb" Width="120px" runat="server" Text='<%# Bind("profession") %>'></asp:TextBox></EditItemTemplate>
                      <ItemStyle/>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="编辑  删除" ShowHeader="False">
                      <ItemTemplate>
                          <asp:Button class="btn btn-primary radius" ID="Button1" runat="server" CausesValidation="False" 
                              CommandName="Edit" Text="编辑" />
                          &nbsp;<asp:Button class="btn btn-danger radius" ID="Button2" runat="server" CausesValidation="False" 
                              CommandName="Delete" Text="删除"  OnClientClick="return confirm('您确认删除该记录吗?')"/>
                      </ItemTemplate>
                      <EditItemTemplate>
                          <asp:Button class="btn btn-primary radius" ID="Button1" runat="server" CausesValidation="True" 
                              CommandName="Update" Text="更新" />
                          &nbsp;<asp:Button class="btn btn-success radius" ID="Button2" runat="server" CausesValidation="False" 
                              CommandName="Cancel" Text="取消" />
                      </EditItemTemplate>
                  </asp:TemplateField>
              </Columns>
              <RowStyle HorizontalAlign="Center" /> 
              <RowStyle BackColor="White" ForeColor="#333333" />
          </asp:GridView>



        </div>

    </div>

    </div>
    </form>
    <!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="../llib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../llib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript">
        /*
            参数解释：
            title	标题
            url		请求的url
            id		需要操作的数据id
            w		弹出层宽度（缺省调默认值）
            h		弹出层高度（缺省调默认值）
        */
        /*管理员-增加*/
        function Student_add(title, url, w, h) {
            layer_show(title, url, w, h);
        }

</script>
</body>
</html>
