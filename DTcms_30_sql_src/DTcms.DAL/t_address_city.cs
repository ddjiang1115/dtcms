using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;
namespace DTcms.DAL
{
    public class t_address_city
    {
        public DataTable GetCityByCode(string provinceCode)
        {
            string strSql = string.Empty;
            strSql = @"select * from t_address_city with(nolock) where provinceCode=@provinceCode";
            SqlParameter[] parameters = {
                    new SqlParameter("@provinceCode", SqlDbType.Char,6)};
            parameters[0].Value = provinceCode;
            DataSet ds = DbHelperSQL.Query(strSql,parameters);
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
