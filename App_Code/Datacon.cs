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
using System.ComponentModel;
using System.Diagnostics;
using System.Data.SqlClient;
using MyWeb.DataAccessHelper;
//namespace MyWeb.DataAccessLayer
//{
    public class Datacon
    {
        public SqlConnection getcon()
        {
            //请修改此处的连接代码
            string strCon = ConfigurationSettings.AppSettings["connectionstring"].ToString();
            SqlConnection sqlCon = new SqlConnection(strCon);
            return sqlCon;
        }

        public bool eccom(string sqlstr)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlCommand cmd = new SqlCommand(sqlstr, cn);
            try
            {
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                cn.Close();
            }
        }
        public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value)
        {
            SqlParameter Param;

            if (Size > 0)
                Param = new SqlParameter(ParamName, DbType, Size);
            else Param = new SqlParameter(ParamName, DbType);

            Param.Direction = Direction;

            if (Value != null)
                Param.Value = Value;

            return Param;
        }
        public SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value)
        {
            return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
        }


        public void bind(GridView gv, string sqlstr)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlDataAdapter mydata = new SqlDataAdapter(sqlstr, cn);
            DataSet mydataset = new DataSet();
            mydata.Fill(mydataset);
            gv.DataSource = mydataset;
            gv.DataBind();
            cn.Close();

        }


        public bool ecDropDownList(DropDownList DDL, string sqlstr, string DTF, string DVF)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlDataAdapter mydata = new SqlDataAdapter(sqlstr, cn);
            DataSet mydataset = new DataSet();
            mydata.Fill(mydataset);
            DDL.DataSource = mydataset;
            DDL.DataTextField = DTF;
            DDL.DataValueField = DVF;
            try
            {
                DDL.DataBind();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                cn.Close();
            }
        }


        public void bindinfostring(GridView gv, string sqlstr, string DNK)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlDataAdapter mydata = new SqlDataAdapter(sqlstr, cn);
            DataSet mydataset = new DataSet();
            mydata.Fill(mydataset);
            gv.DataSource = mydataset;
            gv.DataKeyNames = new string[] { DNK };
            gv.DataBind();
            cn.Close();
        }


        public SqlDataReader ExceRead(string SqlCom)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlCommand sqlcom = new SqlCommand(SqlCom, cn);
            SqlDataReader read = sqlcom.ExecuteReader();
            return read;
        }
        public DataSet GetDataSet(string ProcName)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(ProcName, cn);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            cn.Close();
            return dataset;
        }
        public DataSet GetDataSet(string ProcName, SqlParameter[] Params)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlCommand Cmd = CreateCommand(ProcName, Params);
            SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            cn.Close();
            return dataset;
        }
        public DataSet GetDataSetSql(string XSqlString)
        {
            SqlConnection cn = this.getcon();
            cn.Open();

            SqlDataAdapter Adapter = new SqlDataAdapter(XSqlString, cn);
            DataSet Ds = new DataSet();
            Adapter.Fill(Ds);
            cn.Close();
            return Ds;
        }
        public int Insert(string XSqlString)
        {
            int Count = -1;
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlCommand cmd = new SqlCommand(XSqlString, cn);
            Count = cmd.ExecuteNonQuery();
            cn.Close();
            return Count;
        }
        public int GetIDInsert(string XSqlString)
        {
            int Count = -1;
            SqlConnection con = this.getcon();
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = XSqlString;
            if (com.ExecuteNonQuery() > 0)
            {
                con.Close();
                con.Open();
                com.CommandText = "select max(PaperID) as max from TaoTi";
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    Count = int.Parse(dr["max"].ToString());
                }
            }
            con.Close();
            return Count;
        }

       
        private SqlCommand CreateCommand(string ProcName, SqlParameter[] Prams)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlCommand Cmd = new SqlCommand(ProcName, cn);
            Cmd.CommandType = CommandType.StoredProcedure;

            if (Prams != null)
            {
                foreach (SqlParameter Parameter in Prams)
                    Cmd.Parameters.Add(Parameter);
            }

            return Cmd;
        }

        public int RunProc(string ProcName)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            int Count = -1;
            SqlCommand Cmd = CreateCommand(ProcName, null);
            Count = Cmd.ExecuteNonQuery();
            cn.Close();
            return Count;
        }
        public int RunProc(string ProcName, SqlParameter[] Params)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            int Count = -1;
            SqlCommand Cmd = CreateCommand(ProcName, Params);
            Count = Cmd.ExecuteNonQuery();
            cn.Close();
            return Count;
        }
        public SqlDataReader RunProcGetReader(string ProcName, SqlParameter[] Params)
        {
            SqlCommand Cmd = CreateCommand(ProcName, Params);
            return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        public int RunProcGetCount(string ProcName, SqlParameter[] Params)
        {
            SqlConnection cn = this.getcon();
            cn.Open();
            SqlCommand Cmd = CreateCommand(ProcName, Params);
            string SCount;
            SCount = Cmd.ExecuteScalar().ToString().Trim();
            if (SCount == "")
                SCount = "0";
            cn.Close();
            return Convert.ToInt32(SCount);
        }
        


        public void ecDropDownList(RadioButtonList rblAnswer, string p, string p_2, string p_3)
        {
            throw new NotImplementedException();
        }
    }

