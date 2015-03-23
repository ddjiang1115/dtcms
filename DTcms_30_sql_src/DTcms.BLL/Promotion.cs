using System;
using System.Data;
using System.Collections.Generic;
using DTcms.Common;

namespace DTcms.BLL
{
    public class Promotion
    {
        private readonly DAL.Promotion dal = new DAL.Promotion();
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="Model"></param>
        /// <returns></returns>
        public int Add(Model.Promotion Model)
        {
            return dal.Add(Model);
        }
        public void Add(DataTable dt, string tableName, Dictionary<string, string> dic)
        {
             dal.Add(dt, tableName, dic);
        }
        public int Edit(Model.Client Model)
        {
            return dal.Edit(Model);
        }
        public Model.Client GetModel(string id)
        {
            return dal.GetModel(id);
        }
        /// <summary>
        /// 查询所有数据
        /// </summary>
        /// <returns></returns>
        public List<Model.Promotion> GetList()
        {
            return dal.GetList();
        }
        public bool Delete(string PromotionID)
        {
            return dal.Delete(PromotionID);
        }
        public bool Add(Model.Promotion Model,bool trans)
        {
            return dal.Add(Model, trans);
        }
        public bool UpdateState(string PromotionID, int State)
        {
            return dal.UpdateState(PromotionID,State);
        }
        public DataSet GetListCheck(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetListCheck(pageSize, pageIndex,  strWhere,  filedOrder, out  recordCount);
        }
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out  recordCount);
        }
    }
}
