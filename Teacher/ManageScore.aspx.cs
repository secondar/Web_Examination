using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin1_ManageScore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Teacher")
        {
            Response.Write("<script>alert('非法登录！')</script>");
            Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
        }
        if (!IsPostBack)
        {
            Datacon dataconn = new Datacon();
            SqlConnection cn = dataconn.getcon();
            cn.Open();
            SqlCommand com = cn.CreateCommand();
            com.CommandText = "select count(*) from student_score";
            int count1 = Convert.ToInt32(com.ExecuteScalar());
            Label1.Text = count1.ToString();
            cn.Close();
            SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
            SqlDataSource1.SelectCommand = "select * from student_score";

        }
    }
    [WebMethod]
    public static string Delete(string s)
    {
        
        Datacon dataconn = new Datacon();
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = cn.CreateCommand();
        com.CommandText = "delete from Score where ID='"+s+"'";
        if (com.ExecuteNonQuery() > 0)
        {
            return "true";
        }
        else
        {
            return "false";
        }
        cn.Close();
    }
    protected void Button_select_Click(object sender, EventArgs e)
    {
        if (TextBox_select.Text == "")
        {
            SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
            SqlDataSource1.SelectCommand = "select * from student_score";
        }
        else
        {
            SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
            SqlDataSource1.SelectCommand = "select * from student_score where " + DropDownList_flag.SelectedValue + "   Like'%" + TextBox_select.Text + "%'";
        }
    }
}