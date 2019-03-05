using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void stu_Login_Click(object sender, EventArgs e)
    {
        //stu_username_hide
        //stu_password_hide
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "select * from Student where ID=@stu_ID and PWD=@stu_PWD";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("stu_ID", stu_username_hide.Text.Trim());
        com.Parameters.AddWithValue("stu_PWD", stu_password_hide.Text.Trim());
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            Session["User_Name"] = stu_username_hide.Text.Trim();
            Session["User_Row"] = "Student";
            Session["PWD"] = stu_password_hide.Text.Trim();
            Session["ID"] = stu_username_hide.Text.Trim();
            Response.Redirect("User/user_index.aspx");
        }
        else
        {
            Response.Write("<script>alert('登录失败,请检查用户名及密码是否正确！');</script>");
        }
        con.Close();
    }

    protected void tea_Login_Click(object sender, EventArgs e)
    {
        //tea_username_hide
        //tea_password_hide
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "select * from Teacher where id=@tea_name and pwd=@tea_pwd";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("tea_name", tea_username_hide.Text.Trim());
        com.Parameters.AddWithValue("tea_pwd", tea_password_hide.Text.Trim());
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            Session["User_Name"] = dr["name"].ToString();
            Session["User_Row"] = "Teacher";
            Session["PWD"] = tea_password_hide.Text.Trim();
            Session["ID"] = tea_username_hide.Text.Trim();
            Response.Redirect("Teacher/index.aspx");
        }
        else
        {
            Response.Write("<script>alert('登录失败,请检查用户名及密码是否正确！');</script>");
        }
        con.Close();
    }
    protected void sec_Login_Click(object sender, EventArgs e)
    {
        //sec_username_hide
        //sec_password_hide
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "select * from Admin where ID=@sec_name and PWD=@sec_pwd";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("sec_name", sec_username_hide.Text.Trim());
        com.Parameters.AddWithValue("sec_pwd", sec_password_hide.Text.Trim());
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            Session["User_Name"] = sec_username_hide.Text.Trim();
            Session["User_Row"] = "Admin";
            Page.Response.Redirect("Admin/index.aspx");
        }
        else
        {
            Response.Write("<script>alert('登录失败,请检查用户名及密码是否正确！');</script>");
        }
        con.Close();
    }
}