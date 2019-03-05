using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_ChapterAdd : System.Web.UI.Page
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
            db.ecDropDownList(DropDownList2, "select * from Course", "c_name", "c_id");          //初始化考试科目下拉列表框          

        }
    }
    protected void Button_preview_Click(object sender, EventArgs e)
    {
        //Chapter
        db.eccom("insert into Chapter values('" + Request["DropDownList2"] + "','" + TextBox_zj.Text + "','" + this.TextBox1.Text + "')");
        Response.Write("<script>alert('添加成功！')</script>");
    }
}