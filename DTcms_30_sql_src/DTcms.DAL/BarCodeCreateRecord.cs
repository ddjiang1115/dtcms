using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    /// <summary>
    /// 条形码
    /// </summary>
    public class BarCodeCreateRecord
    {
        private string databaseprefix; //数据库表名前缀
        public BarCodeCreateRecord(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public void Add(Model.BarCodeCreateRecord barCodeCreateRecord, Model.BarCode BarCode)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" declare @BarCodeCreateRecordID int ");
            strSql.Append(" insert into BarCodeCreateRecord(");
            strSql.Append("UniqueID,GoodCount,RetrospectCode,Operator,batch,boxsum,CreateTime,Remark,GoodBarCode,BrokerageRatio,IntegralRatio)");
            strSql.Append(" values (");
            strSql.Append("newid(),@GoodCount,@RetrospectCode,@Operator,@batch,@boxsum,@CreateTime,@barCodeCreateRecordRemark,@GoodBarCode,@BrokerageRatio,@IntegralRatio)");
            strSql.Append(";set @BarCodeCreateRecordID= @@IDENTITY");
            int BoxSum=0;
            
            if (barCodeCreateRecord.GoodCount % barCodeCreateRecord.BoxSum==0)
            {
                BoxSum=barCodeCreateRecord.BoxSum;
            }
            else
            {
                BoxSum=barCodeCreateRecord.BoxSum+1;
            }
            for (int i = 0; i < BoxSum; i++)
            {
                int standard = barCodeCreateRecord.GoodCount / barCodeCreateRecord.BoxSum;
                string boxCode = new Common.Rule().GetBarCode(6);
                if(i==BoxSum-1&&barCodeCreateRecord.GoodCount % barCodeCreateRecord.BoxSum>0)
                {
                    standard = barCodeCreateRecord.GoodCount % barCodeCreateRecord.BoxSum;
                }
                for (int j = 0; j < standard; j++)
                {
                    strSql.Append(" insert BarCode(UniqueID,BoxCode,LogisticsCode,IntegralCode,CreateTime,Operator,State,BarCodeCreateRecordID)");
                    strSql.Append(" values (");
                    strSql.Append("newid(),");
                    strSql.Append("'" + boxCode + DateTime.Now.Year.ToString().Substring(2) + barCodeCreateRecord.GoodBarCode);
                    //strSql.Append("','" + barCodeCreateRecord.RetrospectCode + "'+" + "'" + DateTime.Now.Year.ToString().Substring(2) + "'" + "+right('000000'+CAST(cast((right(@IntegralCode,6)) as int)+" + sum + " as varchar(50)),6)");
                    strSql.Append("','" + barCodeCreateRecord.RetrospectCode + "'+" + "'" + DateTime.Now.Year.ToString().Substring(2) + "'+'" + new Common.Rule().GetBarCode(10));
                    strSql.Append("','" + new Common.Rule().GetBarCode(4) + DateTime.Now.Year.ToString().Substring(2) + new Common.Rule().GetBarCode(4));
                    strSql.Append("',@CreateTime,@Operator,@BarCodeState,@BarCodeCreateRecordID)");
                }
        }
            SqlParameter[] parameters = {
                    new SqlParameter("@GoodCount", SqlDbType.Int,8),
                    new SqlParameter("@RetrospectCode", SqlDbType.VarChar,50),
                    new SqlParameter("@Operator", SqlDbType.Int,8),
                     new SqlParameter("@Batch", SqlDbType.VarChar,50),
                     new SqlParameter("@boxsum", SqlDbType.Int,8),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime),                    
                    new SqlParameter("@barCodeCreateRecordRemark", SqlDbType.Text),
                    new SqlParameter("@GoodBarCode", SqlDbType.VarChar,10),
                    new SqlParameter("@BrokerageRatio", SqlDbType.Decimal),
                    new SqlParameter("@IntegralRatio", SqlDbType.Int,8),
                    new SqlParameter("@BarCodeState", SqlDbType.Int,8),
                   };
            parameters[0].Value = barCodeCreateRecord.GoodCount;
            parameters[1].Value = barCodeCreateRecord.RetrospectCode; 
            parameters[2].Value = barCodeCreateRecord.Operator; 
            parameters[3].Value = barCodeCreateRecord.Batch; 
            parameters[4].Value = barCodeCreateRecord.BoxSum; 
            parameters[5].Value = barCodeCreateRecord.CreateTime;
            parameters[6].Value = barCodeCreateRecord.Remark;
            parameters[7].Value = barCodeCreateRecord.GoodBarCode;
            parameters[8].Value = barCodeCreateRecord.BrokerageRatio;
            parameters[9].Value = barCodeCreateRecord.IntegralRatio;
            parameters[10].Value = BarCode.State;
            System.Collections.Hashtable ht = new System.Collections.Hashtable();
            ht.Add(strSql,parameters);
            DbHelperSQL.ExecuteSqlTran(ht);
        }
        /// <summary>
        /// 返回一个DataSet
        /// </summary>
        /// <returns></returns>
        public DataSet GetDS()
        {
            string strSql = string.Empty;
            strSql = @"select b.BoxCode from BarCode b join Client c on b.ClientID=c.ClientID
where b.BarCodeCreateRecordID=(select max(BarCodeCreateRecordID) from BarCodeCreateRecord) group by b.Boxcode";
            DataSet ds = DbHelperSQL.Query(strSql);
            if(ds!=null&&ds.Tables.Count>0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }
        public DataSet GetAll()
        {
            string strSql = string.Empty;
            strSql = @"select b.BarCodeCreateRecordID,b.BoxCode,b.LogisticsCode,b.IntegralCode,c.ClientName from BarCode b join Client c on b.ClientID=c.ClientID
where b.BarCodeCreateRecordID=(select max(BarCodeCreateRecordID) from BarCodeCreateRecord) order by b.BarCodeID";
            DataSet ds = DbHelperSQL.Query(strSql);
            if (ds != null && ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }
        
        public List<Model.BarCodeCreateRecord> GetList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from BarCodeCreateRecord ");

            Model.BarCodeCreateRecord model = new Model.BarCodeCreateRecord();
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            List<Model.BarCodeCreateRecord> list =Common.DataTableToList.List<Model.BarCodeCreateRecord>(ds.Tables[0]);
            return list;
        }
        public Model.BarCodeCreateRecord GetModel(string BarCodeCreateRecordID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from BarCodeCreateRecord where BarCodeCreateRecordID=@BarCodeCreateRecordID");
            SqlParameter[] parameters = {
                    new SqlParameter("@BarCodeCreateRecordID", SqlDbType.Int,8)};
            parameters[0].Value = BarCodeCreateRecordID;
            DataSet ds = DbHelperSQL.Query(strSql.ToString(),parameters);
            Model.BarCodeCreateRecord model = Common.DataTableToList.List<Model.BarCodeCreateRecord>(ds.Tables[0])[0];
            return model;
        }
        /// <summary>
        /// 更新多条数据
        /// </summary>
        public bool Delete(string BarCodeCreateRecordID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from BarCodeCreateRecord ");
            strSql.Append(" where BarCodeCreateRecordID in (" + BarCodeCreateRecordID + ")");
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

        public bool Update(string BarCodeCreateRecordID, string DownLoad)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update BarCodeCreateRecord set ");
            strSql.Append("DownLoad='" + DownLoad+"'");
            strSql.Append(" where BarCodeCreateRecordID=" + BarCodeCreateRecordID);
            //SqlParameter[] parameters = {
            //        new SqlParameter("@BarCodeCreateRecordID", SqlDbType.VarChar,100),
            //        new SqlParameter("@show", SqlDbType.Int,8)};
            //parameters[0].Value = BarCodeCreateRecordID;
            //parameters[1].Value = show;
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
        /// <summary>
        /// 获取最大值
        /// </summary>
        /// <returns></returns>
        public int GetMaxID()
        {
            string strSql = string.Empty;
            strSql = @"select max(BarCodeCreateRecordid) from BarCodeCreateRecord";
            object i = DbHelperSQL.GetSingle(strSql);
            if (i != null)
            {
                return Convert.ToInt32(i);
            }
            else
            {
                return 0;
            }
        }
        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"select b.BarCodeCreateRecordID,b.RetrospectCode,b.BoxSum,b.GoodCount,b.Operator,b.State,b.CreateTime,b.Remark,b.DownLoad,m.user_name
FROM BarCodeCreateRecord b with(nolock) join dt_manager m with(nolock) on b.Operator=m.id");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }
    }
}
