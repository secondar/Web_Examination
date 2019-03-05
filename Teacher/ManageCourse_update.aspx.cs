using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_ManageCourseupdate : System.Web.UI.Page
{
    string c_id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Teacher")
        {
            Response.Write("<script>alert('非法登录！')</script>");
            Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
        }
        if (!IsPostBack)
        {
            try
            {
                c_id = Request.QueryString["c_id"].ToString();
                Datacon dataconn = new Datacon();
                SqlConnection cn = dataconn.getcon();
                cn.Open();
                SqlCommand com = cn.CreateCommand();
                com.CommandText = "select * from Course where c_id='" + c_id + "'";
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    TextBox_c_id.Text = c_id;
                    TextBox_c_name.Text = dr["c_name"].ToString();
                    TextBox_c_date.Text = dr["c_date"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('信息获取失败!');window.parent.location.reload();</script>");
                }
                cn.Close();
            }
            catch
            {
                Response.Write("<script>window.parent.location.reload();</script>");
            }
        }
    }
    protected void Button_insertinto_Click(object sender, EventArgs e)
    {
        Datacon dataconn = new Datacon();
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = cn.CreateCommand();
        com.CommandText = "update Course set c_name='" + TextBox_c_name.Text.ToString().Trim() + "' where c_id='" + TextBox_c_id.Text.ToString().Trim() + "'";
        if (com.ExecuteNonQuery() > 0)
        {
            Response.Write("<script>alert('修改成功!"+TextBox_c_name.Text+TextBox_c_id .Text+ "');window.parent.location.reload();</script>");
        }
    }
    protected void Button_back_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.parent.location.reload();</script>");
    }
}