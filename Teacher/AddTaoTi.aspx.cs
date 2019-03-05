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
public partial class Admin1_Default : System.Web.UI.Page
{
    Datacon db = new Datacon();
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
                preview_div.Style.Add("display", "none");//不显示
                db.ecDropDownList(ddlCourse, "select * from Course", "c_name", "c_id");
                db.ecDropDownList(DropDownList5, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
                db.ecDropDownList(DropDownList6, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
                db.ecDropDownList(DropDownList7, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
                db.ecDropDownList(DropDownList8, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
                db.ecDropDownList(DropDownList9, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
                db.ecDropDownList(DropDownList10, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
                db.ecDropDownList(DropDownList11, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
                db.ecDropDownList(DropDownList12, "select ID,Name+'-'+Chapter as Chapter from Chapter", "Chapter", "ID");
            }
        }
        Rscore();
        double num = Convert.ToDouble(Label21.Text);
    }
    protected void Button_preview_Click(object sender, EventArgs e)
    {
        add.Style.Add("display", "none");//不显示
        preview_div.Style.Add("display", "block");//显示
        double num = Convert.ToDouble(Label21.Text);
        if (num <= 100)
        {
            int d1 = int.Parse(SingleNum.Text.Trim()) + int.Parse(SingleNum1.Text.Trim()) + int.Parse(SingleNum2.Text.Trim());
            string GridView1Str = "select top " + d1 + " * from SingleProblem where c_id='" + ddlCourse.SelectedValue + " ' order by newid()";//根据参数设置查询单选题Sql语句
            DataSet ds1 = db.GetDataSetSql(GridView1Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView1.DataSource = ds1.Tables[0].DefaultView;//为单选题GridView控件指名数据源
            GridView1.DataBind();//绑定数据
            int d2 = int.Parse(MultiNum.Text.Trim()) + int.Parse(MultiNum1.Text.Trim()) + int.Parse(MultiNum2.Text.Trim());
            string GridView2Str = "select top " + d2 + " * from MultiProblem where c_id='" + ddlCourse.SelectedValue + " ' order by newid()";//根据参数设置查询多选题Sql语句
            DataSet ds2 = db.GetDataSetSql(GridView2Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView2.DataSource = ds2.Tables[0].DefaultView;//为多选题GridView控件指名数据源
            GridView2.DataBind();//绑定数据
            int d3 = int.Parse(JudgeNum.Text.Trim()) + int.Parse(JudgeNum1.Text.Trim());
            string GridView3Str = "select top " + d3 + " * from JudgeProblem  where c_id='" + ddlCourse.SelectedValue + " ' order by newid()";//根据参数设置查询判断题Sql语句
            DataSet ds3 = db.GetDataSetSql(GridView3Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView3.DataSource = ds3.Tables[0].DefaultView;//为判断题GridView控件指名数据源
            GridView3.DataBind();//绑定数据
        }
        else
        {
            Response.Write("<script>alert('分数大于了100分,请重新选择！')</script>");
        }
    }
    protected void Button_back_Click(object sender, EventArgs e)
    {
        preview_div.Style.Add("display", "none");//不显示
        add.Style.Add("display", "block");//显示
    }
    public void Rscore()
    {

        double a = Convert.ToDouble(SingleNum.Text);//定义一个变量a，把TextBox1中的值赋给它
        double b = Convert.ToDouble(MultiNum.Text);
        double a1 = Convert.ToDouble(SingleNum1.Text);//定义一个变量a，把TextBox1中的值赋给它
        double b1 = Convert.ToDouble(MultiNum1.Text);
        double a2 = Convert.ToDouble(SingleNum2.Text);//定义一个变量a，把TextBox1中的值赋给它
        double b2 = Convert.ToDouble(MultiNum2.Text);
        double c = Convert.ToDouble(JudgeNum.Text);
        double c1 = Convert.ToDouble(JudgeNum1.Text);
        double a_f = Convert.ToDouble(SingleFen.Text);//定义一个变量a，把TextBox1中的值赋给它
        double b_f = Convert.ToDouble(MultiFen.Text);
        double a_f1 = Convert.ToDouble(SingleFen1.Text);//定义一个变量a，把TextBox1中的值赋给它
        double b_f1 = Convert.ToDouble(MultiFen1.Text);
        double a_f2 = Convert.ToDouble(SingleFen2.Text);//定义一个变量a，把TextBox1中的值赋给它
        double b_f2 = Convert.ToDouble(MultiFen2.Text);
        double c_f = Convert.ToDouble(JudgeFen.Text);
        double c_f1 = Convert.ToDouble(JudgeFen1.Text);
        Label21.Text = Convert.ToString(a * a_f + b * b_f + c * c_f + a1 * a_f1 + b1 * b_f1 + c1 * c_f1 + a2 * a_f2 + b2 * b_f2);

    }
    protected void Button_insertinto_Click(object sender, EventArgs e)
    {
        Datacon db = new Datacon();
        string str = "";
        string insertpaper = "insert into TaoTi(c_id,PaperName,PaperState,JoinTime,AnswerTime,Score,teacher_id,Grade) values(" + int.Parse(ddlCourse.SelectedValue) + ",'" + txtPaperName.Text + "','" + DropDownList2.SelectedValue + "','" + DateTime.Now.ToString() + "','" + DropDownList1.SelectedValue + "', '" + Label21.Text + "','" + Session["ID"] + "','" + Request["DropDownList3"] + "')";
        int afterID = db.GetIDInsert(insertpaper);//保存试卷，并返回自动生成的试卷编号
        if (afterID > 0)
        {
            foreach (GridViewRow dr in GridView1.Rows)//保存试卷单选题信息
            {
                string single = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'单选题'," + int.Parse(((Label)dr.FindControl("Label3")).Text) + "," + int.Parse(SingleFen.Text) + ")";
                db.Insert(single);
            }
            foreach (GridViewRow dr in GridView2.Rows)//保存试卷多选题信息
            {
                string multi = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'多选题'," + int.Parse(((Label)dr.FindControl("Label6")).Text) + "," + int.Parse(MultiFen.Text) + ")";
                db.Insert(multi);
            }
            foreach (GridViewRow dr in GridView3.Rows)//保存试卷判断题信息
            {
                string judge = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'判断题'," + int.Parse(((Label)dr.FindControl("Label7")).Text) + "," + int.Parse(JudgeFen.Text) + ")";
                db.Insert(judge);
                str = judge;
            }

        }
        //Datacon db = new Datacon();
        //string insertpaper = "insert into TaoTi(c_id,PaperName,PaperState,JoinTime,AnswerTime,Score,teacher_id) values(" + int.Parse(ddlCourse.SelectedValue) + ",'" + txtPaperName.Text + "','" + DropDownList2.SelectedValue + "','" + DateTime.Now.ToString() + "','" + DropDownList1.SelectedValue + "', '" + Label21.Text + "','" + Session["ID"] + "')";
        //int afterID = db.GetIDInsert(insertpaper);//保存试卷，并返回自动生成的试卷编号
        //if (afterID > 0)
        //{
        //    foreach (GridViewRow dr in GridView1.Rows)//保存试卷单选题信息
        //    {
        //        string single = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'单选题'," + int.Parse(((Label)dr.FindControl("Label3")).Text) + "," + int.Parse(SingleFen.Text) + ")";
        //        db.Insert(single);
        //    }
        //    foreach (GridViewRow dr in GridView2.Rows)//保存试卷多选题信息
        //    {
        //        string multi = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'多选题'," + int.Parse(((Label)dr.FindControl("Label6")).Text) + "," + int.Parse(MultiFen.Text) + ")";
        //        db.Insert(multi);
        //    }
        //    foreach (GridViewRow dr in GridView3.Rows)//保存试卷判断题信息
        //    {
        //        string judge = "insert into TaoTiDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'判断题'," + int.Parse(((Label)dr.FindControl("Label7")).Text) + "," + int.Parse(JudgeFen.Text) + ")";
        //        db.Insert(judge);
        //    }

        //}
        Response.Write("<script>alert('添加成功！')</script>");
        Response.Write("<script>window.location.href='AddTaoTi.aspx'</script>");
    }
}