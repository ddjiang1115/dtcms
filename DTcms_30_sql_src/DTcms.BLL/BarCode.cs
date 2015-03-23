using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
namespace DTcms.BLL
{
    public class BarCode
    {
        private readonly DAL.BarCode dal;
        public BarCode()
        {
            dal = new DAL.BarCode();
        }
        public List<Model.BarCode> GetList()
        {
            return dal.GetList();
        }
        /// <summary>
        /// 根据BarCodeCreateRecordID查询所有BarCode分组
        /// </summary>
        /// <param name="BarCodeCreateRecordID"></param>
        /// <returns></returns>
        public DataTable GetBarCodeGroupByBarCode(string BarCodeCreateRecordID)
        {
            return dal.GetBarCodeGroupByBarCode(BarCodeCreateRecordID);
        }
        /// <summary>
        /// 根据BarCode获取BarCode单个分组数据
        /// </summary>
        /// <param name="Barcode"></param>
        /// <returns></returns>
        public DataTable GetBarCodeByBarCode(string Barcode)
        {
            return dal.GetBarCodeByBarCode(Barcode);
        }
        /// <summary>
        /// 根据BarCodeCreateRecordID获取BarCode表
        /// </summary>
        /// <param name="BarCodeCreateRecordID"></param>
        /// <returns></returns>
        public DataTable GetBarCodeByBarCodeCreateRecordID(string BarCodeCreateRecordID)
        {
            return dal.GetBarCodeByBarCodeCreateRecordID(BarCodeCreateRecordID);
        }
        public DataTable GetBarCodeCreateDetailByBarCodeCreateRecordID(string BarCodeCreateRecordID)
        {
            return dal.GetBarCodeCreateDetailByBarCodeCreateRecordID(BarCodeCreateRecordID);
        }
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
        public DataSet QueryIntegralCode(string IntegralCode)
        {
            return dal.QueryIntegralCode(IntegralCode);
        }
        public DataSet QueryIntegralRatioSum(string IntegralCode)
        {
            string str = "";
            string[] strs = IntegralCode.Split(',');
            if (strs.Length > 0)
            {
                foreach (var i in strs)
                {
                    str += "'" + i + "',";
                    
                }
                str = str.Substring(0, str.Length - 1);
            }
            return dal.QueryIntegralRatioSum(str);
        }
        public bool UpdateState(string key, int state)
        {

            return dal.UpdateState(key, state);

        }
        public bool UserChange(int IntegralRatio, string user_name, string IntegralCode,string IP)
        {
            return dal.UserChange(IntegralRatio, user_name, IntegralCode,IP);
        }
        public bool Exists(string user_name, int state, string LogisticsCode)
        {
            return dal.Exists(user_name, state, LogisticsCode);
        }
        public bool ExistsOut(string LogisticsCode)
        {
            return dal.ExistsOut(LogisticsCode);
        }
        public DataTable GetBarCodeByLogisticsCode(string LogisticsCode)
        {
            return dal.GetBarCodeByLogisticsCode(LogisticsCode);
        }
        public DataTable GetBarCodeByIntegralCode(string IntegralCode)
        {
            return dal.GetBarCodeByIntegralCode(IntegralCode);
        }
    }

}
