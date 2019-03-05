using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Student_add : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
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
            else
            {
                ReaderTypeDataSource.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
                ReaderTypeDataSource.SelectCommand = "SELECT Name  FROM Major";
            }

        }
        
       
    }
    //提交
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataReader read = dataconn.ExceRead("select * from Student where ID='" + this.txtStuID.Text + "'");
        read.Read();
        if (read.HasRows)
        {
            if (this.txtStuID.Text == read["ID"].ToString())
            {
                Response.Write("<script>alert('该用户已存在！')</script>");
                Response.Write("<script>window.location.href='Student_add.aspx'</script>");

            }
        }
        else
        {
            dataconn.eccom("insert into Student(ID,Name,PWD,Sex,JoinTime,Question,Answer,profession) values ('" + this.txtStuID.Text + "','" + this.txtStuName.Text + "','" + this.txtStuPwd.Text + "' ,'" + Request["DropDownList1"] + "','" + DateTime.Now.ToString() + "','" + Request["DropDownList3"] + "','" + this.txtAnsPwd.Text + "','" + Request["ddlProfession"] + "')");
            Session["ID"] = txtStuID.Text;
            Session["PWD"] = txtStuPwd.Text;
            Response.Write("<script>alert('添加成功！')</script>");
            Response.Write("<script>window.location.href='Student_add.aspx'</script>");
        }
        read.Close();
    }

}