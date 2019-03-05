using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;

using MyWeb.DataAccessHelper;


namespace MyWeb.BusinessLogicLayer
{
    //用户类
    public class Scores
    {
        #region 私有成员
        private int _ID;
        private string _userID;
        private int _paperID;
        private int _score;
        //private DateTime _examtime;//考试时间
        //private DateTime _judgetime;  //评阅时间   
        //private string _pingyu;  //评阅时间    

        #endregion 私有成员

        #region 属性

        public int ID
        {
            set
            {
                this._ID = value;
            }
            get
            {
                return this._ID;
            }
        }
        public string UserID
        {
            set
            {
                this._userID = value;
            }
            get
            {
                return this._userID;
            }
        }
        public int PaperID
        {
            set
            {
                this._paperID = value;
            }
            get
            {
                return this._paperID;
            }
        }
        public int Score
        {
            set
            {
                this._score = value;
            }
            get
            {
                return this._score;
            }
        }
        //public DateTime ExamTime
        //{
        //    set
        //    {
        //        this._examtime = value;
        //    }
        //    get
        //    {
        //        return this._examtime;
        //    }
        //}

        public int sscore
        {
            set
            {
                this._sscore = value;
            }
            get
            {
                return this._sscore;
            }
        }
        public int mscore
        {
            set
            {
                this._mscore = value;
            }
            get
            {
                return this._mscore;
            }
        }
        public int jscore
        {
            set
            {
                this._jscore = value;
            }
            get
            {
                return this._jscore;
            }
        }
        #endregion 属性

        #region 方法

        //向Score表中添加成绩
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[6];

            Datacon DB = new Datacon();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 20, UserID);
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, PaperID);
            Params[2] = DB.MakeInParam("@Score", SqlDbType.Int, 4, Score);
            Params[3] = DB.MakeInParam("@sscore", SqlDbType.Int, 4, sscore);
            Params[4] = DB.MakeInParam("@mscore", SqlDbType.Int, 4, mscore);
            Params[5] = DB.MakeInParam("@jscore", SqlDbType.Int, 4, jscore);

            int Count = -1;
            Count = DB.RunProc("Proc_ScoreAdd", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        public bool CheckScore(string XUserID, int XPaperID)
        {
            SqlParameter[] Params = new SqlParameter[2];
            Datacon DB = new Datacon();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 20, XUserID);
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, XPaperID);

            SqlDataReader DR = DB.RunProcGetReader("Proc_ScoreDetail", Params);
            if (!DR.Read())
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //删除成绩
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      删除成功：返回True；
        //      删除失败：返回False；
        public bool DeleteByProc(int SID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            Datacon DB = new Datacon();

            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, SID);               //成绩编号          

            int Count = -1;
            Count = DB.RunProc("Proc_ScoreDelete", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //查询所用成绩
        //不需要参数
        



        #endregion 方法

        public int _jscore { get; set; }

        public int _sscore { get; set; }

        public int _mscore { get; set; }
    }
}