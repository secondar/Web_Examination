using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_user_GeRenXinXi : System.Web.UI.Page
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
                //读取学生信息
                try
                {
                    DataBaseAccess.Conn_database(DataBaseAccess.strconn);
                    string str = "select Name from Student where ID=@id";
                    //读取姓名
                    lb_name.Text = DataBaseAccess.Select(str, new SqlParameter("@id", Session["ID"].ToString().Trim())).Rows[0][0].ToString();
                    //读取学号
                    lb_id.Text = Session["ID"].ToString().Trim();
                    //读取性别
                    str = "select Sex from Student where ID=@id";
                    lb_sex.Text = DataBaseAccess.Select(str, new SqlParameter("@id", Session["ID"].ToString().Trim())).Rows[0][0].ToString();
                    //读取系别
                    str = "select profession from Student where ID=@id";
                    lb_xibie.Text = DataBaseAccess.Select(str, new SqlParameter("@id", Session["ID"].ToString().Trim())).Rows[0][0].ToString();
                    //读取入学时间
                    str = "select JoinTime from Student where ID=@id";
                    lb_time.Text = DataBaseAccess.Select(str, new SqlParameter("@id", Session["ID"].ToString().Trim())).Rows[0][0].ToString();
                }
                catch
                {
                    lb_name.Text = "读取姓名失败…";
                    lb_id.Text = "读取学号失败…";
                    lb_sex.Text = "读取性别失败…";
                    lb_xibie.Text = "读取系别失败…";
                    lb_time.Text = "读取入学时间失败…";
                }           
            }            
        }    
    }
}