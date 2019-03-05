using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_add : System.Web.UI.Page
{
    Datacon db = new Datacon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            /*验证是否登陆了系统*/
            if (Session["User_Row"] != "Admin")
            {
                Response.Write("<script>top.location.href='../404.html';</script>");
                return;
            }

        }
    }

    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        SqlDataReader read = db.ExceRead("select * from Admin where ID='" + this.TextBox1.Text + "'");
        read.Read();
        if (read.HasRows)
        {
            if (this.TextBox1.Text == read["ID"].ToString())
            {
                Response.Write("<script>alert('该用户已存在！')</script>");
                Response.Write("<script>window.location.href='admin_add.aspx'</script>");

            }
        }
        else if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "")
        {
            Response.Write("<script>alert('请填写完整信息！')</script>");
            Response.Write("<script>window.location.href='admin_add.aspx'</script>");
        }
        else
        {
            db.eccom("insert into Admin(ID,Name,PWD,JoinTime) values ('" + this.TextBox1.Text + "','" + this.TextBox2.Text + "','" + this.TextBox3.Text + "' ,'" + DateTime.Now.ToString() + "')");

            Response.Write("<script>alert('添加成功！')</script>");
            Response.Write("<script>window.location.href='admin_add.aspx'</script>");
        }
        read.Close();
    }
}