using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// DataBaseAccess 的摘要说明
/// </summary>
public static class DataBaseAccess
{
    //读取出Web.config文件中定义的变量的值
    public static string strconn = ConfigurationSettings.AppSettings["connectionstring"].ToString();

    #region 定义变量

    //表示 SQL Server 数据库的一个打开的连接,若要确保连接始终关闭，请在 using 块内部打开连接。这样可确保在代码退出代码块时自动关闭连接。 
    private static SqlConnection conn = null;

    //表示要对 SQL Server 数据库执行的一个 Transact-SQL 语句或存储过程。
    private static SqlCommand cmd = null;

    //可以用SqlDataReader类对象从SQL Server数据库中读取行,DataReader对象允许你以向前的，只读的方式读取数据
    private static SqlDataReader dr = null;

    //DataTable 是一个临时保存数据的网格虚拟表(表示内存中数据的一个表)。
    private static DataTable dt = null;

    //SqlDataAdapter是 DataSet和 SQL Server之间的桥接器。SqlDataAdapter通过对数据源使用适当的Transact-SQL语句映射 Fill（它可填充DataSet中的数据以匹配数据源中的数据）和 Update（它可更改数据源中的数据以匹配 DataSet中的数据）来提供这一桥接。当SqlDataAdapter填充 DataSet时，它为返回的数据创建必需的表和列（如果这些表和列尚不存在）。
    //private static SqlDataAdapter da = null;

    //因为DataSet可以看做是内存中的数据库，也因此可以说DataSet是数据表的集合，它可以包含任意多个数据表（DataTable），而且每一 DataSet中的数据表（DataTable)对应一个数据源中的数据表（Table）或是数据视图（View）。
    //private static DataSet ds = null;

    #endregion


    #region 创建数据库连接

    /// <summary>
    /// 创建数据库连接
    /// </summary>
    /// <param name="strconn">连接数据库的字符串</param>
    public static void Conn_database(string strconn)
    {
        conn = new SqlConnection(strconn);//定义连接对象并实例化（实例化时需要提供连接字符串作为参数）
    }

    #endregion


    #region 判断数据库是否已经打开，如果没打开则打开数据库,并返回该数据库。

    /// <summary>
    /// 判断数据库是否已经打开，如果没打开则打开数据库,并返回该数据库。
    /// </summary>
    /// <returns>返回该数据库</returns>
    public static SqlConnection Open_database()
    {
        if (conn.State == ConnectionState.Closed)//判断数据库是否已经打开，如果没打开则打开数据库
        {
            conn.Open(); //打开数据库
        }
        return conn;
    }

    #endregion


    #region 执行查询sql语句

    /// <summary>
    /// 执行查询sql语句并返回一个表
    /// </summary>
    /// <param name="strSelect">查询sql语句</param>
    /// <returns>返回一个表</returns>
    public static DataTable Select(string strSelect)
    {
        dt = new DataTable();
        using (cmd = new SqlCommand(strSelect, Open_database()))
        {
            using (dr = cmd.ExecuteReader())
            {
                dt.Load(dr);
            }
        }
        conn.Close();//关闭数据库
        return dt;
    }


    /// <summary>
    /// 执行查询带参的sql语句并返回一个表
    /// </summary>
    /// <param name="strSelect">查询sql语句</param>
    /// <param name="par">sql语句中的参数</param>
    /// <returns>返回一个表</returns>
    public static DataTable Select(string strSelect, SqlParameter par)
    {
        dt = new DataTable();
        using (cmd = new SqlCommand(strSelect, Open_database()))
        {
            cmd.Parameters.Add(par);
            using (dr = cmd.ExecuteReader())
            {
                dt.Load(dr);
            }
        }
        conn.Close();
        cmd.Parameters.Clear(); //将使用完之后的Command命令的Parameters集合清空
        return dt;
    }

    public static DataTable Select(string strSelect, SqlParameter[] par)
    {
        dt = new DataTable();
        using (cmd = new SqlCommand(strSelect, Open_database()))
        {
            cmd.Parameters.AddRange(par);
            using (dr = cmd.ExecuteReader())
            {
                dt.Load(dr);
            }
        }
        conn.Close();
        cmd.Parameters.Clear(); //将使用完之后的Command命令的Parameters集合清空
        return dt;
    }

    #endregion


    #region 执行无参的增，删，改sql语句

    /// <summary>
    /// 执行无参的增，删，改sql语句,并返回所影响的行数
    /// </summary>
    /// <param name="sql">增，删，改的sql语句</param>
    /// <param name="par">sql语句中的参数</param>
    /// <returns>返回所影响的行数</returns>
    public static int CmdExecuteNonQuery(string sql)
    {
        int result = 0;//结果
        using (cmd = new SqlCommand(sql, Open_database()))
        {
            result = cmd.ExecuteNonQuery();
        }
        conn.Close();
        return result;
    }


    /// <summary>
    /// 执行带参的增，删，改sql语句,并返回所影响的行数
    /// </summary>
    /// <param name="sql">增，删，改的sql语句</param>
    /// <param name="par">sql语句中的参数</param>
    /// <returns>返回所影响的行数</returns>        
    public static int CmdExecuteNonQuery(string sql, SqlParameter par)
    {
        int result = 0;
        using (cmd = new SqlCommand(sql, Open_database()))
        {
            cmd.Parameters.Add(par);
            result = cmd.ExecuteNonQuery();
        }
        conn.Close();
        cmd.Parameters.Clear(); //将使用完之后的Command命令的Parameters集合清空
        return result;
    }

    public static int CmdExecuteNonQuery(string sql, SqlParameter[] par)
    {
        int result = 0;
        using (cmd = new SqlCommand(sql, Open_database()))
        {
            cmd.Parameters.AddRange(par);
            result = cmd.ExecuteNonQuery();
        }
        conn.Close();
        cmd.Parameters.Clear(); //将使用完之后的Command命令的Parameters集合清空
        return result;
    }

    #endregion


    /// <summary>
    /// 查找一张表中某个字段的值是否已存在，返回查询结果：若该值存在则返回false，不存在则返回true
    /// </summary>
    /// <param name="from">表名</param>
    /// <param name="str_ZiDuan">字段名</param>
    /// <param name="str_Zhi">需要查找的值</param>
    /// <returns>返回查询结果：若该值存在则返回false，不存在则返回true</returns>
    public static bool Select_ZiDuan(string from, string str_ZiDuan, string str_Zhi)
    {
        //查找一张表中某个字段的值是否已存在，返回查询结果：若该值存在则返回false，不存在则返回true
        bool result = false;
        if (Select("select " + str_ZiDuan.Trim() + " from " + from.Trim() + " where " + str_ZiDuan.Trim() + "=@x", new SqlParameter("@x", str_Zhi.Trim())).Rows.Count == 0)
        {
            result = true;
        }
        return result;
    }




}