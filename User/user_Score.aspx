<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_Score.aspx.cs" Inherits="User_user_Score" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .qingchu {
            clear:both;
        }
        .GridView th 
        { 
          text-align:center; 
        } 
        .gv{
            padding:0;
            width:1100px;
            margin:0px auto;
            margin-bottom:20px;
        } 
        .div{
             width:500px;
             height:100%;
             padding:10px 0px;
             margin:0 auto;
        }
        .btn_css{
            position:absolute;
            margin-left:20px;
            top:5px;
        }
        .css {
            margin:0 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:1200px;height:100%;margin:20px auto;padding:20px;">
        <div style="border-bottom:1px solid #e5e5e5;font-family:'微软雅黑';font-size:30px;text-align:center;margin-bottom:20px;">成 绩 查 询</div>
        <div style="margin:0 auto;width:1100px; position:relative;">
            <div class="div">
                <asp:Label ID="Label1" runat="server" Text="查 询：" Font-Size="20px"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Width="400px" Height="30px"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/ss.png"  Width="40px" Height="40px" CssClass="btn_css" OnClick="ImageButton1_Click"/>
            </div>
            <div style="width:380px;margin:0 auto;">
                <div style="width:300px;margin:0 auto;float:right;margin-right:8px;">
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="cx" Text="课程名" CssClass="css"/>
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="cx" Text="试卷名" CssClass="css"/>
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="cx" Text="考试总分" CssClass="css"/>
                </div> 
                <div class="qingchu"></div>
            </div>                                  
        </div>
        <div style="border-bottom:1px solid #e5e5e5;margin:20px auto;"></div>
        <div class="gv">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                EnableModelValidation="True" ForeColor="Black" GridLines="Horizontal" Height="35px"
                HorizontalAlign="Center" Width="1000px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
                PageSize="10" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <HeaderStyle BorderStyle="Double" />
                <SelectedRowStyle BorderStyle="None" HorizontalAlign="Center" />
                <RowStyle  Height="40px" />
                <Columns>
                    <asp:BoundField HeaderText="课程名称" DataField="c_name" />
                    <asp:BoundField DataField="PaperName" HeaderText="试卷名称" />
                    <asp:BoundField DataField="ExamTime" HeaderText="考试时间" />
                    <asp:BoundField DataField="Score" HeaderText="考试总分" />
                    <asp:BoundField DataField="sscore" HeaderText="单选题得分" />
                    <asp:BoundField DataField="mscore" HeaderText="多选题得分" />
                    <asp:BoundField DataField="jscore" HeaderText="判断题得分" />
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#3a9cff" Font-Bold="True" ForeColor="White" Height="26px" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>

    </div>
    </form>
</body>
</html>
