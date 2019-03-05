<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广西生态工程职业技术学院毕业设计在线WEB考试系统用户登录</title>
<link href="css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jQuery1.7.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var $tab_li = $('#tab ul li');
        $tab_li.hover(function () {
            $(this).addClass('selected').siblings().removeClass('selected');
            var index = $tab_li.index(this);
            $('div.tab_box > div').eq(index).show().siblings().hide();
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        /*学生登录信息验证*/
        $("#stu_username_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入学号') {
                $(this).val('');
            }
        });
        $("#stu_username_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入学号');
            }
        });
        $("#stu_password_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入密码') {
                $(this).val('');
            }
        });
        $("#stu_password_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入密码');
            }
        });
        $("#stu_code_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入验证码') {
                $(this).val('');
            }
        });
        $("#stu_code_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入验证码');
            }
        });
        $(".stu_login_error").Validform({
            tiptype: function (msg, o, cssctl) {
                var objtip = $(".stu_error_box");
                cssctl(objtip, o.type);
                objtip.text(msg);
            },
            ajaxPost: true
        });
        /*导师登录信息验证*/
        $("#tea_username_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入教工号') {
                $(this).val('');
            }
        });
        $("#tea_username_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入教工号');
            }
        });
        $("#tea_password_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入密码') {
                $(this).val('');
            }
        });
        $("#tea_password_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入密码');
            }
        });
        $("#tea_code_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入验证码') {
                $(this).val('');
            }
        });
        $("#tea_code_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入验证码');
            }
        });
        $(".tea_login_error").Validform({
            tiptype: function (msg, o, cssctl) {
                var objtip = $(".tea_error_box");
                cssctl(objtip, o.type);
                objtip.text(msg);
            },
            ajaxPost: true
        });
        /*教务登录信息验证*/
        $("#sec_username_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入教务号') {
                $(this).val('');
            }
        });
        $("#sec_username_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入教务号');
            }
        });
        $("#sec_password_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入密码') {
                $(this).val('');
            }
        });
        $("#sec_password_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入密码');
            }
        });
        $("#sec_code_hide").focus(function () {
            var username = $(this).val();
            if (username == '输入验证码') {
                $(this).val('');
            }
        });
        $("#sec_code_hide").focusout(function () {
            var username = $(this).val();
            if (username == '') {
                $(this).val('输入验证码');
            }
        });
        $(".sec_login_error").Validform({
            tiptype: function (msg, o, cssctl) {
                var objtip = $(".sec_error_box");
                cssctl(objtip, o.type);
                objtip.text(msg);
            },
            ajaxPost: true
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $(".screenbg ul li").each(function () {
            $(this).css("opacity", "0");
        });
        $(".screenbg ul li:first").css("opacity", "1");
        var index = 0;
        var t;
        var li = $(".screenbg ul li");
        var number = li.size();
        function change(index) {
            li.css("visibility", "visible");
            li.eq(index).siblings().animate({ opacity: 0 }, 3000);
            li.eq(index).animate({ opacity: 1 }, 3000);
        }
        function show() {
            index = index + 1;
            if (index <= number - 1) {
                change(index);
            } else {
                index = 0;
                change(index);
            }
        }
        t = setInterval(show, 8000);
        //根据窗口宽度生成图片宽度
        var width = $(window).width();
        $(".screenbg ul img").css("width", width + "px");
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="tab">
  <ul class="tab_menu">
    <li class="selected">学生登录</li>
    <li>导师登录</li>
    <li>教务登录</li>
  </ul>
  <div class="tab_box"> 
    <!-- 学生登录开始 -->
    <div>
      <div class="stu_error_box"></div>
        <div id="username">
          <label>学&nbsp;&nbsp;&nbsp;号：</label>
          <asp:TextBox id="stu_username_hide" runat="server" value="输入学号" nullmsg="学号不能为空！" datatype="s6-18" errormsg="学号范围在6~18个字符之间！" sucmsg="学号验证通过！"></asp:TextBox>
          <!--ajaxurl="demo/valid.jsp"--> 
        </div>
        <div id="password">
          <label>密&nbsp;&nbsp;&nbsp;码：</label>
          <asp:TextBox id="stu_password_hide" runat="server" type="password" value="输入密码" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"></asp:TextBox>
        </div>
        <div id="login">
          <asp:Button ID="stu_Login" style="cursor:pointer;width:100%;height:45px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;text-shadow:0 1px 2px rgba(0, 0, 0, .1)" runat="server" Text="登录" OnClick="stu_Login_Click"/>
        </div>
    </div>
   <!-- 学生登录结束-->
   <!-- 导师登录开始-->
    <div class="hide">
     <div class="tea_error_box"></div>
        <div id="Div1">
          <label>教工号：</label>
          <asp:TextBox id="tea_username_hide" runat="server" value="输入教工号" nullmsg="教工号不能为空！" datatype="s6-18" errormsg="教工号范围在6~18个字符之间！" sucmsg="教工号验证通过！"></asp:TextBox>
          <!--ajaxurl="demo/valid.jsp"--> 
        </div>
        <div id="Div2">
          <label>密&nbsp;&nbsp;&nbsp;码：</label>
          <asp:TextBox id="tea_password_hide" runat="server" type="password" value="输入密码" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"></asp:TextBox>
        </div>
        <div id="Div5">
          <asp:Button ID="tea_Login" style="cursor:pointer;width:100%;height:45px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;text-shadow:0 1px 2px rgba(0, 0, 0, .1)" runat="server" Text="登录" OnClick="tea_Login_Click"/>
        </div>
    </div>
     <!-- 导师登录结束-->
     <!-- 教务登录开始-->
    <div class="hide">
    <div class="sec_error_box"></div>
        <div id="Div6">
          <label>教务号：</label>
          <asp:TextBox id="sec_username_hide" runat="server" value="输入教务号" nullmsg="教务号不能为空！" datatype="s6-18" errormsg="教务号范围在6~18个字符之间！" sucmsg="教务号验证通过！"></asp:TextBox>
          <!--ajaxurl="demo/valid.jsp"--> 
        </div>
        <div id="Div7">
          <label>密&nbsp;&nbsp;&nbsp;码：</label>
          <asp:TextBox id="sec_password_hide" type="password" runat="server" value="输入密码" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"></asp:TextBox>
        </div>
        <div id="Div10">
          <asp:Button ID="sec_Login" style="cursor:pointer;width:100%;height:45px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;text-shadow:0 1px 2px rgba(0, 0, 0, .1)" runat="server" Text="登录" OnClick="sec_Login_Click"/>
        </div>
    </div>
     <!-- 教务登录结束-->
  </div>
</div>
<div class="bottom">©2018 Leting <a href="javascript:;" target="_blank">关于</a> <span></span>  More<a href="#" target="_blank" title="Web在线考试系统">Web在线考试系统</a> - from <a href="#" title=".net在线考试系统" target="_blank">.net在线考试系统</a><img width="13" height="16" src="images/copy_rignt_24.png" /></div>
<div class="screenbg">
  <ul>
    <li><a href="javascript:;"><img src="images/0.jpg"></a></li>
    <li><a href="javascript:;"><img src="images/1.jpg"></a></li>
    <li><a href="javascript:;"><img src="images/2.jpg"></a></li>
  </ul>
</div>
    </div>
    </form>
</body>
</html>
