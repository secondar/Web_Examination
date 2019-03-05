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
using System.Drawing;

public partial class User_user_KS : System.Web.UI.Page
{
    public string strFalg;

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {
            if (Session["User_Name"] == null || Session["User_Row"].ToString() != "Student")
            {
                Response.Write("<script>alert('非法登录！')</script>");
                Response.Write("<script language=javascript>top.location.href='../Login.aspx'</script>");
            }
            else
            {
                try
                {
                    strFalg = "true";
                    //第一次加载考试页面时，把成绩0分写入数据库，防止考生作弊偷看试题
                    Scores insertScore = new Scores();  //创建Scores类对象
                    insertScore.UserID = Session["ID"].ToString();//设置Scores对象的属性
                    insertScore.PaperID = int.Parse(Session["PaperID"].ToString());
                    insertScore.Score = 0;
                    insertScore.sscore = 0;
                    insertScore.mscore = 0;
                    insertScore.jscore = 0;
                    insertScore.InsertByProc();//调用InsertByProc方法向数据库中插入成绩
                    Label13.Visible = false;
                    Image1.Visible = false;
                    InitData(); //调用方法
                    lb_sjmc.Text = Session["PaperName"].ToString();
                    lb_sjbh.Text = Session["PaperID"].ToString();
                    DataBaseAccess.Conn_database(DataBaseAccess.strconn);
                    string sqlstr1 = "select Score from TaoTi where PaperID='" + Session["PaperID"] + "'";
                    lb_sjzf.Text = DataBaseAccess.Select(sqlstr1).Rows[0][0].ToString();
                    string sqlstr2 = "select JoinTime from TaoTi where PaperID='" + Session["PaperID"] + "'";
                    lb_cjsj.Text = DataBaseAccess.Select(sqlstr2).Rows[0][0].ToString();
                    string sqlstr3 = "select AnswerTime from TaoTi where PaperID='" + Session["PaperID"] + "'";
                    lb_dtsj.Text = DataBaseAccess.Select(sqlstr3).Rows[0][0].ToString();
                    //倒计时           
                    int h = int.Parse(DateTime.Now.ToString("HH"));//取出时
                    int m = int.Parse(DateTime.Now.ToString("mm"));//取出分钟
                    int x = int.Parse(lb_dtsj.Text);//答题时间
                    int t = m + x;
                    if (t >= 60) //00
                    {
                        double a = t / 60;
                        const double EPS = 1e-10;
                        if (a - (double)((int)a) < EPS)
                        {
                            //整数
                            h += ((int)a); //小时加
                            lb_djs.Text = DateTime.Now.ToString("yyyy/MM/dd " + h + ":mm:ss");//倒计时的时间  
                        }
                        else
                        {
                            h += ((int)a); //小时加
                            double b = a - (double)((int)a);
                            double c = b * 60;
                            lb_djs.Text = DateTime.Now.ToString("yyyy/MM/dd " + h + ":" + (int)c + ":ss");//倒计时的时间 
                        }
                    }
                    else
                    {
                        lb_djs.Text = DateTime.Now.ToString("yyyy/MM/dd HH:" + t + ":ss");//倒计时的时间    
                    }
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('Session已过期，或已丢失,请重新登录后再进行尝试！');</script>");
                }
            }           
        }
    }

    protected void InitData() //读取试题
    {
        SqlParameter[] Params1 = new SqlParameter[2];
        Datacon DB = new Datacon();
        int paperID = int.Parse(Session["PaperID"].ToString());
        Params1[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params1[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "单选题");            //题目类型        
        DataSet ds1 = DB.GetDataSet("Proc_PaperDetail", Params1);
        GridView1.DataSource = ds1;
        GridView1.DataBind();
        ((Label)GridView1.HeaderRow.FindControl("Label27")).Text = ((Label)GridView1.Rows[0].FindControl("Label4")).Text;

        SqlParameter[] Params2 = new SqlParameter[2];
        Params2[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params2[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "多选题");            //题目类型        
        DataSet ds2 = DB.GetDataSet("Proc_PaperDetail", Params2);
        GridView2.DataSource = ds2;
        GridView2.DataBind();
        ((Label)GridView2.HeaderRow.FindControl("Label28")).Text = ((Label)GridView2.Rows[0].FindControl("Label8")).Text;

        SqlParameter[] Params3 = new SqlParameter[2];
        Params3[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
        Params3[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "判断题");            //题目类型        
        DataSet ds3 = DB.GetDataSet("Proc_PaperDetail", Params3);
        GridView3.DataSource = ds3;
        GridView3.DataBind();
        ((Label)GridView3.HeaderRow.FindControl("Label29")).Text = ((Label)GridView3.Rows[0].FindControl("Label12")).Text;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e) //提交
    {
        int score = 0;
        //显示答案 并 判断用户选择的答案是否正确
        Label lb_Answer_1 = null;
        RadioButton rb_1 = null;
        RadioButton rb_2 = null;
        RadioButton rb_3 = null;
        RadioButton rb_4 = null;
        int tsinglemark = 0;
        int singlemark = int.Parse(((Label)GridView1.Rows[0].FindControl("Label4")).Text);//取出单选题的每题分值
        for (int i = 0; i < GridView1.Rows.Count; i++) //对单选题每题进行判断用户选择答案
        {
            lb_Answer_1 = (Label)GridView1.Rows[i].FindControl("Label3") as Label;
            lb_Answer_1.Visible = true;
            rb_1 = (RadioButton)GridView1.Rows[i].FindControl("RadioButton1") as RadioButton;
            rb_2 = (RadioButton)GridView1.Rows[i].FindControl("RadioButton2") as RadioButton;
            rb_3 = (RadioButton)GridView1.Rows[i].FindControl("RadioButton3") as RadioButton;
            rb_4 = (RadioButton)GridView1.Rows[i].FindControl("RadioButton4") as RadioButton;
            string str = "";
            if (rb_1.Checked)
            {
                str = "A";
            }
            else if (rb_2.Checked)
            {
                str = "B";
            }
            else if (rb_3.Checked)
            {
                str = "C";
            }
            else if (rb_4.Checked)
            {
                str = "D";
            }
            if (lb_Answer_1.Text.Trim() == str)//将用户选择结果和答案进行比较
            {
                tsinglemark = tsinglemark + singlemark;
            }
            else
            {
                //错误答案显示为红色
                lb_Answer_1.ForeColor = Color.Red; 
            }
        }

        //显示答案 并 判断用户选择的答案是否正确
        Label lb_Answer_2 = null;
        CheckBox cb_1 = null;
        CheckBox cb_2 = null;
        CheckBox cb_3 = null;
        CheckBox cb_4 = null;
        int tmultimark = 0;
        int multimark = int.Parse(((Label)GridView2.Rows[0].FindControl("Label8")).Text);//取出多选题每题分值
        for (int j = 0; j < GridView2.Rows.Count; j++) //对多选题每题进行判断用户选择答案
        {
            lb_Answer_2 = (Label)GridView2.Rows[j].FindControl("Label7") as Label;
            lb_Answer_2.Visible = true;
            cb_1 = (CheckBox)GridView2.Rows[j].FindControl("CheckBox1") as CheckBox;
            cb_2 = (CheckBox)GridView2.Rows[j].FindControl("CheckBox2") as CheckBox;
            cb_3 = (CheckBox)GridView2.Rows[j].FindControl("CheckBox3") as CheckBox;
            cb_4 = (CheckBox)GridView2.Rows[j].FindControl("CheckBox4") as CheckBox;
            string str = "";
            if (cb_1.Checked)
            {
                str += "A";
            }
            if (cb_2.Checked)
            {
                str += "B";
            }
            if (cb_3.Checked)
            {
                str += "C";
            }
            if (cb_4.Checked)
            {
                str += "D";
            }
            if (lb_Answer_2.Text.Trim() == str)//将用户选择结果和答案进行比较
            {
                tmultimark = tmultimark + multimark;
            }
            else //用户选择结果跟答案不一致时
            {
                //错误答案显示为红色
                lb_Answer_2.ForeColor = Color.Red; 
            }
        }

        //显示答案 并 判断用户选择的答案是否正确
        Label lb_Answer_3 = null;
        int tjudgemark = 0;
        int judgemark = int.Parse(((Label)GridView3.Rows[0].FindControl("Label12")).Text);//取出判断题每题分值
        for (int k = 0; k < GridView3.Rows.Count; k++) //对判断题每题进行判断用户选择答案
        {
            lb_Answer_3 = (Label)GridView3.Rows[k].FindControl("Label11") as Label;
            lb_Answer_3.Visible = true;
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView3.Rows[k].FindControl("RadioButtonList1") as RadioButtonList;
            bool j;
            if (RadioButtonList1.SelectedValue == "true")
            {
                j = true;
                if (j == bool.Parse(lb_Answer_3.Text.Trim()))
                {
                    tjudgemark = tjudgemark + judgemark;
                }
                else
                {
                    //错误答案显示为红色
                    lb_Answer_3.ForeColor = Color.Red; 
                }
            }
            if (RadioButtonList1.SelectedValue == "false")
            {
                j = false;
                if (j == bool.Parse(lb_Answer_3.Text.Trim()))
                {
                    tjudgemark = tjudgemark + judgemark;
                }
                else
                {
                    //错误答案显示为红色
                    lb_Answer_3.ForeColor = Color.Red; 
                }
            }
            if(RadioButtonList1.SelectedValue == "") //没有进行选择时
            {
                //错误答案显示为红色
                lb_Answer_3.ForeColor = Color.Red; 
            }
        }
        //修改成绩
        score = tjudgemark + tmultimark + tsinglemark;
        DataBaseAccess.Conn_database(DataBaseAccess.strconn);
        string strUp = "update Score set Score=@Score,sscore=@sscore,mscore=@mscore,jscore=@jscore where UserID=@UserID and PaperID=@PaperID";
        SqlParameter[] spar = { new SqlParameter("@Score", score), 
                                new SqlParameter("@sscore",tsinglemark),
                                new SqlParameter("@mscore", tmultimark),
                                new SqlParameter("@jscore", tjudgemark),
                                new SqlParameter("@UserID", Session["ID"].ToString()),
                                new SqlParameter("@PaperID",int.Parse(Session["PaperID"].ToString()))};
        DataBaseAccess.CmdExecuteNonQuery(strUp, spar);        
        Label13.Visible = true;
        Image1.Visible = true;
        Label13.Text = score.ToString() + "分";
        strFalg = "false";
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e) //退出
    {
        ImageButton1_Click(sender, e);
        Response.Redirect("user_KSGZ.aspx");
    }







}