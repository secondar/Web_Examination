<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_cjfx.aspx.cs" Inherits="User_user_cjfx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
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
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>折线图</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 成绩分析 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
        <div class="page-container">
	        <div id="container" style="min-width:700px;height:400px"></div>
        </div>
        <!--_footer 作为公共模版分离出去-->
        <script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
        <script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
        <script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
        <script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> 
        <!--/_footer 作为公共模版分离出去-->

        <!--请在下方写此页面业务相关的脚本-->
        <script type="text/javascript" src="../lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
        <script type="text/javascript" src="../lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
        <script type="text/javascript">
            $(function () {
                Highcharts.chart('container', {
                    title: {
                        text: '个人成绩分析',//主标题
                        x: -20 //center
                    },
                    subtitle: {
                        text: '',//副标题
                        x: -20
                    },
                    xAxis: {
                        categories: [<%=str_1%>] //X轴的值
                    },
                    yAxis: {
                        title: {
                            text: '分数' //Y轴文本
                        },
                        tickPositions: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100], // 指定Y轴坐标点的值
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: '分' //鼠标经过提示的单位
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: [{
                        name: '成绩',
                        data: [<%=str_2%>]
                    }]
                });
            });
        </script>
        <div style="width:720px;margin:20px auto;font-size:20px;">
            <asp:Label ID="Label1" runat="server" Text="Session已过期，或已丢失，您的成绩信息统计失败，请重新登录后再进行尝试！" Visible="false" ForeColor="Red"></asp:Label>
        </div>
        <div style="width:500px;margin:0 auto;font-size:20px;">
            <asp:Label ID="Label2" runat="server" Text="您还没有进行过任何一门考试，无法统计您的成绩信息。" Visible="false" ForeColor="Red"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
