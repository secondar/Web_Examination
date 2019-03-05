using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User_Name"] == null)
            {
                Response.Write("<script>alert('非法登录！')</script>");
                Response.Write("<script language=javascript>top.location.href='Login.aspx'</script>");
            }
            else
            {

                Sever_Name.Text = System.Net.Dns.GetHostName();//获取服务端计算机名称
                System.Net.IPAddress clientIP = System.Net.IPAddress.Parse(Request.UserHostAddress);
                System.Net.IPHostEntry ihe = System.Net.Dns.GetHostEntry(clientIP);
                Label_Name.Text = ihe.HostName;//获取客户端主机名称
                HttpRequest request = HttpContext.Current.Request;
                string result = request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (string.IsNullOrEmpty(result))
                {
                    result = Request.ServerVariables.Get("Local_Addr").ToString();
                }
                if (string.IsNullOrEmpty(result))
                {
                    result = request.UserHostAddress;
                }
                if (string.IsNullOrEmpty(result))
                {
                    result = "0.0.0.0";
                }
                //Label_IP.Text = result;
                Sever_Ip.Text = Request.ServerVariables.Get("Local_Addr").ToString();
                Sever_YuMing.Text = Request.ServerVariables["SERVER_NAME"].ToString();
                Sever_System.Text = HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"].ToString();
                Datacon dataconn = new Datacon();
                SqlConnection cn = dataconn.getcon();
                cn.Open();
                SqlCommand com = cn.CreateCommand();
                com.CommandText = "select count(*) from SingleProblem";
                int count1 = Convert.ToInt32(com.ExecuteScalar());
                Label_DanXuan.Text = count1.ToString();
                cn.Close();
                cn.Open();
                com.CommandText = "select count(*) from MultiProblem";
                count1 = Convert.ToInt32(com.ExecuteScalar());
                Label_DuoXuan.Text = count1.ToString();
                cn.Close();
                cn.Open();
                com.CommandText = "select count(*) from JudgeProblem";
                count1 = Convert.ToInt32(com.ExecuteScalar());
                Label_PanDuan.Text = count1.ToString();
                cn.Close();
                cn.Open();
                com.CommandText = "select count(*) from student_score";
                count1 = Convert.ToInt32(com.ExecuteScalar());
                Label_ChengJi.Text = count1.ToString();
                cn.Close();
                cn.Open();
                com.CommandText = "select count(*) from Student";
                count1 = Convert.ToInt32(com.ExecuteScalar());
                Label_Stu.Text = count1.ToString();
                cn.Close();
                cn.Open();
                com.CommandText = "select count(*) from TaoTi";
                count1 = Convert.ToInt32(com.ExecuteScalar());
                Label_ShiJuan.Text = count1.ToString();
                cn.Close();
                cn.Open();
                com.CommandText = "select count(*) from Course";
                count1 = Convert.ToInt32(com.ExecuteScalar());
                Label_KeCheng.Text = count1.ToString();
                cn.Close();
            }
        }
        
    }
}