using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.BLL
{
    public class OutWarehouse
    {
        private readonly DAL.OutWarehouse dal = new DAL.OutWarehouse();
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="Model"></param>
        /// <returns></returns>
        public int Add(Model.Client Model)
        {
            return dal.Add(Model);
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
        public List<Model.OutWarehouse> GetList()
        {
            return dal.GetList();
        }
        public bool Delete(string OutWarehouseID)
        {
            return dal.Delete(OutWarehouseID);
        }
    }
}
