<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddTaoTi.aspx.cs" Inherits="Admin1_Default" %>

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
<title>试卷定制</title>
<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin:auto;">
<form id="form" runat="server">
  <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 试卷 <span class="c-gray en">&gt;</span> 试卷管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
  <div id="add" runat="server">
    <div class="page-container">
      <div class="form form-horizontal" id="form-article-add">
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>试卷名称：</label>
          <div class="formControls col-xs-8 col-sm-9">
            <asp:TextBox ID="txtPaperName" runat="server" class="input-text"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*必填" ControlToValidate="txtPaperName"></asp:RequiredFieldValidator>
          </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">考试科目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="ddlCourse" class="select" runat="server"> </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>考试时间：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="DropDownList1" class="select"
                               runat="server">
              <asp:ListItem Value="30">30分钟</asp:ListItem>
              <asp:ListItem Value="60">60分钟</asp:ListItem>
              <asp:ListItem Value="90">90分钟</asp:ListItem>
              <asp:ListItem Value="120">120分钟</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">试卷状态：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="DropDownList2" class="select"
                               runat="server">
              <asp:ListItem Value="1">可用</asp:ListItem>
              <asp:ListItem Value="0">不可用</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">　单选题　</label>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">章节：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <asp:DropDownList ID="DropDownList5" runat="server" class="select"> </asp:DropDownList>
            </span></div></div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">题目数目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="SingleNum" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">每题分数：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="SingleFen" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
          <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">章节：</label>
              <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <asp:DropDownList ID="DropDownList6" runat="server" class="select"> </asp:DropDownList>
              </span></div></div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">题目数目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="SingleNum1" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">每题分数：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="SingleFen1" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
          <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">章节：</label>
              <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <asp:DropDownList ID="DropDownList7" runat="server" class="select"> </asp:DropDownList>
              </span></div></div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">题目数目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="SingleNum2" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">每题分数：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="SingleFen2" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">　多选题　</label>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">章节：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <asp:DropDownList ID="DropDownList8" runat="server" class="select"> </asp:DropDownList>
            </span></div></div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">题目数目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="MultiNum" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">每题分数：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="MultiFen" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
          <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">章节：</label>
              <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <asp:DropDownList ID="DropDownList9" runat="server" class="select"> </asp:DropDownList>
              </span></div></div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">题目数目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="MultiNum1" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">每题分数：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="MultiFen1" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
          <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">章节：</label>
              <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <asp:DropDownList ID="DropDownList10" runat="server" class="select"> </asp:DropDownList>
              </span></div></div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">题目数目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="MultiNum2" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">每题分数：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="MultiFen2" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">　判断题　</label>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">章节：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <asp:DropDownList ID="DropDownList11" runat="server" class="select"> </asp:DropDownList>
            </span></div></div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">题目数目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="JudgeNum" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">每题分数：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList 　ID="JudgeFen" runat="server"　class="select" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
          <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">章节：</label>
              <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
          <asp:DropDownList ID="DropDownList12" runat="server" class="select"> </asp:DropDownList>
              </span></div></div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">题目数目：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList ID="JudgeNum1" runat="server" class="select" AutoPostBack="True">
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
              <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>6</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
              <asp:ListItem>8</asp:ListItem>
              <asp:ListItem>9</asp:ListItem>
              <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-xs-4 col-sm-2">每题分数：</label>
          <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
            <asp:DropDownList 　ID="JudgeFen1" runat="server"　class="select" AutoPostBack="True">
              <asp:ListItem Value="1">1分</asp:ListItem>
              <asp:ListItem Value="2">2分</asp:ListItem>
              <asp:ListItem Value="3">3分</asp:ListItem>
              <asp:ListItem Value="4">4分</asp:ListItem>
              <asp:ListItem Value="5">5分</asp:ListItem>
              <asp:ListItem Value="6">6分</asp:ListItem>
              <asp:ListItem Value="7">7分</asp:ListItem>
              <asp:ListItem Value="8">8分</asp:ListItem>
              <asp:ListItem Value="9">9分</asp:ListItem>
              <asp:ListItem Value="10">10分</asp:ListItem>
            </asp:DropDownList>
            </span> </div>
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
          <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" style="text-align:center;">
            <asp:Button ID="Button_preview" class="btn btn-primary radius" runat="server" Text="预览" OnClick="Button_preview_Click" />
            <button onClick="article_save();" class="btn btn-default radius" type="button">取消</button>
            <br />
            <br />
            <asp:Label ID="Label25" runat="server" Text="注意：添加试卷总分不能超过100分" Font-Bold="True"  Font-Size="Smaller" ForeColor="#1E7ACE"></asp:Label>
            <asp:Label ID="Label23" runat="server" Text="（当前总分"></asp:Label>
            <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="#FF3300" Text="Label"></asp:Label>
            <asp:Label ID="Label22" runat="server" Text="分）"></asp:Label>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="preview_div" runat="server" style="margin:auto; width:999px;">
    <div style="width:999px; margin-left:5%;">
      <asp:GridView ID="GridView1" runat="server" Width=100% 
                                            AutoGenerateColumns="False" 
              HorizontalAlign="Center" EnableModelValidation="True">
        <Columns>
        <asp:TemplateField HeaderText="一、选择题">
          <ItemTemplate>
            <TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
              <TR>
                <TD colSpan="3"><asp:Label id=Label1 runat="server" Text='<%# Container.DataItemIndex+1 %>'> </asp:Label>
                  <asp:Label id=Label2 runat="server" Text='<%# Eval("Title","、{0}") %>'> </asp:Label>
                  <asp:Label id=Label3 runat="server" Text='<%# Eval("ID") %>' Visible="False"> </asp:Label></TD>
              </TR>
              <TR>
                <TD width="35%"><asp:RadioButton id=RadioButton1 runat="server" Text='<%# Eval("AnswerA") %>' GroupName="Sl"> </asp:RadioButton></TD>
                <TD width="35%"><asp:RadioButton id=RadioButton2 runat="server" Text='<%# Eval("AnswerB") %>' GroupName="Sl"> </asp:RadioButton></TD>
                <TD></TD>
              </TR>
              <TR>
                <TD width="35%"><asp:RadioButton id=RadioButton3 runat="server" Text='<%# Eval("AnswerC") %>' GroupName="Sl"> </asp:RadioButton></TD>
                <TD width="35%"><asp:RadioButton id=RadioButton4 runat="server" Text='<%# Eval("AnswerD") %>' GroupName="Sl"> </asp:RadioButton></TD>
                <TD></TD>
              </TR>
            </TABLE>
          </ItemTemplate>
          <HeaderStyle Height="20px" />
        </asp:TemplateField>
        </Columns>
        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
      </asp:GridView>
    </div>
    <div class="clear"></div>
    <div style="width:999px; margin-left:5%;">
      <asp:GridView ID="GridView2" runat="server" Width=100% 
                                            AutoGenerateColumns="False" HorizontalAlign="Center" 
              EnableModelValidation="True">
        <Columns>
        <asp:TemplateField HeaderText="二、多选题">
          <ItemTemplate>
            <TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
              <TR>
                <TD colSpan="3"><asp:Label id=Label9 runat="server" Text='<%# Container.DataItemIndex+1 %>'> </asp:Label>
                  <asp:Label id=Label10 runat="server" Text='<%# Eval("Title","、{0}") %>'> </asp:Label>
                  <asp:Label id=Label6 runat="server" Text='<%# Eval("ID") %>' Visible="False"> </asp:Label></TD>
              </TR>
              <TR>
                <TD style="HEIGHT: 22px" width="35%"><asp:CheckBox id=CheckBox1 runat="server" Text='<%# Eval("AnswerA") %>'> </asp:CheckBox></TD>
                <TD style="HEIGHT: 22px" width="35%"><asp:CheckBox id=CheckBox2 runat="server" Text='<%# Eval("AnswerB") %>'> </asp:CheckBox></TD>
                <TD style="HEIGHT: 22px"></TD>
              </TR>
              <TR>
                <TD width="35%"><asp:CheckBox id=CheckBox3 runat="server" Text='<%# Eval("AnswerC") %>'> </asp:CheckBox></TD>
                <TD width="350%"><asp:CheckBox id=CheckBox4 runat="server" Text='<%# Eval("AnswerD") %>'> </asp:CheckBox></TD>
                <TD></TD>
              </TR>
            </TABLE>
          </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
      </asp:GridView>
    </div>
    <div class="clear"></div>
    <div style="width:999px; margin-left:5%;">
      <asp:GridView ID="GridView3" runat="server" Width=100% 
                                            AutoGenerateColumns="False" HorizontalAlign="Center" 
              EnableModelValidation="True">
        <Columns>
        <asp:TemplateField HeaderText="三、判断题">
          <ItemTemplate>
            <TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
              <TR>
                <TD width="85%"><asp:Label id=Label19 runat="server" Text='<%# Container.DataItemIndex+1 %>'> </asp:Label>
                  <asp:Label id=Label20 runat="server" Text='<%# Eval("Title","、{0}") %>'> </asp:Label>
                  <asp:Label id=Label7 runat="server" Text='<%# Eval("ID") %>' Visible="False"> </asp:Label></TD>
                <TD width="15%"><asp:RadioButtonList ID="RadioButtonList1" runat="server" name="RadioButtonList1"
                                                RepeatDirection="Horizontal">
                    <asp:ListItem Value="true">正确</asp:ListItem>
                    <asp:ListItem Value="false">错误</asp:ListItem>
                  </asp:RadioButtonList></TD>
              </TR>
            </TABLE>
          </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
      </asp:GridView>
    </div>
    <div class="clear"></div>
    <div style="text-align:center; margin-left:5%;">
      <asp:Button ID="Button_insertinto" class="btn btn-primary radius" runat="server" Text="保存" OnClick="Button_insertinto_Click" />
      <asp:Button ID="Button_back" class="btn btn-default radius" runat="server" Text="返回" OnClick="Button_back_Click" />
    </div>
  </div>
</form>
<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script> 
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去--> 

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript">
    function article_save() {
        window.parent.location.reload();
    }
</script>
</body>
</html>