using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    public class BarCode
    {
        public List<Model.BarCode> GetList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from BarCode");
            //SqlParameter[] parameters = {
            //        new SqlParameter("@id", SqlDbType.Int,4)};
            //parameters[0].Value = id;

            Model.BarCodeCreateRecord model = new Model.BarCodeCreateRecord();
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            List<Model.BarCode> aa = Common.DataTableToList.List<Model.BarCode>(ds.Tables[0]);
            return aa;
        }
        /// <summary>
        /// 根据BarCodeCreateRecordID查询BarCode分组
        /// </summary>
        /// <param name="BarCodeCreateRecordID"></param>
        /// <returns></returns>
        public DataTable GetBarCodeGroupByBarCode(string BarCodeCreateRecordID)
        {
            string strSql = string.Empty;
            strSql = @"select b.BoxCode,c.ClientName from BarCode b join Client c on b.ClientID=c.ClientID
where b.BarCodeCreateRecordID=@BarCodeCreateRecordID group by b.BoxCode,c.ClientName";
            SqlParameter[] parameters = {
                    new SqlParameter("@BarCodeCreateRecordID", SqlDbType.VarChar,20) };
            parameters[0].Value = BarCodeCreateRecordID;
            DataSet ds = DbHelperSQL.Query(strSql, parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0];
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 根据BarCode获取BarCode表
        /// </summary>
        /// <param name="Barcode"></param>
        /// <returns></returns>
        public DataTable GetBarCodeByBarCode(string Barcode)
        {
            string strSql = string.Empty;
            strSql = @"select * from BarCode b join Client c on b.ClientID=c.ClientID
 where BoxCode=@BoxCode";
            SqlParameter[] parameters = {
                    new SqlParameter("@BoxCode", SqlDbType.VarChar,20) };
            parameters[0].Value = Barcode;
            DataSet ds = DbHelperSQL.Query(strSql, parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0];
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 根据BarCodeCreateRecordID获取BarCode表
        /// </summary>
        /// <param name="BarCodeCreateRecordID"></param>
        /// <returns></returns>
        public DataTable GetBarCodeByBarCodeCreateRecordID(string BarCodeCreateRecordID)
        {
            string strSql = string.Empty;
            strSql = @"select b.BarCodeCreateRecordID,b.BoxCode,b.LogisticsCode,b.IntegralCode,c.ClientName,g.GoodCategoryName from BarCode b join Client c on b.ClientID=c.ClientID
join BarCodeCreateRecord bcr on b.BarCodeCreateRecordID=bcr.BarCodeCreateRecordID
join GoodCategory g on bcr.GoodCategoryID=g.GoodCategoryID
where b.BarCodeCreateRecordID=@BarCodeCreateRecordID";
            SqlParameter[] parameters = {
                    new SqlParameter("@BarCodeCreateRecordID", SqlDbType.VarChar,20) };
            parameters[0].Value = BarCodeCreateRecordID;
            DataSet ds = DbHelperSQL.Query(strSql, parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0];
            }
            else
            {
                return null;
            }
        }
        public DataTable GetBarCodeCreateDetailByBarCodeCreateRecordID(string BarCodeCreateRecordID)
        {
            string strSql = string.Empty;
            strSql = @"select b.BoxCode,b.LogisticsCode,b.IntegralCode,br.BoxSum from BarCode b with(nolock)  join BarCodeCreateRecord br with(nolock) on b.BarCodeCreateRecordID=br.BarCodeCreateRecordID
where b.BarCodeCreateRecordID=@BarCodeCreateRecordID";
            SqlParameter[] parameters = {
                    new SqlParameter("@BarCodeCreateRecordID", SqlDbType.VarChar,20) };
            parameters[0].Value = BarCodeCreateRecordID;
            DataSet ds = DbHelperSQL.Query(strSql, parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0];
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"select b.BarCodeID,b.BoxCode,b.LogisticsCode,b.IntegralCode,o.CreateTime oCreateTime,p.CreateTime pCreateTime,i.CreateTime iCreateTime
from BarCode b 
join OutWarehouse o on b.LogisticsCode=o.LogisticsCode
join Promotion p on b.LogisticsCode=p.LogisticsCode
join IntegralExchange i on b.IntegralCode=i.IntegralCode");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        public DataSet QueryIntegralCode(string IntegralCode)
        {
            string strSql = string.Format(@"select  br.IntegralRatio,b.state,br.BrokerageRatio from BarCode b join BarCodeCreateRecord br
on b.BarCodeCreateRecordID=br.BarCodeCreateRecordID where b.IntegralCode='{0}'", IntegralCode);         
            return DbHelperSQL.Query(strSql);
        }
        public DataSet QueryIntegralRatioSum(string IntegralCode)
        {
            string strSql = string.Format(@"select  SUM(br.IntegralRatio) from BarCode b join BarCodeCreateRecord br
on b.BarCodeCreateRecordID=br.BarCodeCreateRecordID 
where b.IntegralCode in ({0})", IntegralCode);
            return DbHelperSQL.Query(strSql);
        }
        /// <summary>
        /// 根据物流码或者积分码修改状态
        /// </summary>
        /// <param name="key"></param>
        /// <param name="IntegralCode"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        public bool UpdateState(string key, int state)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.AppendFormat("Update BarCode set state={0} where IntegralCode='{1}' or  LogisticsCode='{1}'", state,key);
            return DbHelperSQL.ExecuteSql(strSql.ToString())>0;
           
        }
        /// <summary>
        /// 积分码或者物流码兑换积分
        /// </summary>
        /// <param name="IntegralRatio">积分比值</param>
        /// <param name="user_name">用户名</param>
        /// <param name="key">物流码或者积分码</param>
        /// <returns></returns>
        public bool UserChange(int IntegralRatio, string user_name, string IntegralCode,string IP)
        {
            List<CommandInfo> sqllist = new List<CommandInfo>();
            StringBuilder strSql1 = new StringBuilder();
            strSql1.Append(@"update dt_users set point=point+@IntegralRatio where user_name=@user_name");
            SqlParameter[] parameters1 = {
					new SqlParameter("@IntegralRatio", SqlDbType.Int,8),
                    new SqlParameter("@user_name", SqlDbType.NVarChar,100)};
            parameters1[0].Value = IntegralRatio;
            parameters1[1].Value = user_name;
            CommandInfo cmd = new CommandInfo(strSql1.ToString(), parameters1);
            sqllist.Add(cmd);

            StringBuilder strSql2 = new StringBuilder();
            strSql2.Append("Update BarCode set state=@state where IntegralCode=@IntegralCode");
            SqlParameter[] parameters2 = {
                    new SqlParameter("@state", SqlDbType.Int,8),
                    new SqlParameter("@IntegralCode", SqlDbType.VarChar,50)};
            parameters2[0].Value = 4;
            parameters2[1].Value = IntegralCode;
            cmd = new CommandInfo(strSql2.ToString(), parameters2);
            sqllist.Add(cmd);

            //StringBuilder strSql3 = new StringBuilder();
            //strSql3.Append(@"update dt_users set amount=amount+@BrokerageRatio where id=(select id from dt_users where user_name=@user_name)");
            //SqlParameter[] parameters3 = {
            //        new SqlParameter("@BrokerageRatio", SqlDbType.Int,8),
            //        new SqlParameter("@user_name", SqlDbType.NVarChar,100)};
            //parameters3[0].Value = BrokerageRatio;
            //parameters3[1].Value = user_name;
            //cmd = new CommandInfo(strSql3.ToString(), parameters3);
            //sqllist.Add(cmd);

            StringBuilder strSql4 = new StringBuilder();
            strSql4.Append(@"insert IntegralExchange(UniqueID,UserID,IntegralCode,IP,CreateTime)values(@UniqueID,(select id from dt_users where user_name=@user_name),@IntegralCode,@IP,@CreateTime)");
            SqlParameter[] parameters4 = {
					new SqlParameter("@UniqueID", SqlDbType.UniqueIdentifier),
                    new SqlParameter("@user_name", SqlDbType.NVarChar,50),
                    new SqlParameter("@IntegralCode", SqlDbType.VarChar,50),
                    new SqlParameter("@IP", SqlDbType.VarChar,50),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime)};
            parameters4[0].Value = Guid.NewGuid();
            parameters4[1].Value = user_name;
            parameters4[2].Value = IntegralCode;
            parameters4[3].Value = IP;
            parameters4[4].Value = DateTime.Now;
            cmd = new CommandInfo(strSql4.ToString(), parameters4);
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
        public bool Exists(string user_name, int state, string LogisticsCode)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from barCode where state=@state and Operator=(select id from dt_users where user_name=@user_name) and LogisticsCode=@LogisticsCode");
            SqlParameter[] parameters = {
                    new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@user_name", SqlDbType.VarChar,50),
                    new SqlParameter("@LogisticsCode", SqlDbType.VarChar,250)};
            parameters[0].Value = state;
            parameters[1].Value = user_name;
            parameters[2].Value = LogisticsCode;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }
        public bool ExistsOut(string LogisticsCode)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"select count(1) from OutWarehouse where LogisticsCode=@LogisticsCode
AND not EXISTS(select * from Promotion where LogisticsCode=@LogisticsCode)");
            SqlParameter[] parameters = {
                    new SqlParameter("@LogisticsCode", SqlDbType.VarChar,250)};
            parameters[0].Value = LogisticsCode;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }
        public DataTable GetBarCodeByLogisticsCode(string LogisticsCode)
        {
            string strSql = string.Empty;
            strSql = @"select u.user_name,p.CreateTime,br.BrokerageRatio,b.State,b.BoxCode,o.CreateTime as oCreateTime,p.LogisticsCode from Promotion p with(nolock)
join dt_manager u with(nolock) on p.Operator=u.id
join BarCode b with(nolock) on p.LogisticsCode=b.LogisticsCode 
join OutWarehouse o with(nolock) on p.LogisticsCode=o.LogisticsCode
join BarCodeCreateRecord br with(nolock) on b.BarCodeCreateRecordID=br.BarCodeCreateRecordID
where p.LogisticsCode=@LogisticsCode";
            SqlParameter[] parameters = {
                    new SqlParameter("@LogisticsCode", SqlDbType.VarChar,250) };
            parameters[0].Value = LogisticsCode;
            DataSet ds = DbHelperSQL.Query(strSql, parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0];
            }
            else
            {
                return null;
            }
        }
        public DataTable GetBarCodeByIntegralCode(string IntegralCode)
        {
            string strSql = string.Empty;
            strSql = @"select u.user_name,u.mobile,i.CreateTime,br.IntegralRatio,b.BoxCode,o.CreateTime as oCreateTime
from IntegralExchange i with(nolock)
join dt_users u with(nolock) on i.UserID=u.id
join BarCode b with(nolock) on i.IntegralCode=b.IntegralCode 
join BarCodeCreateRecord br with(nolock) on b.BarCodeCreateRecordID=br.BarCodeCreateRecordID
join OutWarehouse o with(nolock) on b.LogisticsCode=o.LogisticsCode
where i.IntegralCode=@IntegralCode";
            SqlParameter[] parameters = {
                    new SqlParameter("@IntegralCode", SqlDbType.VarChar,50) };
            parameters[0].Value = IntegralCode;
            DataSet ds = DbHelperSQL.Query(strSql, parameters);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0];
            }
            else
            {
                return null;
            }
        }
    }
}
