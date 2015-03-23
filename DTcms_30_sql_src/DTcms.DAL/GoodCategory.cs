using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;
namespace DTcms.DAL
{
    public class GoodCategory
    {
        private string databaseprefix; //数据库表名前缀
        public GoodCategory(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        public List<Model.GoodCategory> GetList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from GoodCategory");

            Model.GoodCategory model = new Model.GoodCategory();
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            List<Model.GoodCategory> list = null;
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                list = Common.DataTableToList.List<Model.GoodCategory>(ds.Tables[0]);
            }
            return list;
        }
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"select c.ClientName,g.GoodCategoryName,g.GoodCategoryID,g.CreateTime,g.Remark from GoodCategory g with(nolock) join Client c with(nolock)
on g.ClientID=c.ClientID
");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }
        public int Add(Model.GoodCategory Model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" insert GoodCategory(UniqueID,ClientID,GoodCategoryName,Operator,BrokerageRatio,IntegralRatio,CreateTime,State,Remark)");
            strSql.Append(" values (");
            strSql.Append("@UniqueID,@ClientID,@GoodCategoryName,@Operator,@BrokerageRatio,@IntegralRatio,@CreateTime,@State,@Remark)");
            SqlParameter[] parameters = {
                    new SqlParameter("@UniqueID", SqlDbType.UniqueIdentifier),
                    new SqlParameter("@ClientID", SqlDbType.Int,8),
                    new SqlParameter("@GoodCategoryName", SqlDbType.NVarChar,100),
                    new SqlParameter("@Operator", SqlDbType.Int,8),
                    //new SqlParameter("@GoodBarCode", SqlDbType.VarChar,10),
                    new SqlParameter("@BrokerageRatio", SqlDbType.Money),
                    new SqlParameter("@IntegralRatio", SqlDbType.Int,8),
                    //new SqlParameter("@Standard", SqlDbType.Int,8),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime),
                    new SqlParameter("@State", SqlDbType.Int,8),
                    new SqlParameter("@Remark", SqlDbType.NText)};
            parameters[0].Value = Model.UniqueID;
            parameters[1].Value = Model.ClientID;
            parameters[2].Value = Model.GoodCategoryName;
            parameters[3].Value = Model.Operator;
            //parameters[4].Value = Model.GoodBarCode;
            parameters[4].Value = Model.BrokerageRatio;
            parameters[5].Value = Model.IntegralRatio;
            //parameters[7].Value = Model.Standard;
            parameters[6].Value = Model.CreateTime;
            parameters[7].Value = Model.State;
            parameters[8].Value = Model.Remark;
            object obj = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        public int Edit(Model.GoodCategory Model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" update GoodCategory set ClientID=@ClientID,GoodCategoryName=@GoodCategoryName,Operator=@Operator,CreateTime=@CreateTime,State=@State,Remark=@Remark where GoodCategoryID=@GoodCategoryID");
            SqlParameter[] parameters = {
                    new SqlParameter("@GoodCategoryID", SqlDbType.Int,8),
                    new SqlParameter("@ClientID", SqlDbType.Int,8),
                    new SqlParameter("@GoodCategoryName", SqlDbType.NVarChar,100),
                    new SqlParameter("@Operator", SqlDbType.Int,8),
                    //new SqlParameter("@GoodBarCode", SqlDbType.VarChar,10),
                    //new SqlParameter("@BrokerageRatio", SqlDbType.Money),
                    //new SqlParameter("@IntegralRatio", SqlDbType.Int,8),
                    //new SqlParameter("@Standard", SqlDbType.Int,8),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime),
                    new SqlParameter("@State", SqlDbType.Int,8),
                    new SqlParameter("@Remark", SqlDbType.NText)};
            parameters[0].Value = Model.GoodCategoryID;
            parameters[1].Value = Model.ClientID;
            parameters[2].Value = Model.GoodCategoryName;
            parameters[3].Value = Model.Operator;
            //parameters[4].Value = Model.GoodBarCode;
            //parameters[5].Value = Model.BrokerageRatio;
            //parameters[6].Value = Model.IntegralRatio;
            //parameters[7].Value = Model.Standard;
            parameters[4].Value = Model.CreateTime;
            parameters[5].Value = Model.State;
            parameters[6].Value = Model.Remark;
            object obj = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        public Model.GoodCategory GetModel(string GoodCategoryID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from GoodCategory with(nolock) where GoodCategoryID=@GoodCategoryID");
            SqlParameter[] parameters = {
                    new SqlParameter("@GoodCategoryID", SqlDbType.VarChar,20)};
            parameters[0].Value = GoodCategoryID;
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            Model.GoodCategory model = Common.DataTableToList.List<Model.GoodCategory>(ds.Tables[0])[0];
            if (model == null)
            {
                return null;
            }
            else
            {
                return model;
            }
        }
        public bool Delete(string GoodCategory)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from GoodCategory ");
            strSql.Append(" where GoodCategoryID in (" + GoodCategory + ")");
            int rows = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public DataSet GetGoodCategoryByName(string GoodCategoryName)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from GoodCategory with(nolock) where GoodCategoryName=@GoodCategoryName");
            SqlParameter[] parameters = {
                    new SqlParameter("@GoodCategoryName", SqlDbType.NVarChar,100)};
            parameters[0].Value = GoodCategoryName;
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }
    }
}
