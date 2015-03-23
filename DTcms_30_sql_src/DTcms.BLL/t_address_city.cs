using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace DTcms.BLL
{
    public class t_address_city
    {
        private readonly DAL.t_address_city dal;
        public t_address_city()
        {
            dal = new DAL.t_address_city();
        }
        public DataTable GetCityByCode(string provinceCode)
        {
            return dal.GetCityByCode(provinceCode);
        }
    }
}
