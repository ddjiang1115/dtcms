using System;
using System.Data;
using System.Collections.Generic;
using DTcms.Common;

namespace DTcms.BLL
{
    public class BarCodeCreateRecord
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.BarCodeCreateRecord dal;
        public BarCodeCreateRecord()
        {
            dal = new DAL.BarCodeCreateRecord(siteConfig.sysdatabaseprefix);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public void Add(Model.BarCodeCreateRecord barCodeCreateRecord, Model.BarCode BarCode)
        {
            dal.Add(barCodeCreateRecord, BarCode);
        }
        public Model.BarCodeCreateRecord GetModel(string BarCodeCreateRecordID)
        {
            return dal.GetModel(BarCodeCreateRecordID);
        }
        public List<Model.BarCodeCreateRecord> GetList()
        {
            return dal.GetList();
        }
        public bool Delete(string BarCodeCreateRecordID)
        {
            return dal.Delete(BarCodeCreateRecordID);
        }
        public bool Update(string BarCodeCreateRecordID, string DownLoad)
        {
            return dal.Update(BarCodeCreateRecordID, DownLoad);
        }
        public int GetMaxID()
        {
            return dal.GetMaxID();
        }
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
    }
}
