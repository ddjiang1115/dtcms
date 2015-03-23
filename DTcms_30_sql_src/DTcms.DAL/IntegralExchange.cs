using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;
namespace DTcms.DAL
{
    public class IntegralExchange
    {
        public List<Model.IntegralExchange> GetList()
        {
            List<Model.IntegralExchange> list = null;
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from IntegralExchange");
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            if (ds != null && ds.Tables.Count > 0)
            {
                list = Common.DataTableToList.List<Model.IntegralExchange>(ds.Tables[0]);
            }
            return list;
        }
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"select i.IntegralExchangeid,u.user_name,i.IntegralCode,i.ip,i.CreateTime,br.IntegralRatio
from IntegralExchange i join dt_users u on i.userid=u.id
join BarCode b on i.IntegralCode=b.IntegralCode
join BarCodeCreateRecord br on b.BarCodeCreateRecordID=br.BarCodeCreateRecordID");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }
    }
}
