using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_index : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            /*验证是否登陆了系统*/
            if (Session["User_Row"] != "Admin")
            {
                Response.Write("<script>top.location.href='../404.html';</script>");
                return;
            }


            SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            string Tsql = "select Name from Admin where ID='" + Session["User_Name"].ToString().Trim() + "'";
            SqlCommand cmd = new SqlCommand(Tsql, con);
            Label1.Text = cmd.ExecuteScalar().ToString();
            
        }

        


    }
}