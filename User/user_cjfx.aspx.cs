using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_user_cjfx : System.Web.UI.Page
{
    public string str_1 =string.Empty;//定义字符串用于存储考试的科目
    public string str_2 = string.Empty;//定义字符串用于存储考试的成绩

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
                    string str_sql = @"select Score.UserID as 学号,Student.Name as 姓名,Course.c_name as 科目,TaoTi.PaperName as 套题,Score.Score 成绩 
                                from Score,Student,TaoTi,Course
                                where Score.UserID=Student.ID and Score.PaperID=TaoTi.PaperID and TaoTi.c_id=Course.c_id
                                and Score.UserID='" + Session["ID"].ToString() + "'";
                    DataBaseAccess.Conn_database(DataBaseAccess.strconn);
                    int num = DataBaseAccess.Select(str_sql).Rows.Count; //行数
                    if (num != 0)
                    {
                        for (int i = 0; i < num; i++)
                        {

                            str_1 += ",'" + DataBaseAccess.Select(str_sql).Rows[i][2].ToString() + "(" + DataBaseAccess.Select(str_sql).Rows[i][3].ToString() + ")'";//科目
                        }
                        for (int j = 0; j < num; j++)
                        {
                            str_2 += "," + DataBaseAccess.Select(str_sql).Rows[j][4].ToString();//科目 //成绩
                        }
                        str_1 = str_1.Remove(0, 1);
                        str_2 = str_2.Remove(0, 1);
                        Label1.Visible = false;
                        Label2.Visible = false;
                    }
                    else
                    {
                        Label2.Visible = true;
                    }
                }
                catch
                {
                    Label1.Visible = true;
                }
            }          
        }
    }

   



}