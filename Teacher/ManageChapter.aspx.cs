using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_ManageChapter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Teacher")
            {
                Response.Write("<script>alert('非法登录！')</script>");
                Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
            }
            else
            {
                SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
                SqlDataSource1.SelectCommand = "select ID,Name,Chapter,c_name from Chapter,Course where Chapter.c_id=Course.c_id";
                Datacon dataconn = new Datacon();
                SqlConnection cn = dataconn.getcon();
                cn.Open();
                SqlCommand com = cn.CreateCommand();
                com.CommandText = "select count(*) from Chapter";
                int count1 = Convert.ToInt32(com.ExecuteScalar());
                Label1.Text = count1.ToString();
                cn.Close();
            }
        }
    }
    [WebMethod]
    public static string DeleteAll(string s)
    {
        string[] str = s.Split('*');
        string Tsql = "delete from Chapter where ID='";
        for (int i = 0; i < str.Length; i++)
        {
            Tsql += str[i] + "'";
            if (i + 1 < str.Length)
            {
                Tsql += " or ID='";
            }
        }
        Datacon dataconn = new Datacon();
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = cn.CreateCommand();
        com.CommandText = Tsql;
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
    [WebMethod]
    public static string Update(string s)
    {
        string[] str = s.Split('*');
        Datacon dataconn = new Datacon();
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = cn.CreateCommand();
        com.CommandText = "update Chapter set Name='" + str[1] + "' where ID='" + str[0] + "'";
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
    [WebMethod]
    public static string Delete(string s)
    {
        Datacon dataconn = new Datacon();
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = cn.CreateCommand();
        com.CommandText = "delete from Chapter where ID='" + s + "'";
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
        SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
        SqlDataSource1.SelectCommand = "select ID,Name,Chapter,c_name from Chapter,Course where Chapter.c_id=Course.c_id and " + DropDownList_flag.SelectedValue + "   Like'%" + TextBox_select.Text + "%'";
    }
}