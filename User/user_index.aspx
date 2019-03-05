<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_index.aspx.cs" Inherits="User_user_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="utf-8"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="../favicon.ico" />
<link rel="Shortcut Icon" href="../favicon.ico" />
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<title>WEB在线考试系统v1.0--学生</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%-- 头部 --%>
      <header class="navbar-wrapper">
          <div class="navbar navbar-fixed-top">
            <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs">WEB在线考试系统1.0--学生</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs">H-ui</a> <span class="logo navbar-slogan f-l mr-10 hidden-xs"></span> <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
              <nav class="nav navbar-nav">
                <ul class="cl">
                </ul>
              </nav>
              <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                  <li>学生：</li>
                  <li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">
                      <asp:Label ID="lb_name" runat="server" Text="Label" Width="100px"></asp:Label> <i class="Hui-iconfont">&#xe6d5;</i></a>
                    <ul class="dropDown-menu menu radius box-shadow">
                      <li>
                        <div class="Hui-aside" style="position:initial;width:initial;margin:0;padding:0;background-color:initial;top:initial;">
                            <div class="menu_dropdown bk_2"">
                                <a id="a_1" data-href="user_GeRenXinXi.aspx" data-title="个人信息" href="javascript:void(0)" style="text-decoration: none;font-size:15px;">个 人 信 息</a>                                
                            </div>
                        </div>
                      </li>
                      <li>
                        <div class="Hui-aside" style="position:initial;width:initial;margin:0;padding:0;background-color:initial;top:initial;border-top:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;">
                            <div class="menu_dropdown bk_2">
                                <a id="a_2" data-href="user_Paw.aspx" data-title="修改密码" href="javascript:void(0)" style="text-decoration: none;font-size:15px;">修 改 密 码</a>                                
                            </div>
                        </div>
                      </li>                    
                      <li>
                          <div style="width:100%;display:block;margin:0 auto;">
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick='Javascript:return confirm("是否退出系统？")' PostBackUrl="../Login.aspx" OnClick="LinkButton1_Click" Font-Size="15px" style="TEXT-DECORATION: none">退 出 系 统</asp:LinkButton>                                                 
                          </div>
                      </li>
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
        <%-- //头部 --%>
        <%-- 侧栏 --%>
        <aside class="Hui-aside">
          <div class="menu_dropdown bk_2">
            <dl id="menu-article">
              <dt><i class="Hui-iconfont">&#xe616;</i> 在线考试模块<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
              <dd>
                <ul>
                  <li><a data-href="user_KSGZ.aspx" data-title="在线考试" href="javascript:void(0)">在线考试</a></li>
                </ul>
              </dd>
            </dl>
            <dl id="menu-picture">
              <dt><i class="Hui-iconfont">&#xe665;</i> 成绩查询模块<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
              <dd>
                <ul>
                  <li><a data-href="user_Score.aspx" data-title="成绩查询" href="javascript:void(0)">成绩查询</a></li>
                </ul>
              </dd>
            </dl>
            <dl id="menu-product">
              <dt><i class="Hui-iconfont">&#xe61e;</i> 成绩分析模块<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
              <dd>
                <ul>
                  <li><a data-href="user_cjfx.aspx" data-title="成绩分析" href="javascript:void(0)">成绩分析</a></li>
                </ul>
              </dd>
            </dl>
          </div>
        </aside>
        <%-- //侧栏 --%>
        <%--  --%>
        <section class="Hui-article-box">
          <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
            <div class="Hui-tabNav-wp">
              <ul id="min_title_list" class="acrossTab cl">
                <li class="active"> <span title="我的桌面" data-href="#">我的桌面</span> <em></em></li>
              </ul>
            </div>
            <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
          </div>
          <div id="iframe_box" class="Hui-article">
            <div class="show_iframe">
              <div style="display:none" class="loading"></div>
              <iframe src="user_welcome.aspx"></iframe>
            </div>
          </div>
        </section>
        <div class="contextMenu" id="Huiadminmenu">
            <ul>
                <li id="closethis">关闭当前 </li>
                <li id="closeall">关闭全部 </li>
            </ul>
        </div>
        <%--  --%>
    <!--_footer 作为公共模版分离出去--> 
    <script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
    
    <!--请在下方写此页面业务相关的脚本--> 
    <script type="text/javascript" src="../lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script> 
    <script type="text/javascript">
        $(function () {
            /*$("#min_title_list li").contextMenu('Huiadminmenu', {
                bindings: {
                    'closethis': function(t) {
                        console.log(t);
                        if(t.find("i")){
                            t.find("i").trigger("click");
                        }		
                    },
                    'closeall': function(t) {
                        alert('Trigger was '+t.id+'\nAction was Email');
                    },
                }
            });*/
        });

    </script> 
    </div>
    </form>
</body>
</html>
