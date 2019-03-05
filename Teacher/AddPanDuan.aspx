<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPanDuan.aspx.cs" Inherits="Admin1_Default2" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<link href="../css/Common.css" rel="stylesheet" type="text/css" />
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.m_t {
	width: 1141px;
	height: 25px;
	border-top: 2px dotted #ddd;
	line-height: 25px;
	color: #369aff;
	font-size: 13px;
	font-weight: bold;
}
.m_t_h {
	width: 505px;
	height: 25px;
	line-height: 25px;
	float: left;
}
#notice {
	width: 1141px;
	height: 25px;
	text-align: center;
	color: #1e7ace;
	font-weight: bold;
	line-height: 25px;
}
.view {
	width: 1141px;
	height: auto;
}
.view_1 {
	width: 1141px;
	height: auto;
}
.baocun {
	width: 1141px;
	height: 25px;
	text-align: center;
	border-top: 2px solid #ddd;
	padding-top: 5px;
}
</style>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>判断题录入</title>
<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin:auto;">
<form id="form" runat="server">
  <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 试题 <span class="c-gray en">&gt;</span> 判断题录入 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
  <div id="add" runat="server">
    <div class="page-container">
      <div class="form form-horizontal" id="form-article-add">
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>添加判断题：</label>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">考试课程：</label>
          <div class="formControls col-xs-8 col-sm-9">
            <asp:DropDownList ID="ddlCourse" runat="server" Width="99px"> </asp:DropDownList>
          </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>所属章节：</label>
          <div class="formControls col-xs-8 col-sm-9">
             <asp:DropDownList ID="DropDownList5" runat="server" > </asp:DropDownList>
          </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>题目：</label>
          <div class="formControls col-xs-8 col-sm-9">
            <asp:TextBox ID="txtTitle" runat="server" TextMode="MultiLine" Width="900px" 
                  Height="150px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ErrorMessage="*不能为空" ForeColor="#369AFF" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
          </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">正确答案：</label>
          <div class="formControls col-xs-8 col-sm-9">
            <asp:RadioButtonList ID="rblAnswer" runat="server" 
                  RepeatDirection="Horizontal" Width="165px">
              <asp:ListItem Value="true">正确</asp:ListItem>
              <asp:ListItem Value="false">错误</asp:ListItem>
            </asp:RadioButtonList>
          </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">难度等级：</label>
          <div class="formControls col-xs-8 col-sm-9">
            <asp:DropDownList ID="DropDownList3" runat="server" Width="80px">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
            </asp:DropDownList>
          </div>
        </div>
        <div class="row cl">
          <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" >
            <a href="ImportDanxuan.aspx?flag=3" class="btn btn-default radius">批量导入</a>　　
            <asp:Button ID="Button_preview" class="btn btn-primary radius" runat="server" Text="添加" OnClick="Button_preview_Click"/>
            <br />
            <br />
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
<script type="text/javascript">
    function article_save() {
        window.parent.location.reload();
    }
</script>
</body>
</html>