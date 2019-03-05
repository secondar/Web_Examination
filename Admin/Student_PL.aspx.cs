using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Student_PL : System.Web.UI.Page
{
    Datacon dataconn = new Datacon();
    private static string fileName;
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

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int A = 0;//导入成功数
        string cunzai = "";

        try
        {
        string fileName1 = fileName;
        //根据路径打开一个Excel文件并将数据填充到DataSet中 
        //string strConn = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'", excelFilePath);
        string strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source = " + fileName1 + ";Extended Properties ='Excel 8.0;HDR=NO;IMEX=1'";//导入时包含Excel中的第一行数据，并且将数字和字符混合的单元格视为文本进行导入  
        OleDbConnection conn = new OleDbConnection(strConn);
        conn.Open();
        string strExcel = "select  * from   [sheet1$]";
        OleDbDataAdapter comm = new OleDbDataAdapter(strExcel, strConn);
        DataSet ds = new DataSet();


        
            for (int i = 1; i < GridView1.Rows.Count; i++)
            {
                try
                {
                    SqlDataReader read = dataconn.ExceRead("select * from Student where ID='" + GridView1.Rows[i].Cells[0].Text.ToString() + "'");
                    read.Read();
                    if (read.HasRows)
                    {
                        if (GridView1.Rows[i].Cells[0].Text.ToString() == read["id"].ToString())
                        {
                            //Response.Write("<script>alert('" + "ID：" + GridView1.Rows[i].Cells[0].Text.ToString() + "已存在！')</script>");
                            cunzai += GridView1.Rows[i].Cells[0].Text.ToString() + "、";
                        }
                    }
                    else if (GridView1.Rows[i].Cells[0].Text.ToString() == "" || GridView1.Rows[i].Cells[1].Text.ToString() == "" || GridView1.Rows[i].Cells[2].Text.ToString() == "" || GridView1.Rows[i].Cells[3].Text.ToString() == "")
                    {
                        Response.Write("<script>alert('" + "ID：" + GridView1.Rows[i].Cells[0].Text.ToString() + "信息不完整！" + "')</script>");
                    }
                    else
                    {
                        dataconn.eccom("insert into Student(ID,Name,PWD,Sex,JoinTime,Question,Answer,profession) values ('" + GridView1.Rows[i].Cells[0].Text.ToString() + "','" + GridView1.Rows[i].Cells[1].Text.ToString() + "','" + GridView1.Rows[i].Cells[2].Text.ToString() + "' ,'" + GridView1.Rows[i].Cells[3].Text.ToString() + "','" + DateTime.Now.ToString() + "','" + GridView1.Rows[i].Cells[4].Text.ToString() + "','" + GridView1.Rows[i].Cells[5].Text.ToString() + "','" + GridView1.Rows[i].Cells[6].Text.ToString() + "')");
                        A++;//导入成功

                    }

                }
                catch (Exception)
                {
                    Response.Write("<script>alert('" + "ID：" + GridView1.Rows[i].Cells[0].Text.ToString() + "  失败！" + "');</script>");
                }


            }

            conn.Close();
        }
        catch
        {
            Response.Write("<script>alert('失败');</script>");
        }
        

        Response.Write("<script>alert('成功导入:" + A + " 失败：" + (GridView1.Rows.Count - A - 1) + "');</script>");
        if (cunzai.Length > 1)
        {

            Response.Write("<script>alert('添加失败 ID：" + cunzai.Substring(0, cunzai.Length - 1) + "');</script>");
        }
        //删除导入文件
        DeleteFile(fileName);

    }
    //显示
    protected void Button2_Click(object sender, EventArgs e)
    {
        string extFileString = System.IO.Path.GetExtension(FuTest.PostedFile.FileName); /*获取文件扩展名*/
        //文件的格式
        if (extFileString == ".xlsx")
        {
            string path = System.AppDomain.CurrentDomain.BaseDirectory.ToString(); ;
            string saveFileName = this.MakeFileName(extFileString); /*根据扩展名生成文件名*/
            string imagePath = "~\\App_Data\\" + saveFileName;/*路径*/
            this.FuTest.PostedFile.SaveAs(Server.MapPath(imagePath));

            fileName = path + "App_Data\\" + saveFileName;
            string strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source = " + fileName + ";Extended Properties ='Excel 8.0;HDR=NO;IMEX=1'";//导入时包含Excel中的第一行数据，并且将数字和字符混合的单元格视为文本进行导入  
            OleDbConnection conn = new OleDbConnection(strConn);
            conn.Open();
            string strExcel = "select  * from   [sheet1$]";
            OleDbDataAdapter comm = new OleDbDataAdapter(strExcel, strConn);
            DataSet ds = new DataSet();

            comm.Fill(ds, "table1");
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            conn.Close();
        }
        else
        {
            Response.Write("<script>alert('请上传【.xlsx】格式文件！');</script>");
        }




    }

    /*根据当前系统时间生成一个文件名*/
    private string MakeFileName(string exeFileString)
    {
        System.DateTime now = System.DateTime.Now;
        int year = now.Year;
        int month = now.Month;
        int day = now.Day;
        int hour = now.Hour;
        int minute = now.Minute;
        int second = now.Second;

        string yearString = year.ToString();
        string monthString = month < 10 ? ("0" + month) : month.ToString();
        string dayString = day < 10 ? ("0" + day) : day.ToString();
        string hourString = hour < 10 ? ("0" + hour) : hour.ToString();
        string minuteString = minute < 10 ? ("0" + minute) : minute.ToString();
        string secondString = second < 10 ? ("0" + second) : second.ToString();

        /*根据当前时间的年月日时分秒生成文件名*/
        string fileName = yearString + monthString + dayString + hourString + minuteString + secondString + exeFileString;
        return fileName;
    }

    /// <summary>
    /// 根据路径删除文件
    /// </summary>
    /// <param name="path"></param>
    public void DeleteFile(string path)
    {
        FileAttributes attr = File.GetAttributes(path);
        if (attr == FileAttributes.Directory)
        {
            Directory.Delete(path, true);
        }
        else
        {
            File.Delete(path);
        }
    }



}