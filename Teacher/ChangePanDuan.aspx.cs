using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.BusinessLogicLayer;
using System.Data;
using System.Data.SqlClient;

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

            InitData();

        }

    }
    public void InitData()
    {
        int judgeProblemID = int.Parse(Request["ID"].ToString());   //取出传递过来的试题编号
        JudgeProblem judgeproblem = new JudgeProblem();             //创建判断题对象
        if (judgeproblem.LoadData(judgeProblemID))                  //如果取出题目信息，分别放在相应控件显示
        {
            db.ecDropDownList(ddlCourse, "select * from Course where c_id=(select c_id from JudgeProblem where ID='" + judgeProblemID + "' )", "c_name", "c_id");
            txtTitle.Text = judgeproblem.Title;
            SqlConnection cn = db.getcon();
            cn.Open();
            string sqlstr1 = "select Answer from JudgeProblem where ID='" + Request["ID"].ToString() + "'";
            SqlCommand cmd1 = new SqlCommand(sqlstr1, cn);
            Label1.Text = cmd1.ExecuteScalar().ToString();
        }
        else                //查询出错，给出提示
        {
            Response.Write("<script>alert('加载数据错误！');</script>");
            Response.Write("<script>window.location.href='ChangePanDuan.aspx'</script>");
        }
    }
    protected void Button_preview_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            JudgeProblem judgeproblem = new JudgeProblem();          //创建判断题对象
            judgeproblem.c_id = int.Parse(ddlCourse.SelectedValue);//为判断题对象各属性赋值
            judgeproblem.Title = txtTitle.Text;
            judgeproblem.Answer = bool.Parse(rblAnswer.SelectedValue);
            if (Request["ID"] != null)                                  //如果是修改题目信息
            {
                judgeproblem.ID = int.Parse(Request["ID"].ToString()); //取出试题主键
                if (judgeproblem.UpdateByProc(int.Parse(Request["ID"].ToString())))//调用修改试题方法修改试题
                {
                    Response.Write("<script>alert('修改成功！');</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败！');</script>");
                }
                Response.Write("<script>window.location.href='ManagePanDuan.aspx'</script>");
            }

        }
    }
}