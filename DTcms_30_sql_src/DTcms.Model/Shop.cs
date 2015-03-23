using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    public class Shop
    {
        private int _ShopID;
        private string _ShopCode = "";
        private string _ShopName = "";
        private string _ProvinceCode = "";
        private string _CityCode = "";
        private string _TownCode = "";
        private string _DetailAddress = "";
        private DateTime _CreateTime;
        private string _Postcode = "";
        private int _DealerID;        
        public int ShopID
        {
            get { return _ShopID; }
            set { _ShopID = value; }
        }
        public string ShopCode
        {
            get { return _ShopCode; }
            set { _ShopCode = value; }
        }
        public string ShopName
        {
            get { return _ShopName; }
            set { _ShopName = value; }
        }
        public string ProvinceCode
        {
            get { return _ProvinceCode; }
            set { _ProvinceCode = value; }
        }
        public string CityCode
        {
            get { return _CityCode; }
            set { _CityCode = value; }
        }
        public string TownCode
        {
            get { return _TownCode; }
            set { _TownCode = value; }
        }
        public string DetailAddress
        {
            get { return _DetailAddress; }
            set { _DetailAddress = value; }
        }
        public DateTime CreateTime
        {
            get { return _CreateTime; }
            set { _CreateTime = value; }
        }
        public int DealerID
        {
            get { return _DealerID; }
            set { _DealerID = value; }
        }
        /// <summary>
        /// 邮编
        /// </summary>
        public string Postcode
        {
            get { return _Postcode; }
            set { _Postcode = value; }
        }
    }
}
