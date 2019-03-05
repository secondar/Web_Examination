using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_TeacherADD : System.Web.UI.Page
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

            dataconn.bindinfostring(GridView1, "select * from Teacher order by id DESC", "id");

        }
        //查询数据

        SqlConnection cn = dataconn.getcon();
        cn.Open();
        string sqlstr1 = "select count(*) from Teacher ";
        SqlCommand cmd1 = new SqlCommand(sqlstr1, cn);
        Label5.Text = cmd1.ExecuteScalar().ToString();


    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //if (TextBox1.Text == "")
        //{
        //    dataconn.bindinfostring(GridView1, "select * from Teacher order by id DESC", "id");
        //}
        //else
        //{
        //    dataconn.bind(GridView1, "select * from Teacher  where  " + DropDownList1.SelectedValue + " Like '%" + TextBox1.Text + "%'");
        //}

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dataconn.eccom("delete from Teacher where id='" + GridView1.DataKeys[e.RowIndex].Value + "'");
        Response.Redirect("TeacherADD.aspx");
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dataconn.bind(GridView1, "select * from Teacher order by id DESC");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        dataconn.bind(GridView1, "select * from Teacher order by id DESC");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection cn = dataconn.getcon();
        cn.Open();
        string id = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString();
        string name = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString();
        string pwd = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString();
        string JoinTime = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString();
        string degree = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString();
        SqlDataReader dr;
        string sql = "Update Teacher Set name='" + name + "',pwd='" + pwd + "',JoinTime='" + JoinTime + "',degree='" + degree + "'  Where id=" + id + "";
        SqlCommand myCommand = new SqlCommand(sql, cn);
        dr = myCommand.ExecuteReader();
        GridView1.EditIndex = -1;
        cn.Close();
        dataconn.bind(GridView1, "select * from Teacher order by id DESC");
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        dataconn.bind(GridView1, "select * from Teacher order by id DESC");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {

            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            ch.Checked = false;

        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                ((Button)e.Row.Cells[6].Controls[2]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除吗?')");
            }
        }
    }
    //批量删除
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button4.Attributes.Add("onclick", "javascript:return confirm('确定删除吗?');");
        foreach (GridViewRow gr in GridView1.Rows)
        {
            CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");
            if (ch.Checked == true)
            {
                dataconn.eccom("delete from Teacher where id='" + GridView1.DataKeys[gr.RowIndex].Value + "'");

            }

        }
        Response.Write("<script>alert('删除成功');</script>");
        Response.Redirect("TeacherADD.aspx");
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
    //搜索
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            dataconn.bindinfostring(GridView1, "select * from Teacher order by id DESC", "id");
        }
        else
        {
            dataconn.bind(GridView1, "select * from Teacher  where  " + DropDownList1.SelectedValue.Trim() + " Like '%" + TextBox1.Text + "%'");

            //查询数据

            SqlConnection cn = dataconn.getcon();
            cn.Open();
            string sqlstr1 = "select count(*) from Teacher  where  " + DropDownList1.SelectedValue.Trim() + " Like '%" + TextBox1.Text + "%'";
            SqlCommand cmd1 = new SqlCommand(sqlstr1, cn);
            Label5.Text = cmd1.ExecuteScalar().ToString();
        }
    }
}