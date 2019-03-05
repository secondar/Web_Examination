using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_user_Score : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Student")
            {
                Response.Write("<script>alert('非法登录！')</script>");
                Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
            }
            else
            {
                dataconn.bindinfostring(GridView1, "select * from student_score where ID='" + Session["ID"] + "' ", "ID");
            }           
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e) //查询
    {
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(GridView1, "select * from student_score  where ID='" + Session["ID"] + "'", "ID");
        }
        else
        {
            if (RadioButton1.Checked)
            {
                dataconn.bind(GridView1, "select * from student_score  where ID='" + Session["ID"] + "'and c_name Like'%" + TextBox1.Text + "%'");
            }
            else if (RadioButton2.Checked)
            {
                dataconn.bind(GridView1, "select * from student_score  where ID='" + Session["ID"] + "'and PaperName Like'%" + TextBox1.Text + "%'");
            }
            else if (RadioButton3.Checked)
            {
                dataconn.bind(GridView1, "select * from student_score  where ID='" + Session["ID"] + "'and Score Like'%" + TextBox1.Text + "%'");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('请选择查询类型！');</script>");
            }
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dataconn.bindinfostring(GridView1, "select * from student_score where ID='" + Session["ID"] + "' ", "ID");
    }






}