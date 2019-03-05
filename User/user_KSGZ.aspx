<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_KSGZ.aspx.cs" Inherits="User_user_KSGZ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="border-bottom:1px solid #e5e5e5;font-family:'微软雅黑';font-size:25px;text-align:center;margin-bottom:30px;margin-top:30px;">考试须知</div>
    <div style="width:1170px;margin:0 auto;">
        <div style="width:550px;height:482px;float:left;padding:50px 10px 0 10px;line-height:25px;text-indent: 2em;">
        <p>
            一、考生在每场考试前20分钟凭准考证进入考场，对号入座。入座后将准考证放在桌面醒目位置，同时，随身携带身份证等有效证件，以备查对。</p>
        <p>
            二、考生入座不得携带任何书籍、笔记、纸张、字典、计算器、电子记事本、寻呼机、手机等，不得携带任何存储设备（包括软盘、移动硬盘、光盘、U盘、MP3、掌上电脑）。书包、雨伞、大衣等物一律放在考场指定位置。</p>
        <p>
            三、考试前10分钟，根据监考人员的提示，考生双击考生机桌面上的考试系统图标，启动考试系统客户端，按照《上机考试注意事项》的要求，录入考生姓名、准考证号、身份证号（或其它有效证件号）等信息，进入考试系统。考试铃响后考生开始答题。</p>
        <p>
            四、考生按照计算机软件考试系统的要求答题并保存答题结果。除完成题目要求的内容外，不得在答卷内填写其它任何与考生身份有关的标记，否则答卷作废。</p>
        <p>
            五、没有按照要求进行登录、答题、保存、交卷的考生，考试系统将不能正确记录信息，后果由考生承担。</p>        
        </div>
        <div>
            <img src="../images/wrapper-img.png"/>
        </div>
    </div>
    <div style="width:400px;margin:0 auto;">
        <asp:Label ID="Label1" runat="server" Text="请认真阅读考试规则后并同意所有《考试规则》！" ForeColor="red" Font-Size="18px" Visible="false"></asp:Label>
    </div>
    <div style="width:240px;height:50px;margin:0 auto;">
        <div style="width:180px;margin:19px auto;float:left;">
            <asp:CheckBox ID="CheckBox1" runat="server" ForeColor="#0066FF" Text="同意所有《考试规则》" />        
        </div>
        <div style="float:left;">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/ok.png" Width="50px" Height="50px" ToolTip="确 定" OnClick="ImageButton1_Click"/>
        </div>
    </div>    
    </form>
</body>
</html>
