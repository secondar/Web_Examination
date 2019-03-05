using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin1_Default : System.Web.UI.Page
{
    Datacon db = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Name"] == null || Session["User_Row"] != "Teacher")
        {
            Response.Write("<script>alert('非法登录！')</script>");
            Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
        }
        if (!IsPostBack)
        {
                    
        }
        db.ecDropDownList(DropDownList2, "select * from Course", "c_name", "c_id");          //初始化考试科目下拉列表框  
        db.ecDropDownList(DropDownList5, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
    }
    protected void Button_preview_Click(object sender, EventArgs e)
    {
        db.eccom("insert into SingleProblem(c_id,Title,AnswerA,AnswerB,AnswerC,AnswerD,Answer,Grade,Chapter) values('" + Request["DropDownList2"] + "','" + this.TextBox1.Text + "','" + this.TextBox2.Text + "','" + this.TextBox3.Text + "','" + this.TextBox4.Text + "','" + this.TextBox5.Text + "','" + Request["DropDownList1"] + "','" + Request["DropDownList3"] + "','" + Request["DropDownList5"] + "')");
        Response.Write("<script>alert('添加成功！')</script>");
    }
}