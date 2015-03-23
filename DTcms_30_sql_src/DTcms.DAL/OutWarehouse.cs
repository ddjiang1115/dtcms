using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;
using System.Collections.Generic;
using System.Text;

namespace DTcms.DAL
{
    public class OutWarehouse
    {
        public int Add(Model.Client Model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" insert Client(UniqueID,ClientAccount,ClientName,Phone,Email,ClientAddress,CreateTime,State,Remark)");
            strSql.Append(" values (");
            strSql.Append("@UniqueID,@ClientAccount,@ClientName,@Phone,@Email,@ClientAddress,@CreateTime,@State,@Remark)");
            SqlParameter[] parameters = {
                    new SqlParameter("@UniqueID", SqlDbType.UniqueIdentifier),
                    new SqlParameter("@ClientAccount", SqlDbType.NVarChar,100),
                    new SqlParameter("@ClientName", SqlDbType.NVarChar,150),
                    new SqlParameter("@Phone", SqlDbType.VarChar,20),
                    new SqlParameter("@Email", SqlDbType.VarChar,100),
                    new SqlParameter("@ClientAddress", SqlDbType.NVarChar,150),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime),
                    new SqlParameter("@State", SqlDbType.Int,8),
                    new SqlParameter("@Remark", SqlDbType.NText)};
            parameters[0].Value = Model.UniqueID;
            parameters[1].Value = Model.ClientAccount;
            parameters[2].Value = Model.ClientName;
            parameters[3].Value = Model.Phone;
            parameters[4].Value = Model.Email;
            parameters[5].Value = Model.ClientAddress;
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
        public List<Model.OutWarehouse> GetList()
        {
            List<Model.OutWarehouse> list = null;
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select * from OutWarehouse");
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            if (ds != null && ds.Tables.Count > 0)
            {
                list = Common.DataTableToList.List<Model.OutWarehouse>(ds.Tables[0]);
            }
            return list;
        }
        public bool Delete(string OutWarehouseID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from OutWarehouse ");
            strSql.Append(" where OutWarehouseID in (" + OutWarehouseID + ")");
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
    }
}
