using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace DTcms.BLL
{
    
    public class t_address_province
    {
        private readonly DAL.t_address_province dal;
        public t_address_province()
        {
            dal = new DAL.t_address_province();
        }
        public DataTable GetProvinceAll()
        {
            return dal.GetProvinceAll();
        }
    }
}
