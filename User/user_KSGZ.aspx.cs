using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_user_KSGZ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Student")
        {
            Response.Write("<script>alert('非法登录！')</script>");
            Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
        }
        else
        {
            Label1.Visible = false;
        }      
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckBox1.Checked)
        {
            Label1.Visible = false;
            Response.Redirect("user_KMXZ.aspx");
        }
        else
        {
            Label1.Visible = true;       
        }
    }


}