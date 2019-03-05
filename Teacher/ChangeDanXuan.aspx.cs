using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.BusinessLogicLayer;
public partial class Admin1_Default : System.Web.UI.Page
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
        int SingleProblemID = int.Parse(Request["ID"].ToString());  //取出传递过来的试题编号
        SingleProblem singleproblem = new SingleProblem();          //创建单选题对象
        if (singleproblem.LoadData(SingleProblemID))                //如果取出题目信息，分别放在相应控件显示
        {
            db.ecDropDownList(ddlCourse, "select * from Course where c_id=(select c_id from SingleProblem where ID='" + SingleProblemID + " ')", "c_name", "c_id");
            txtTitle.Text = singleproblem.Title;
            txtAnswerA.Text = singleproblem.AnswerA;
            txtAnswerB.Text = singleproblem.AnswerB;
            txtAnswerC.Text = singleproblem.AnswerC;
            txtAnswerD.Text = singleproblem.AnswerD;
            ddlAnswer.SelectedItem.Text = singleproblem.Answer;
        }
        else                //查询出错，给出提示
        {
            Response.Write("<script>alert('加载数据错误！');</script>");
            Response.Write("<script>window.location.href='ChangeDanXuan.aspx'</script>");
        }
    }
    protected void Button_preview_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SingleProblem singleproblem = new SingleProblem();          //创建单选题对象
            singleproblem.c_id = int.Parse(ddlCourse.SelectedValue);//为单选题对象各属性赋值
            singleproblem.Title = txtTitle.Text;
            singleproblem.AnswerA = txtAnswerA.Text;
            singleproblem.AnswerB = txtAnswerB.Text;
            singleproblem.AnswerC = txtAnswerC.Text;
            singleproblem.AnswerD = txtAnswerD.Text;
            singleproblem.Answer = ddlAnswer.SelectedItem.Text;
            if (Request["ID"] != null)                                  //如果是修改题目信息
            {
                singleproblem.ID = int.Parse(Request["ID"].ToString()); //取出试题主键
                if (singleproblem.UpdateByProc(int.Parse(Request["ID"].ToString())))//调用修改试题方法修改试题
                {
                    Response.Write("<script>alert('修改成功！');</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败！');</script>");
                }
                Response.Write("<script>window.location.href='ManageDanXuan.aspx'</script>");
            }

        }
    }
}