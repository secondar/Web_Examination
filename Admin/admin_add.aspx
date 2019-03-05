<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_add.aspx.cs" Inherits="Admin_admin_add" %>

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
    <style type="text/css">
        .tj {
            margin-left:40%;
            margin-top:70px;
        }
        .c_1{width:400px;margin:0px auto;height:130px;}
     .c_1 ul li{height:25px;line-height:25px;text-align:center;margin-top:20px;
            width: 400px;
        }
     .btn{width:400px;margin:0px auto;height:30px;line-height:30px;text-align:center;}
    .c_1_right{width:160px;float:left;}
    .c_1_left{width:100px;float:left;text-align:right;}
    .c_1_y{width:100px;float:left;text-align:left;}
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
    <div class="bj">
             <div class="m_box">
       <div class="c_1">
        <ul>
        <li>
            <div class="c_1_left"><asp:Label ID="Label1" runat="server" Text="帐    号:"></asp:Label></div>
            <div class="c_1_right"><asp:TextBox ID="TextBox1" runat="server" height="30px" Width="200px"></asp:TextBox></div>
            <div class="c_1_y"><asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ErrorMessage="*请输入数字" ClientValidationFunction="CustomValidator" 
                    ControlToValidate="TextBox1"></asp:CustomValidator>
            </div>
            </li>
        <li>
            <div class="c_1_left"><asp:Label ID="Label2" runat="server" Text="姓   名:"></asp:Label></div>
            <div class="c_1_right"><asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="200px"></asp:TextBox></div>
            <div class="c_1_y">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="*必填" ControlToValidate="TextBox2"></asp:RequiredFieldValidator></div>
            </li>
        <li>
           <div class="c_1_left"> <asp:Label ID="Label3" runat="server" Text="密    码:"></asp:Label></div>
           <div class="c_1_right"><asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Height="30px" Width="200px"></asp:TextBox></div>
           <div class="c_1_y">
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="*必填" ControlToValidate="TextBox3"></asp:RequiredFieldValidator></div>
            </li>       
        </ul>  
           
      </div>

     <div class="tj"><asp:Button class="btn btn-primary radius tj" ID="ImageButton1" runat="server" onclick="ImageButton1_Click" Text="提交" Width="100px" /> </div>

       
   </div>
    </div>
    </form>
</body>
</html>
