using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
namespace DTcms.BLL
{
    public class t_address_town
    {
        private readonly DAL.t_address_town dal;
        public t_address_town()
        {
            dal = new DAL.t_address_town();
        }
        public DataTable GetTownByCode(string townCode)
        {
            return dal.GetTownByCode(townCode);
        }
    }
}
