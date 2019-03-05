<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaoTiDetail.aspx.cs" Inherits="Admin1_TaoTiDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#box {
	width: 838px;
	height: auto;
}
</style>
</head>
<body>
<form id="form1" runat="server">
  <div>
    <div class="view">
      <asp:GridView ID="GridView1" runat="server" Width=100% 
                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" 
                                            GridLines="Horizontal" 
              HorizontalAlign="Center" EnableModelValidation="True" BackColor="White" 
               BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
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
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" BackColor="#3a9cff" 
                                                Font-Bold="True" ForeColor="White" />
      </asp:GridView>
    </div>
    <div class="clear"></div>
    <div class="view">
      <asp:GridView ID="GridView2" runat="server" Width=100% 
                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" 
                                            GridLines="Horizontal" HorizontalAlign="Center" 
              EnableModelValidation="True" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px">
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
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" BackColor="#3a9cff" 
                                                Font-Bold="True" ForeColor="White" />
      </asp:GridView>
    </div>
    <div class="clear"></div>
    <div class="view_1">
      <asp:GridView ID="GridView3" runat="server" Width=100% 
                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" 
                                            GridLines="Horizontal" HorizontalAlign="Center" 
              EnableModelValidation="True" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px">
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
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" BackColor="#3a9cff" 
                                                Font-Bold="True" ForeColor="White" />
      </asp:GridView>
    </div>
    <div class="clear"></div>
  </div>
</form>
</body>
</html>
