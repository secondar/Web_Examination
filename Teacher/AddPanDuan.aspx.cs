using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin1_Default2 : System.Web.UI.Page
{
    Datacon db = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Teacher")
        {
            Response.Write("<script>alert('非法登录！')</script>");
            Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
        }
        if (!IsPostBack)
        {
            db.ecDropDownList(ddlCourse, "select * from Course", "c_name", "c_id");          //初始化考试科目下拉列表框          
        }
        db.ecDropDownList(DropDownList5, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
    }
    protected void Button_preview_Click(object sender, EventArgs e)
    {
        db.eccom("insert into JudgeProblem(c_id,Title,Answer,Grade) values('" + Request["ddlCourse"] + "','" + this.txtTitle.Text + "','" + rblAnswer.SelectedValue + "','" + Request["DropDownList3"] + "','" + Request["DropDownList5"] + "')");
        Response.Write("<script>alert('添加成功！')</script>");
    }
}