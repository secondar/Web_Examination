<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_KS.aspx.cs" Inherits="User_user_KS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/leftTime.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/normalize.css" />   
<link rel="stylesheet" href="../css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="../dist/notyf.min.css"/>
<style type="text/css">
    body{
	font-weight: 500;
	font-size: 1.05em;
	font-family: "Microsoft YaHei","Segoe UI", "Lucida Grande", Helvetica, Arial,sans-serif;
    }
    a{ color: rgba(255, 255, 255, 0.6);outline: none;text-decoration: none;-webkit-transition: 0.2s;transition: 0.2s;}
    a:hover,a:focus{color:#74777b;text-decoration: none;}
	.clock{
		width: 400px;
		margin: 30px auto;
	}
    table.data-table{width:100%;}
	table.data-table tr:odd{background:#dcebff;}
    table.data-table td{line-height:24px;padding:3px;vertical-align: top;}
    table.data-table th{height:50px;line-height:50px;padding: 3px;font-size:20px;text-align: left;}
    table.data-table .colspan-a{width:35%;}
	.data-show-box{line-height:30px;}
	.date-tiem-span,.date-s-span{display: inline-block;font-size:18px; width:36px; height:30px;line-height:30px; text-align: center; color:#fff; border-radius:5px;}
	.date-tiem-span{ background:#333;}
	.date-s-span{ background:#f00;}
	.date-select-a{margin-right:5px;}
</style>
<title>在线考试</title>    
<style>
    .qingchu {
        clear:both;
    }
    .djs {
        opacity:0;
    }
    .Answer {
        font-family:'微软雅黑';
        font-weight:bold;
        font-size:25px;
        margin-left:20px;     
    }
    .score {
        font-family:'Times New Roman';
        font-size:60px;
    }
</style>
</head>
<body>   
    <form id="form1" runat="server">        
    <div style="width:1200px;height:100%;border:1px solid #e5e5e5;margin:20px auto;">                         
        <%-- 头部 --%>   
        <div>
            <div style="position:relative;top:-10px;left:10px">
                <img src="../images/3.png" width="50" height="50" />
            </div> 
            <div style="position:absolute;top:40px;left:350px;margin:0;width:200px;">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/5.png" width="50" height="50"/>
                <asp:Label ID="Label13" runat="server" Text="Label" ForeColor="Red" CssClass="score"></asp:Label>
            </div> 
            <div style="width:100%;margin:0 auto;font-family:'微软雅黑';font-size:30px;text-align:center;">
                <asp:Label ID="lb_sjmc" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="qingchu"></div>
            <div style="float:left;width:150px;margin:30px 20px 20px 80px;">
                <label>试卷编号：</label><asp:Label ID="lb_sjbh" runat="server" Text="Label"></asp:Label>
            </div>
            <div style="float:left;width:300px;margin:30px 80px 20px 20px;">
                <label>出卷时间：</label><asp:Label ID="lb_cjsj" runat="server" Text="Label"></asp:Label>
            </div>
            <div style="float:left;width:250px;margin:30px 20px;">
                <label>答题时间：</label><asp:Label ID="lb_dtsj" runat="server" Text="Label"></asp:Label><label> 分钟</label>
            </div>
            <div style="float:left;margin:30px 20px;">
                <label>试卷总分：</label><asp:Label ID="lb_sjzf" runat="server" Text="Label"></asp:Label><label> 分</label>
            </div>
            <div class="qingchu"></div>
        </div>        
        <%-- //头部 --%>
        <%-- 时钟 --%>  
        <div style="position:absolute;top:10px;left:60px;">
            <script src="/demos/googlegg.js"></script>
            <div id="clock1" class="clock"></div>
            <script src="../js/analogClock.js"></script>
            <script>
                AnalogClock("clock1", { width: 150 });//simple use
            </script>
        </div>
        <%-- //时钟 --%> 
        <%-- 倒计时 --%>
        <div style="position:absolute;top:0px;left:0px;opacity:0;">
            <asp:Label ID="lb_djs" runat="server" Text="Label" CssClass="djs"></asp:Label>
            <div id="timer" style="color:red"></div>
            <script>            
                var tm = document.getElementById('lb_dtsj').innerText;
                var maxtime = tm * 60 //一个小时，按秒计算，自己调整!   
                //防止刷新
                if (window.name == '' || window.name == '-1' || isNaN(window.name)) {
                    maxtime = tm * 60;
                } else {
                    maxtime = window.name;
                }
                function CountDown() {
                    if ("<%=strFalg%>" == "true") {
                        if (maxtime >= 0) {
                            minutes = Math.floor(maxtime / 60);
                            seconds = Math.floor(maxtime % 60);
                            msg = "距离考试结束还有" + minutes + "分" + seconds + "秒";
                            document.getElementById("timer").innerHTML = msg;
                            --maxtime;
                            window.name = maxtime;
                        }
                        else {                            
                            clearInterval(timer);                           
                            document.getElementById("ImageButton1").click();
                            document.getElementById('alert-btn').click();
                        }
                    }
                }
                timer = setInterval("CountDown()", 1000);
            </script>
            <script src="/demos/googlegg.js"></script>
            <div class="wrapper">
		        <h1></h1>
			    <div class="buttons" style="display:none;">
			        <button type="button" name="button" id="success-btn">显示成功</button>
			        <button type="button" name="button" id="alert-btn">显示警报</button>
			    </div>
		    </div>                           
            <script src="../dist/notyf.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                (function () {
                    var alertMessages = [
                      "考试时间已到，考试结束!",
                      "",
                      "Yep, I can stack on top of previous alerts",
                      "Let's start over"
                    ]
                    var currentAlert = 0;
                    var successMessages = [
                      "离考试结束还有15分钟,请注意掌握时间。",
                      "Success! Yuhu!!",
                      "It's me again :D",
                      "You can show me several times. I won't hide previous messages."
                    ]
                    var currentSuccess = 0;
                    var notyf = new Notyf({ delay: 3000 });
                    document.addEventListener('DOMContentLoaded', function () {
                        document.getElementById('success-btn').addEventListener('click', function () {
                            //if (currentSuccess > 3) {
                            //    currentSuccess = 0;
                            //}
                            notyf.confirm(successMessages[currentSuccess]);
                            //currentSuccess=0;
                        });

                        document.getElementById('alert-btn').addEventListener('click', function () {
                            //if (currentAlert > 3) {
                            //    currentAlert = 0;
                            //}
                            notyf.alert(alertMessages[currentAlert]);
                            //currentAlert++;
                        });
                    });
                })();
            </script>
        </div>
        <div style="position:absolute;top:30px;right:300px;">
            <table>
                <tr>
			        <th colspan="3">距考试结束时间还有：</th>
		        </tr>
		        <tr>
			        <td class="colspan-a">
				        <div class="data-show-box" id="dateShow1">
					        <span class="date-tiem-span h">00</span>&nbsp;时
					        <span class="date-tiem-span m">00</span>&nbsp;分
					        <span class="date-s-span s">00</span>&nbsp;秒
				        </div>
			        </td>			    		
		        </tr>
		        <script type="text/javascript">			                     
		            var tm = document.getElementById('lb_djs').innerText;		            
		            $(function () {
		                //日期倒计时
		                $.leftTime(tm, function (d) {
		                    if ("<%=strFalg%>" == "true")
		                    {
		                        if (d.status) {
		                            var $dateShow1 = $("#dateShow1");
		                            $dateShow1.find(".h").html(d.h);
		                            $dateShow1.find(".m").html(d.m);
		                            $dateShow1.find(".s").html(d.s);
		                            if (d.h == 0 && d.m == 15 && d.s == 0) {
		                                document.getElementById('success-btn').click();
		                            }
		                        }
		                    }		                    
		                });
		            });
		        </script>
            </table>
        </div>      
        <%-- //倒计时 --%>
        <div style="border:2px solid #e5e5e5;width:1198px;height:25px;margin-top:10px;margin-bottom:10px;">
            <div style="width:650px;margin:0 auto;">
                <asp:Label ID="Label14" runat="server" Text="Tip：页面加载完成时考试已开始，考试途中请勿关闭本窗口否则将影响到您的成绩。" ForeColor="#999999"></asp:Label>
            </div>           
        </div>
        <div style="width:1100px;height:100%;padding:0 50px;">  
            <%-- GridView1 --%>      
            <div style="width:100%;height:100%;margin:20px 0;">
                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                        EnableModelValidation="True" GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="Label24" runat="server" Text="一、单选题(每题"></asp:Label>
                                    <asp:Label ID="Label27" runat="server">									                </asp:Label>
                                    <asp:Label ID="Label25" runat="server" Text="分)">                                            </asp:Label><br />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table id="Table2" cellspacing="1" cellpadding="1" width="100%" align="center" border="0" style="margin:10px 0;font-family:'微软雅黑';">
                                        <tr>
                                            <td colspan="3" align="left" class="style1">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex+1 %>'>									                </asp:Label>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title","、{0}") %>'>									                </asp:Label>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Answer") %>'  CssClass="Answer" Visible="False"></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Mark") %>' Visible="False"
                                                    Height="18px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="35%" align="left">
                                                <asp:Label ID="Label35" runat="server" Text="A."></asp:Label>
                                                <asp:RadioButton ID="RadioButton1" runat="server" Text='<%# Eval("AnswerA") %>' GroupName="Sl">
                                                </asp:RadioButton>
                                            </td>
                                            <td width="35%" align="left">
                                                <asp:Label ID="Label37" runat="server" Text="B."></asp:Label>
                                                <asp:RadioButton ID="RadioButton2" runat="server" Text='<%# Eval("AnswerB") %>' GroupName="Sl">
                                                </asp:RadioButton>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="35%" align="left">
                                                <asp:Label ID="Label36" runat="server" Text="C."></asp:Label>
                                                <asp:RadioButton ID="RadioButton3" runat="server" Text='<%# Eval("AnswerC") %>' GroupName="Sl">
                                                </asp:RadioButton>
                                            </td>
                                            <td width="35%" align="left">
                                                <asp:Label ID="Label38" runat="server" Text="D."></asp:Label>
                                                <asp:RadioButton ID="RadioButton4" runat="server" Text='<%# Eval("AnswerD") %>' GroupName="Sl">
                                                </asp:RadioButton>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle Height="30px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" Height="25px" BorderStyle="None" />
                    </asp:GridView>
            </div>
            <%-- GridView2 --%>
            <div style="width:100%;height:100%;margin:20px 0;">
                <asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="False"
                        EnableModelValidation="True" GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="Label22" runat="server" Text="二、多选题(每题">									                </asp:Label>
                                    <asp:Label ID="Label28" runat="server">									                </asp:Label>
                                    <asp:Label ID="Label23" runat="server" Text="分)">                                            </asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table id="Table3" cellspacing="1" cellpadding="1" width="100%" align="left" border="0" style="margin:10px 0;font-family:'微软雅黑';">
                                        <tr>
                                            <td colspan="3" align="left">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Container.DataItemIndex+1 %>'>									                </asp:Label>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Title","、{0}") %>'>									                </asp:Label>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Answer") %>'  CssClass="Answer" Visible="False"></asp:Label>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("Mark") %>' Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 22px" width="35%" align="left">
                                            <asp:Label ID="Label39" runat="server" Text="A."></asp:Label>
                                               <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("AnswerA") %>'></asp:CheckBox>
                                            </td>
                                            <td style="height: 22px" width="35%" align="left">
                                            <asp:Label ID="Label40" runat="server" Text="B."></asp:Label>
                                                <asp:CheckBox ID="CheckBox2" runat="server" Text='<%# Eval("AnswerB") %>'></asp:CheckBox>
                                            </td>
                                            <td style="height: 22px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="35%" align="left"><asp:Label ID="Label41" runat="server" Text="C."></asp:Label>
                                        
                                                <asp:CheckBox ID="CheckBox3" runat="server" Text='<%# Eval("AnswerC") %>'></asp:CheckBox>
                                            </td>
                                     
                                            <td width="35%" align="left"><asp:Label ID="Label42" runat="server" Text="D."></asp:Label>
                                                <asp:CheckBox ID="CheckBox4" runat="server" Text='<%# Eval("AnswerD") %>'></asp:CheckBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <HeaderStyle Height="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" Height="25px" />
                    </asp:GridView>
            </div>
            <%-- GridView3 --%>
            <div style="width:100%;height:100%;margin:20px 0;">
                <asp:GridView ID="GridView3" runat="server" Width="100%" AutoGenerateColumns="False"
                        PageSize="2" EnableModelValidation="True" GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="Label20" runat="server" Text="三、判断题(每题">									                </asp:Label>
                                    <asp:Label ID="Label29" runat="server">									                </asp:Label>
                                    <asp:Label ID="Label21" runat="server" Text="分)">                                            </asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table id="Table4" cellspacing="1" cellpadding="1" width="100%" align="center" border="0" style="margin:10px 0;font-family:'微软雅黑';">
                                        <tr>
                                            <td class="style1">
                                                <asp:Label ID="Label9" runat="server" Text='<%# Container.DataItemIndex+1 %>'>									                </asp:Label>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("Title","、{0}") %>'>									                </asp:Label>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Answer") %>'  CssClass="Answer" Visible="False"></asp:Label>
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Mark") %>' Visible="False"></asp:Label>
                                            </td>
                                            <td width="13%">
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" name="RadioButtonList1"
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="true">正确</asp:ListItem>
                                                    <asp:ListItem Value="false">错误</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>                                     
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" Height="25px" />
                    </asp:GridView>
            </div>
       </div>
       <%-- 按钮 --%> 			
       <div style="border:2px solid #e5e5e5;width:1198px;height:15px;margin-top:10px;margin-bottom:10px;"></div>
       <div style="width:1100px;height:70px;padding:0 50px;">
           <div style="width:200px;margin:0 auto;">
               <div style="float:left;width:60px;margin-right:80px;display:block;">
                   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/4.png" Width="60px" Height="60px" ToolTip="提 交" OnClick="ImageButton1_Click"/>
               </div>
               <div style="float:right;width:60px;display:block;">
                   <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/7.png" Width="60px" Height="60px" ToolTip="退 出" OnClientClick='Javascript:return confirm("是否退出考试？注意：考试中途退出考试会影响到您的成绩，并且不能再次参与本次考试！")' OnClick="ImageButton2_Click"/>
               </div>
           </div>                  
    </div>
    </form>    
</body>
</html>
