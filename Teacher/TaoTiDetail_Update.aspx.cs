using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_TaoTiDetail_Update : System.Web.UI.Page
{
    string PaperID="";
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack){
			if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Teacher")
			{
				Response.Write("<script>alert('非法登录！')</script>");
				Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
			}
			try
			{
				PaperID = Request.QueryString["PaperID"].ToString();
				Datacon dataconn = new Datacon();
				SqlConnection cn = dataconn.getcon();
				cn.Open();
				SqlCommand com = cn.CreateCommand();
				com.CommandText = "select * from TaoTi where PaperID='" + PaperID + "'";
				SqlDataReader dr = com.ExecuteReader();
				if (dr.Read())
				{
					TextBox_PaperID.Text = PaperID;
					TextBox_c_id.Text = dr["c_id"].ToString();
					TextBox_PaperName.Text = dr["PaperName"].ToString();
					TextBox_PaperState.Text = dr["PaperState"].ToString();
					TextBox_AnswerTime.Text = dr["AnswerTime"].ToString();
					TextBox_Score.Text = dr["Score"].ToString();
					TextBox_teacher_id.Text = dr["teacher_id"].ToString();
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

    protected void Button_back_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.parent.location.reload();</script>");
    }
    protected void Button_insertinto_Click(object sender, EventArgs e)
    {
        Datacon dataconn = new Datacon();
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        SqlCommand com = cn.CreateCommand();
        com.CommandText = "update TaoTi set PaperName='" + TextBox_PaperName.Text + "',PaperState='" + TextBox_PaperState.Text + "',AnswerTime='" + TextBox_AnswerTime.Text + "' where PaperID='" + PaperID + "'";
        if (com.ExecuteNonQuery() > 0)
        {
            Response.Write("<script>alert('修改成功!');window.parent.location.reload();</script>");
        }
    }
}