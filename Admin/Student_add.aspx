<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_add.aspx.cs" Inherits="Admin_Student_add" %>

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
      <link href="../css/Common.css" rel="stylesheet" type="text/css" />
     <link href="../css/admin.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
         
         .m_box {
              width: 510px;
         }
         .content
        {
            width: 500px;
            margin-top: 10px;
             top: 0px;
             left: 0px;
         }
        .ct_c
        {
            width: 500px;
            height: 410px;
        }
        .ct_c_1
        {
            height: 25px;
            margin-top: 10px;
        }
        .c_1_left
        {
            width: 130px;
            float: left;
            text-align: right;
            height: 26px;
            line-height: 26px;
            color: #666666;
        }
        .c_1_right
        {
            width: 330px;
            float: left;
            height: 26px;
            line-height: 26px;
        }
     .btn{width:400px;margin:0px auto;height:30px;line-height:30px;text-align:center;}
     </style>
        </style>
    <script type="text/javascript" language="javascript">
        function CustomValidator(source, arguments) {
            if (arguments.Value >= 0)
                arguments.IsValid = true;
            else
                arguments.IsValid = false;

        }
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>

            <div class="m_box">
    <div class="content">
        <div class="ct_c">
            <div class="ct_c_1">
                <div class="c_1_left">
                </div>
                <div class="c_1_right">
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    学 号:</div>
                <div class="c_1_right">
                    <asp:TextBox class="input-text" ID="txtStuID" runat="server" Width="150px"></asp:TextBox>

                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ErrorMessage="*请输入数字" ClientValidationFunction="CustomValidator" 
                    ControlToValidate="txtStuID"></asp:CustomValidator>

                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    姓 名:</div>
                <div class="c_1_right">
                    <asp:TextBox class="input-text" ID="txtStuName" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtStuName" ErrorMessage="*请输入"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    密 码:</div>
                <div class="c_1_right">
                    <asp:TextBox class="input-text" ID="txtStuPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtStuPwd" ErrorMessage="*请输入"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    重复密码:</div>
                <div class="c_1_right">
                    <asp:TextBox class="input-text" ID="txtStuPwdR" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtStuPwd"
                        ControlToValidate="txtStuPwdR" ErrorMessage="*密码不一致"></asp:CompareValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    密码问题:</div>
                <div class="c_1_right">
                    <asp:DropDownList ID="DropDownList3" runat="server" Width="120px">
                        <asp:ListItem>您的生日是？</asp:ListItem>
                        <asp:ListItem>您的高中班主任是？</asp:ListItem>
                        <asp:ListItem>您是什么星座？</asp:ListItem>
                        <asp:ListItem>您是哪一天入学？</asp:ListItem>
                        <asp:ListItem>您的爱好是？</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    答 案:</div>
                <div class="c_1_right">
                    <asp:TextBox class="input-text" ID="txtAnsPwd" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtAnsPwd" ErrorMessage="*请输入"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    性 别:</div>
                <div class="c_1_right">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="40px">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem Value="女"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                    专 业:</div>
                <div class="c_1_right">
                    <asp:DropDownList ID="ddlProfession" runat="server" Width="160px" DataSourceID="ReaderTypeDataSource" DataTextField="Name" >
                    </asp:DropDownList>


                    <%--<asp:DropDownList ID="ReaderType" runat="server" DataSourceID="ReaderTypeDataSource"
              DataTextField="readerTypeName" DataValueField="readerTypeId" Width="157px">
          </asp:DropDownList>--%>


                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                </div>
                <div class="c_1_right">
                </div>
            </div>
            <div class="ct_c_1">
                <div class="c_1_left">
                </div>
                <div class="c_1_right">

                    <asp:Button class="btn btn-primary radius" ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" Width="100px" Height="30px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                   <%-- <asp:Button class="btn btn-primary radius" ID="Button2" runat="server" Text="重置" OnClick="Button2_Click" Width="100px" />--%>

                    <%--<input  type="button" value="重置" id="btn1"  onclick="dothings();"/>--%>
                    <button onclick="javascript:location.reload();" class="btn btn-primary radius" style="Width:100px ;Height:30px">重置</button>
                    
                </div>
            </div>
        </div>
    </div>

                <asp:SqlDataSource ID="ReaderTypeDataSource" runat="server"  ProviderName="System.Data.SqlClient"></asp:SqlDataSource>

    </div>
    </form>

    
</body>
</html>
