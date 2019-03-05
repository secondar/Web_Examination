using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using MyWeb.BusinessLogicLayer;
public partial class Admin1_TaoTiDetail : System.Web.UI.Page
{
    int paperID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Teacher")
            {
                Response.Write("<script>alert('非法登录！')</script>");
                Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
            }
            else
            {
                InitData();
            }
        }
    }
    protected void InitData()
    {
        Datacon DB = new Datacon();
        try
        {
            paperID = Convert.ToInt32(Request.QueryString["PaperID"].ToString());
        }
        catch
        {
            Response.Write("<script>alert('无法获取试卷ID！')</script>");
            Response.Write("<script language=javascript>top.location.href='index.aspx'</script>");
        }
        SqlParameter[] Params1 = new SqlParameter[2];
        Params1[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params1[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "单选题");            //题目类型        
        DataSet ds1 = DB.GetDataSet("Proc_PaperDetail", Params1);
        GridView1.DataSource = ds1;
        GridView1.DataBind();

        SqlParameter[] Params2 = new SqlParameter[2];
        Params2[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params2[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "多选题");            //题目类型        
        DataSet ds2 = DB.GetDataSet("Proc_PaperDetail", Params2);
        GridView2.DataSource = ds2;
        GridView2.DataBind();

        SqlParameter[] Params3 = new SqlParameter[2];
        Params3[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params3[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "判断题");            //题目类型        
        DataSet ds3 = DB.GetDataSet("Proc_PaperDetail", Params3);
        GridView3.DataSource = ds3;
        GridView3.DataBind();



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MangeTaoTi.aspx");
    }
}