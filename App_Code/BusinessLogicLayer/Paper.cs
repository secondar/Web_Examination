using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;

using MyWeb.DataAccessHelper;


namespace MyWeb.BusinessLogicLayer
{
    //用户类
    public class Paper
    {
        #region 私有成员
        private int _paperID;                                               //试卷编号
        private int _c_id;                                              //科目编号 
        private string _paperName;                                          //试卷名称  
        private byte _paperState;                                           //试卷状态
        private string _type;
        private string _userid;
        private string _state;

        #endregion 私有成员

        #region 属性

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
        public int c_id
        {
            set
            {
                this._c_id = value;
            }
            get
            {
                return this._c_id;
            }
        }
        public string PaperName
        {
            set
            {
                this._paperName = value;
            }
            get
            {
                return this._paperName;
            }
        }
        public byte PaperState
        {
            set
            {
                this._paperState = value;
            }
            get
            {
                return this._paperState;
            }
        }
        public string Type
        {
            set
            {
                this._type = value;
            }
            get
            {
                return this._type;
            }
        }
        public string UserID
        {
            set
            {
                this._userid = value;
            }
            get
            {
                return this._userid;
            }
        }
        public string state
        {
            set
            {
                this._state = value;
            }
            get
            {
                return this._state;
            }
        }

        #endregion 属性

        #region 方法

        //向Paper表中添加试卷信息(采用存储过程)
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[3];
            Datacon DB = new Datacon();

            Params[0] = DB.MakeInParam("@c_id", SqlDbType.Int, 4, c_id);               //科目编号
            Params[1] = DB.MakeInParam("@PaperName", SqlDbType.VarChar, 200, PaperName);       //试卷名称            
            Params[2] = DB.MakeInParam("@PaperState", SqlDbType.Bit, 1, PaperState);            //试卷状态            

            int Count = -1;
            Count = DB.RunProc("Proc_PaperAdd", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //更新试卷信息
        public bool UpdateByProc(int PID)
        {
            SqlParameter[] Params = new SqlParameter[2];

            Datacon DB = new Datacon();

            Params[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, PID);                      //试卷编号                       
            Params[1] = DB.MakeInParam("@PaperState", SqlDbType.Bit, 1, PaperState);            //试卷状态

            int Count = -1;
            Count = DB.RunProc("Proc_PaperModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //更新试卷是否评阅的状态
        public bool UpdateByProc(string XUserID, int XPaperID, string Xstate)
        {
            SqlParameter[] Params = new SqlParameter[3];

            Datacon DB = new Datacon();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, XUserID);
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, XPaperID);
            Params[2] = DB.MakeInParam("@state", SqlDbType.VarChar, 50, Xstate);

            int Count = -1;
            Count = DB.RunProc("Proc_UserAnswerStateModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }

   
      
        #endregion 方法
    }
}