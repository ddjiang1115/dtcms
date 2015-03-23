using System;
using System.Data;
using System.Collections.Generic;
using DTcms.Common;

namespace DTcms.BLL
{
    public class GoodCategory
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.GoodCategory dal;
        public GoodCategory()
        {
            dal = new DAL.GoodCategory(siteConfig.sysdatabaseprefix);
        }
        public List<Model.GoodCategory> GetList()
        {
            return dal.GetList();
        }
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out  recordCount);
        }
        public int Add(Model.GoodCategory Model)
        {
            return dal.Add(Model);
        }
        public Model.GoodCategory GetModel(string GoodCategoryID)
        {
            return dal.GetModel(GoodCategoryID);
        }
        public int Edit(Model.GoodCategory Model)
        {
            return dal.Edit(Model);
        }
        public bool Delete(string GoodCategory)
        {
            return dal.Delete(GoodCategory);
        }
        public DataSet GetGoodCategoryByName(string GoodCategoryName)
        {
            return dal.GetGoodCategoryByName(GoodCategoryName);
        }
    }
}
