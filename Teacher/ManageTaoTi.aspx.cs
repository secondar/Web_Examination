using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using MyWeb.BusinessLogicLayer;
using System.Web.Services;


public partial class Admin1_Default : System.Web.UI.Page
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
                Datacon dataconn = new Datacon();
                SqlConnection cn = dataconn.getcon();
                cn.Open();
                SqlCommand com = cn.CreateCommand();
                com.CommandText = "select count(*) from TaoTi";
                int count1 = Convert.ToInt32(com.ExecuteScalar());
                Label1.Text = count1.ToString();
                cn.Close();
                SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
                SqlDataSource1.SelectCommand = "select * from TaoTi order by PaperID DESC";
            }
        }
    }
    [WebMethod]
    public static string DeleteAll(string s)
    {
        string[] str = s.Split('*');
        string Tsql = "delete from TaoTi where PaperID='";
        for (int i = 0; i < str.Length; i++)
        {
            Tsql += str[i] + "'";
            if (i + 1 < str.Length)
            {
                Tsql += " or PaperID='";
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
    public static string Delete(string s)
    {
        Datacon dataconn = new Datacon();
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = cn.CreateCommand();
        com.CommandText = "delete from TaoTi where PaperID='" + s + "'";
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
        SqlDataSource1.SelectCommand = "select *from TaoTi where " + DropDownList_flag.SelectedValue + " Like'%" + TextBox_select.Text + "%'";
    }
}