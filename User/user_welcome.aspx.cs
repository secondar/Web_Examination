using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_user_welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Student")
            {
                Response.Write("<script>alert('非法登录！')</script>");
                Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
            }
            else
            {
                //读取学生姓名
                try
                {
                    DataBaseAccess.Conn_database(DataBaseAccess.strconn);
                    string str = "select Name from Student where ID=@id";
                    lb_name.Text = DataBaseAccess.Select(str, new SqlParameter("@id", Session["ID"].ToString().Trim())).Rows[0][0].ToString();
                }
                catch
                {
                    lb_name.Text = "读取姓名失败…";
                }
            }            
        }       
    }
}