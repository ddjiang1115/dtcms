using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    public class t_address_town
    {
        public DataTable GetTownByCode(string cityCode)
        {
            string strSql = string.Empty;
            strSql = @"select * from t_address_town with(nolock) where cityCode=@cityCode";
            SqlParameter[] parameters = {
                    new SqlParameter("@cityCode", SqlDbType.Char,6)};
            parameters[0].Value = cityCode;
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
