using System;
using System.Data;
using System.Collections.Generic;
using DTcms.Common;

namespace DTcms.BLL
{
    public class IntegralManage
    {
        private readonly DAL.IntegralManage dal = new DAL.IntegralManage();
        public List<Model.IntegralManage> GetList()
        {
            return dal.GetList();
        }
    }
}
