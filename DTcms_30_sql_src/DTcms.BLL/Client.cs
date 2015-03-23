using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using DTcms.Common;
namespace DTcms.BLL
{
    public class Client
    {
        private readonly DAL.Client dal = new DAL.Client();
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
        public List<Model.Client> GetList()
        {
            return dal.GetList();
        }
        public bool Delete(string ClientID)
        {
            return dal.Delete(ClientID);
        }
        public DataSet GetClientByName(string ClientAccount)
        {
            return dal.GetClientByName(ClientAccount);
        }
    }
}
