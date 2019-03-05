using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_ManageChapter_update : System.Web.UI.Page
{
    string ID = "";
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
                ID = Request.QueryString["ID"].ToString();
                Datacon dataconn = new Datacon();
                SqlConnection cn = dataconn.getcon();
                cn.Open();
                SqlCommand com = cn.CreateCommand();
                com.CommandText = "select ID,Name,Chapter,c_name from Chapter,Course where Chapter.c_id=Course.c_id and ID='" + ID + "'";
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    TextBox_c_id.Text = ID;
                    TextBox_c_name.Text = dr["Name"].ToString();
                    TextBox_c_date.Text = dr["Chapter"].ToString();
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
        com.CommandText = "update Chapter set Name='" + TextBox_c_name.Text.ToString().Trim() + "',Chapter='" + TextBox_c_date.Text + "' where ID='" + TextBox_c_id.Text.ToString().Trim() + "'";
        if (com.ExecuteNonQuery() > 0)
        {
            Response.Write("<script>alert('修改成功!" + TextBox_c_name.Text + TextBox_c_id.Text + "');window.parent.location.reload();</script>");
        }
    }
    protected void Button_back_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.parent.location.reload();</script>");
    }
}