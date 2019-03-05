using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_user_KMXZ : System.Web.UI.Page
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
                dataconn.ecDropDownList(ddlLesson, "select  * from Course", "c_name", "c_id");
                dataconn.ecDropDownList(ddlQueName, "select * from TaoTi where c_id='" + ddlLesson.SelectedValue + "' and PaperState='" + 1 + "'", "PaperName", "PaperID");
            }          
        }
    }

    protected void ddlLesson_SelectedIndexChanged(object sender, EventArgs e)
    {
        dataconn.ecDropDownList(ddlQueName, "select * from TaoTi where c_id='" + ddlLesson.SelectedValue + "' and PaperState='" + 1 + "'", "PaperName", "PaperID");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = dataconn.getcon();
        con.Open();
        string sqlstr1 = "select count(*) from Score where UserID ='" + Session["ID"] + "' and PaperID='" + ddlQueName.SelectedValue + "'";
        SqlCommand mycom = new SqlCommand(sqlstr1, con);
        int intcount = Convert.ToInt32(mycom.ExecuteScalar());
        Application["d1"] = ddlLesson.SelectedItem;
        Session["PaperID"] = ddlQueName.SelectedValue;
        Session["PaperName"] = ddlQueName.SelectedItem;
        if (this.ddlQueName.Text == "")
        {
            Response.Write("<script lanuage=javascript>alert('您还没有选择考试套题，请重新选择！');location='javascript:history.go(-1)'</script>");
        }
        else if (intcount > 0)
        {
            Response.Write("<script lanuage=javascript>alert('此套题已经答过！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            Response.Redirect("wait.aspx");
        }
    }



}