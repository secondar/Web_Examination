using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
public partial class Admin1_Default2 : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
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
                SqlDataSource1.SelectCommand = "select * from Course";
                Datacon dataconn = new Datacon();
                SqlConnection cn = dataconn.getcon();
                cn.Open();
                SqlCommand com = cn.CreateCommand();
                com.CommandText = "select count(*) from Course";
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
        string Tsql = "delete from Course where c_id='";
        for (int i = 0; i < str.Length; i++)
        {
            Tsql += str[i]+"'";
            if (i + 1 < str.Length)
            {
                Tsql += " or c_id='";
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
        com.CommandText = "update Course set c_name='"+str[1]+"' where c_id='"+str[0]+"'";
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
        com.CommandText = "delete from Course where c_id='" + s + "'";
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
        SqlDataSource1.SelectCommand = "select * from Course where " + DropDownList_flag.SelectedValue + "   Like'%" + TextBox_select.Text + "%'";
    }
}