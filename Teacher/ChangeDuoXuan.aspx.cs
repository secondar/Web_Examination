using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.BusinessLogicLayer;
using System.Data.SqlClient;
public partial class Admin1_Default3 : System.Web.UI.Page
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
    protected void InitData()
    {
        int multiProblemID = int.Parse(Request["ID"].ToString());  //取出传递过来的试题编号
        MultiProblem multiproblem = new MultiProblem();          //创建单选题对象
        if (multiproblem.LoadData(multiProblemID))                //如果取出题目信息，分别放在相应控件显示
        {
            db.ecDropDownList(ddlCourse, "select *from Course where c_id=(select c_id from MultiProblem where ID='" + multiProblemID + " ')", "c_name", "c_id");
            txtTitle.Text = multiproblem.Title;
            txtAnswerA.Text = multiproblem.AnswerA;
            txtAnswerB.Text = multiproblem.AnswerB;
            txtAnswerC.Text = multiproblem.AnswerC;
            txtAnswerD.Text = multiproblem.AnswerD;
            string answer = multiproblem.Answer.ToString();
            SqlConnection cn = db.getcon();
            cn.Open();
            string sqlstr1 = "select Answer from MultiProblem where ID='" + Request["ID"].ToString() + "'";
            SqlCommand cmd1 = new SqlCommand(sqlstr1, cn);
            Label1.Text = cmd1.ExecuteScalar().ToString();
        }
        else                //查询出错，给出提示
        {
            Response.Write("<script>alert('加载数据错误！');</script>");
            Response.Write("<script>window.location.href='ChangeDuoXuan.aspx'</script>");
        }
    }
    protected void Button_preview_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            MultiProblem multiproblem = new MultiProblem();          //创建单选题对象
            multiproblem.c_id = int.Parse(ddlCourse.SelectedValue);//为单选题对象各属性赋值
            multiproblem.Title = txtTitle.Text;
            multiproblem.AnswerA = txtAnswerA.Text;
            multiproblem.AnswerB = txtAnswerB.Text;
            multiproblem.AnswerC = txtAnswerC.Text;
            multiproblem.AnswerD = txtAnswerD.Text;
            string answer = "";
            for (int i = 0; i < cblAnswer.Items.Count; i++)
            {
                if (cblAnswer.Items[i].Selected)
                {
                    answer += cblAnswer.Items[i].Text;
                }
            }
            multiproblem.Answer = answer;
            if (Request["ID"] != null)                                  //如果是修改题目信息
            {
                multiproblem.ID = int.Parse(Request["ID"].ToString()); //取出试题主键
                if (multiproblem.UpdateByProc(int.Parse(Request["ID"].ToString())))//调用修改试题方法修改试题
                {
                    Response.Write("<script>alert('修改成功！');</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败！');</script>");
                }
                Response.Write("<script>window.location.href='ManageDouXuan.aspx'</script>");
            }

        }
    }
}