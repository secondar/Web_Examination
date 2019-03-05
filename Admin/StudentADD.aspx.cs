using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_StudentADD : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        Button4.Attributes.Add("onclick", "javascript:return window.confirm('您确定要删除吗?')");
        if (!IsPostBack)
        {
            /*验证是否登陆了系统*/
            if (Session["User_Row"] != "Admin")
            {
                Response.Write("<script>top.location.href='../404.html';</script>");
                return;
            }

            dataconn.bindinfostring(GridView1, "select * from Student order by ID DESC", "ID");

            //查询数据
            SqlConnection cn = dataconn.getcon();
            cn.Open();
            string sqlstr1 = "select count(*) from Student";
            SqlCommand cmd1 = new SqlCommand(sqlstr1, cn);
            Label5.Text = cmd1.ExecuteScalar().ToString();

        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(GridView1, "select * from Student order by ID DESC", "ID");
        }
        else
        {
            dataconn.bind(GridView1, "select * from Student where  " + DropDownList1.SelectedValue + "   Like'%" + TextBox1.Text + "%'");
        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dataconn.eccom("delete from Student where ID='" + GridView1.DataKeys[e.RowIndex].Value + "'");
        Response.Redirect("StudentADD.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dataconn.bind(GridView1, "select * from Student order by ID DESC");
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {

            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            if (ch.Checked == true)
            {

                ch.Checked = false;

            }
            else
            {

                ch.Checked = true;

            }

        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {

            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            ch.Checked = false;

        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        dataconn.bind(GridView1, "select * from Student  order by ID DESC");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        string ID = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString();
        string Name = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString();
        string PWD = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString();
        string Sex = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString();
        string JoinTime = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString();
        string Question = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString();
        string Answer = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[7].Controls[0])).Text.ToString();
        string profession = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[8].Controls[0])).Text.ToString();
        SqlDataReader dr;
        string sql = "Update Student Set Name='" + Name + "',PWD='" + PWD + "',Sex='" + Sex + "',JoinTime='" + JoinTime + "',Question='" + Question + "',Answer='" + Answer + "',profession='" + profession + "'  Where ID=" + ID + "";
        SqlCommand myCommand = new SqlCommand(sql, cn);
        dr = myCommand.ExecuteReader();
        GridView1.EditIndex = -1;
        cn.Close();
        dataconn.bind(GridView1, "select * from Student  order by ID DESC");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        dataconn.bind(GridView1, "select * from Student  order by ID DESC");
    }

    //全选
    protected void ImageButton3_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {

            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            if (ch.Checked == true)
            {

                ch.Checked = false;

            }
            else
            {

                ch.Checked = true;

            }

        }
    }
    //批量删除
    protected void ImageButton2_Click(object sender, EventArgs e)
    {
        Button4.Attributes.Add("onclick", "javascript:return confirm('确定删除吗?');");
        foreach (GridViewRow gr in GridView1.Rows)
        {
            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            if (ch.Checked == true)
            {
                dataconn.eccom("delete from Student where ID='" + GridView1.DataKeys[gr.RowIndex].Value + "'");

            }

        }
        Response.Write("<script>alert('删除成功');</script>");
        Response.Redirect("StudentADD.aspx");
    }
    //搜索
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(GridView1, "select * from Student order by ID DESC", "ID");
        }
        else
        {
            dataconn.bind(GridView1, "select * from Student where  " + DropDownList1.SelectedValue.Trim() + "    Like'%" + TextBox1.Text + "%'");

            //查询数据记录
            SqlConnection cn = dataconn.getcon();
            cn.Open();
            string sqlstr1 = "select count(*) from Student where  " + DropDownList1.SelectedValue.Trim() + "   Like'%" + TextBox1.Text + "%'";
            SqlCommand cmd1 = new SqlCommand(sqlstr1, cn);
            Label5.Text = cmd1.ExecuteScalar().ToString();
        }
    }
}