<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Admin_index" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="../favicon.ico" >
<link rel="Shortcut Icon" href="../favicon.ico" />
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<title>WEB在线考试系统V1.0--教师</title>
</head>
<body>
<form id="form1" runat="server">
  <div>
    <header class="navbar-wrapper">
      <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">WEB在线考试系统--教师</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a> <span class="logo navbar-slogan f-l mr-10 hidden-xs">v3.1</span> <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
          <nav class="nav navbar-nav">
            <ul class="cl">
              <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
                <ul class="dropDown-menu menu radius box-shadow">
                  <li><a href="javascript:;" onclick="member_add('添加课程','AddCourse.aspx','1000','510')"><i class="Hui-iconfont">&#xe616;</i> 新增课程</a></li>
                  <li><a href="javascript:;" onclick="member_add('试卷定制','AddTaoTi.aspx','1000','510')"><i class="Hui-iconfont">&#xe613;</i> 试卷定制</a></li>
                  <li><a href="javascript:;" onclick="member_add('添加单选题','AddDanXuan.aspx','1000','510')"><i class="Hui-iconfont">&#xe620;</i> 单选题</a></li>
                  <li><a href="javascript:;" onclick="member_add('添加多选题','AddDuoXuan.aspx','1000','510')"><i class="Hui-iconfont">&#xe60d;</i> 多选题</a></li>
                  <li><a href="javascript:;" onclick="member_add('添加判断题','AddPanDuan.aspx','1000','510')"><i class="Hui-iconfont">&#xe60d;</i> 判断题</a></li>
                </ul>
              </li>
            </ul>
          </nav>
          <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
            <ul class="cl">
              <li>教师</li>
              <li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">
                  <asp:Label ID="Labe_Name" runat="server" Text="Name"></asp:Label><i class="Hui-iconfont">&#xe6d5;</i></a>
                <ul class="dropDown-menu menu radius box-shadow">
                  <li><a href="../Logout.aspx">退出</a></li>
                </ul>
              </li>
              <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                <ul class="dropDown-menu menu radius box-shadow">
                  <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                  <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                  <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                  <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                  <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                  <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                </ul>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
    <aside class="Hui-aside">
      <div class="menu_dropdown bk_2">
        <dl id="menu-article">
          <dt><i class="Hui-iconfont">&#xe616;</i> 学生管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
          <dd>
            <ul>
              <li><a data-href="ManageStudent.aspx" data-title="学生信息" href="javascript:void(0)">学生信息</a></li>
              <li><a data-href="ManageScore.aspx" data-title="学生成绩" href="javascript:void(0)">学生成绩</a></li>
            </ul>
          </dd>
        </dl>
        <dl id="menu-picture">
          <dt><i class="Hui-iconfont">&#xe613;</i> 课程信息<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
          <dd>
            <ul>
              <li><a data-href="AddCourse.aspx" data-title="课程添加" href="javascript:void(0)">课程添加</a></li>
              <li><a data-href="ManageCourse.aspx" data-title="课程管理" href="javascript:void(0)">课程管理</a></li>
              <li><a data-href="ChapterAdd.aspx" data-title="章节补全" href="javascript:void(0)">章节补全</a></li>
               <li><a data-href="ManageChapter.aspx" data-title="章节管理" href="javascript:void(0)">章节管理</a></li>
            </ul>
          </dd>
        </dl>
        <dl id="menu-product">
          <dt><i class="Hui-iconfont">&#xe620;</i> 试卷<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
          <dd>
            <ul>
              <li><a data-href="AddTaoTi.aspx" data-title="试卷制定" href="javascript:void(0)">试卷制定</a></li>
              <li><a data-href="ManageTaoTi.aspx" data-title="试卷维护" href="javascript:void(0)">试卷维护</a></li>
            </ul>
          </dd>
        </dl>
        <dl id="Dl1">
          <dt><i class="Hui-iconfont">&#xe620;</i> 试题<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
          <dd>
            <ul>
              <li><a data-href="AddDanXuan.aspx" data-title="单选题录入" href="javascript:void(0)">单选题录入</a></li>
              <li><a data-href="ManageDanXuan.aspx" data-title="单选题维护" href="javascript:void(0)">单选题维护</a></li>
              <li><a data-href="AddDuoXuan.aspx" data-title="多选题录入" href="javascript:void(0)">多选题录入</a></li>
              <li><a data-href="ManageDuoXuan.aspx" data-title="多选题维护" href="javascript:void(0)">多选题维护</a></li>
              <li><a data-href="AddPanDuan.aspx" data-title="判断题录入" href="javascript:void(0)">判断题录入</a></li>
              <li><a data-href="ManagePanDuan.aspx" data-title="判断题维护" href="javascript:void(0)">判断题维护</a></li>
            </ul>
          </dd>
        </dl>
        <dl id="Dl2">
          <dt><i class="Hui-iconfont">&#xe620;</i> 修改密码<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
          <dd>
            <ul>
              <li><a data-href="ChangePwd.aspx" data-title="修改密码" href="javascript:void(0)">修改密码</a></li>
            </ul>
          </dd>
        </dl>
      </div>
    </aside>
    <div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
    <section class="Hui-article-box">
      <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
          <ul id="min_title_list" class="acrossTab cl">
            <li class="active"> <span title="我的桌面" data-href="../welcome.aspx">我的桌面</span> <em></em></li>
          </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
      </div>
      <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
          <div style="display:none" class="loading"></div>
          <iframe scrolling="yes" frameborder="0" src="../welcome.aspx"></iframe>
        </div>
      </div>
    </section>
    <div class="contextMenu" id="Huiadminmenu">
      <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
      </ul>
    </div>
    <!--_footer 作为公共模版分离出去--> 
    <script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="../lib/layer/2.4/layer.js"></script> 
    <script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
    <script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去--> 
    
    <!--请在下方写此页面业务相关的脚本--> 
    <script type="text/javascript" src="../lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script> 
  </div>
</form>
</body>
</html>
