using System;
using System.Data;
using System.Collections.Generic;
using DTcms.Common;
using System.Text;

namespace DTcms.BLL
{
    public class IntegralExchange
    {
        private readonly DAL.IntegralExchange dal = new DAL.IntegralExchange();
        public List<Model.IntegralExchange> GetList()
        {
            return dal.GetList();
        }
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
    }
}
