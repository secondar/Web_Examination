<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageCourse_update.aspx.cs" Inherits="Teacher_ManageCourseupdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
.auto-style1 {
	height: 20px;
}
</style>
    <link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
    </head>
    <body style="width:250px;margin:auto;">
    <form id="form1" runat="server">
      <div>
        <table class="table table-border table-bordered table-hover table-bg table-sort">
          <thead>
          </thead>
          <tbody>
            <tr >
              <td class="auto-style1">课程号:
                <asp:TextBox ID="TextBox_c_id" class="input-text" runat="server" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
              <td class="auto-style1">课程名:
                <asp:TextBox ID="TextBox_c_name" class="input-text" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
              <td class="auto-style1">时间:
                <asp:TextBox ID="TextBox_c_date" class="input-text" runat="server" Enabled="False"></asp:TextBox></td>
            </tr>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
          </tbody>
        </table>
        <div style="width:250px;text-align:center;">
          <asp:Button ID="Button_insertinto" runat="server" class="btn btn-primary radius" Text="保存" OnClick="Button_insertinto_Click" />
          <asp:Button ID="Button_back" class="btn btn-default radius" runat="server" Text="返回" OnClick="Button_back_Click" />
        </div>
      </div>
    </form>
</body>
</html>
