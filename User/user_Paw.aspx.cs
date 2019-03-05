using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_user_Paw : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Student")
            {
                Response.Write("<script>alert('非法登录！')</script>");
                Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
            }
        }   
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Trim() != string.Empty && TextBox2.Text.Trim() != string.Empty && TextBox3.Text.Trim() != string.Empty)
        {
            if (paw()) //验证旧密码
            {
                if (TextBox2.Text.Trim() == TextBox3.Text.Trim())
                {
                    if (TextBox3.Text.Trim() == TextBox1.Text.Trim())
                    {
                        ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('您的新密码与旧密码相同，无需修改！');</script>");
                    }
                    else
                    {
                        try
                        {
                            DataBaseAccess.Conn_database(DataBaseAccess.strconn);
                            string str = "update Student set PWD=@paw where ID=@id";
                            SqlParameter[] spar = { new SqlParameter("@paw", TextBox3.Text.Trim()), new SqlParameter("@id", Session["ID"].ToString().Trim()) };
                            DataBaseAccess.Select(str, spar); //修改密码
                            //清空Session
                            Session.Clear();
                            Session.Abandon();
                            //在Iframe框架下跳转到登录界面
                            this.ClientScript.RegisterStartupScript(this.GetType(), "message", "<script language='javascript' defer>alert('密码修改成功，请重新登录！');parent.window.location='../Login.aspx';</script>");
                        }
                        catch
                        {
                            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('服务器出错啦！');</script>");
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('您两次输入的密码不一致，请重新输入！');</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('您输入的旧密码不正确！');</script>");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('密码不能为空！');</script>");
        }
    }

    private bool paw() //验证旧密码
    {
        try
        {
            DataBaseAccess.Conn_database(DataBaseAccess.strconn);
            string str = "select PWD from Student where ID=@id";
            string strPaw = DataBaseAccess.Select(str, new SqlParameter("@id", Session["ID"].ToString().Trim())).Rows[0][0].ToString().Trim(); //读取密码
            if (strPaw == TextBox1.Text.Trim())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('服务器出错啦！');</script>");
            return false;
        }
    }












}