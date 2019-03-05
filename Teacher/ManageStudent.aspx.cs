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


public partial class Admin1_Default2 : System.Web.UI.Page
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
            com.CommandText = "select count(*) from Student";
            int count1 = Convert.ToInt32(com.ExecuteScalar());
            Label1.Text = count1.ToString();
            cn.Close();
            SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
            SqlDataSource1.SelectCommand = "select * from Student order by ID DESC";
        }
    }
    protected void Button_select_Click(object sender, EventArgs e)
    {
        if (TextBox_select.Text == "")
        {
            SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
            SqlDataSource1.SelectCommand = "select * from Student order by ID DESC";
        }
        else
        {
            SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
            SqlDataSource1.SelectCommand = "select * from Student where  " + DropDownList_flag.SelectedValue + "   Like'%" + TextBox_select.Text + "%'";
        }
    }
}