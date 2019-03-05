using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class welcome : System.Web.UI.Page
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
            Sever_Ip.Text = Request.ServerVariables.Get("Local_Addr").ToString();
            Sever_YuMing.Text = Request.ServerVariables["SERVER_NAME"].ToString();
            Sever_Lan.Text = Request.ServerVariables["HTTP_ACCEPT_LANGUAGE"].ToString();
            Sever_DuanKou.Text = Request.ServerVariables["SERVER_PORT"].ToString();
            Sever_IIS.Text = Request.ServerVariables["SERVER_SOFTWARE"].ToString();
            Sever_System.Text = HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"].ToString();
            Sever_Src.Text = Request.ServerVariables["PATH_TRANSLATED"].ToString();
            Sever_Cpu.Text = Environment.GetEnvironmentVariable("NUMBER_OF_PROCESSORS");
            Sever_CpuClass.Text = Environment.GetEnvironmentVariable("PROCESSOR_IDENTIFIER");
            
            //Sever_Time.Text = GetAspNetCpu();
            //Sever_Timee.Text = "";
        }


        //统计人数
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "select count(*) from Student";
        SqlCommand cmd = new SqlCommand(Tsql, con);
        Label3.Text =cmd.ExecuteScalar().ToString();
        string Tsql2 = "select count(*) from Teacher";
        SqlCommand cmd2 = new SqlCommand(Tsql2, con);
        Label1.Text = cmd2.ExecuteScalar().ToString();

    }
}