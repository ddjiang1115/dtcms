using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    public class Promotion
    {
        public int Add(Model.Promotion Model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" insert Promotion(UniqueID,ClientID,LogisticsCode,Operator,BrokerageRatio,State,Remark)");
            strSql.Append(" values (");
            strSql.Append("@UniqueID,@ClientID,@LogisticsCode,@Operator,@BrokerageRatio,@State,@Remark)");
            SqlParameter[] parameters = {
                    new SqlParameter("@UniqueID", SqlDbType.UniqueIdentifier),
                    new SqlParameter("@ClientID", SqlDbType.Int,8),
                    new SqlParameter("@LogisticsCode", SqlDbType.VarChar,250),
                    new SqlParameter("@Operator", SqlDbType.Int,8),
                    new SqlParameter("@BrokerageRatio", SqlDbType.Money),
                    new SqlParameter("@State", SqlDbType.Int,8),
                    new SqlParameter("@Remark", SqlDbType.NText)};
            parameters[0].Value = Model.UniqueID;
            parameters[1].Value = Model.ClientID;
            parameters[2].Value = Model.LogisticsCode;
            parameters[3].Value = Model.Operator;
            parameters[4].Value = Model.BrokerageRatio;
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
        public void Add(DataTable dt, string tableName, Dictionary<string, string> dic)
        {
            try
            {
                DbHelperSQL.DataTableToSQLServer(dt, tableName, dic);
            }
            catch
            { 
                throw new Exception();
            }
        }
        public int Edit(Model.Client Model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" update Client set ClientName=@ClientName,Phone=@Phone,Email=@Email,ClientAddress=@ClientAddress,CreateTime=@CreateTime,State=@State,Remark=@Remark where ClientID=@ClientID");
            SqlParameter[] parameters = {
                    new SqlParameter("@ClientName", SqlDbType.NVarChar,150),
                    new SqlParameter("@Phone", SqlDbType.VarChar,20),
                    new SqlParameter("@Email", SqlDbType.VarChar,100),
                    new SqlParameter("@ClientAddress", SqlDbType.NVarChar,150),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime),
                    new SqlParameter("@State", SqlDbType.Int,8),
                    new SqlParameter("@Remark", SqlDbType.NText),
                    new SqlParameter("@ClientID",SqlDbType.Int,8)};
            parameters[0].Value = Model.ClientName;
            parameters[1].Value = Model.Phone;
            parameters[2].Value = Model.Email;
            parameters[3].Value = Model.ClientAddress;
            parameters[4].Value = Model.CreateTime;
            parameters[5].Value = Model.State;
            parameters[6].Value = Model.Remark;
            parameters[7].Value = Model.ClientID;
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
        public Model.Client GetModel(string id)
        {
            Model.Client model = null;
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from Client where ClientID=" + id);
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            if (ds != null && ds.Tables.Count > 0)
            {
                model = Common.DataTableToList.List<Model.Client>(ds.Tables[0])[0];
            }
            return model;
        }
        public List<Model.Promotion> GetList()
        {
            List<Model.Promotion> list = null;
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from Promotion");
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            if (ds != null && ds.Tables.Count > 0)
            {
                list = Common.DataTableToList.List<Model.Promotion>(ds.Tables[0]);
            }
            return list;
        }
        public bool Delete(string PromotionID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from Promotion ");
            strSql.Append(" where PromotionID in (" + PromotionID + ")");
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
        public bool UpdateState(string PromotionID,int State)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("Update Promotion set state="+State);
            strSql.Append(" where PromotionID in (" + PromotionID + ")");
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
        public bool Add(Model.Promotion Model,bool trans)
        {
            List<CommandInfo> sqllist = new List<CommandInfo>();
            StringBuilder strSql1 = new StringBuilder();
            strSql1.Append(" insert Promotion(UniqueID,LogisticsCode,Operator,BrokerageRatio,State,Remark,CreateTime)");
            strSql1.Append(" values (");
            strSql1.Append("@UniqueID,@LogisticsCode,@Operator,@BrokerageRatio,@State,@Remark,@CreateTime)");
            SqlParameter[] parameters1 = {
                    new SqlParameter("@UniqueID", SqlDbType.UniqueIdentifier),
                    new SqlParameter("@LogisticsCode", SqlDbType.VarChar,250),
                    new SqlParameter("@Operator", SqlDbType.Int,8),
                    new SqlParameter("@BrokerageRatio", SqlDbType.Money),
                    new SqlParameter("@State", SqlDbType.Int,8),
                    new SqlParameter("@Remark", SqlDbType.NText),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime)};
            parameters1[0].Value = Model.UniqueID;
            parameters1[1].Value = Model.LogisticsCode;
            parameters1[2].Value = Model.Operator;
            parameters1[3].Value = Model.BrokerageRatio;
            parameters1[4].Value = Model.State;
            parameters1[5].Value = Model.Remark;
            parameters1[6].Value = DateTime.Now;
            CommandInfo cmd = new CommandInfo(strSql1.ToString(), parameters1);
            sqllist.Add(cmd);
            StringBuilder strSql2 = new StringBuilder();
            strSql2.Append(" update barCode set state=3 where LogisticsCode=@LogisticsCode");
            SqlParameter[] parameters2 = { new SqlParameter("@LogisticsCode", SqlDbType.VarChar,250) };
            parameters2[0].Value = Model.LogisticsCode;
            cmd = new CommandInfo(strSql2.ToString(), parameters2);
            sqllist.Add(cmd);

            StringBuilder strSql3 = new StringBuilder();
            strSql3.Append(" update Promotion set state=3 where LogisticsCode=@LogisticsCode");
            SqlParameter[] parameters3 = { new SqlParameter("@LogisticsCode", SqlDbType.VarChar, 250) };
            parameters3[0].Value = Model.LogisticsCode;
            cmd = new CommandInfo(strSql3.ToString(), parameters3);
            sqllist.Add(cmd);
            int rowsAffected = DbHelperSQL.ExecuteSqlTran(sqllist);
            if (rowsAffected > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public DataSet GetListCheck(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"select m.user_name,p.LogisticsCode,br.BrokerageRatio,i.CreateTime,b.state,p.PromotionID from 
Promotion p join BarCode b on p.LogisticsCode=b.LogisticsCode
join BarCodeCreateRecord br on b.BarCodeCreateRecordID=br.BarCodeCreateRecordID
join dt_manager m on p.Operator=m.id
join IntegralExchange i on b.IntegralCode=i.IntegralCode");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"select p.PromotionID,p.LogisticsCode,b.State,p.CreateTime,c.ClientName,m.user_name from Promotion p join BarCode b on p.LogisticsCode=b.LogisticsCode
join GoodCategory g on b.GoodCategoryID=g.GoodCategoryID
join Client c on c.ClientID=g.ClientID
join dt_manager m on p.Operator=m.id");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }
    }
}
