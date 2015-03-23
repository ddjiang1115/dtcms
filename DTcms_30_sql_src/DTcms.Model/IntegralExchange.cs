using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    public class IntegralExchange
    {
        private int _IntegralExchangeID;

        public int IntegralExchangeID
        {
            get { return _IntegralExchangeID; }
            set { _IntegralExchangeID = value; }
        }
        private Guid _UniqueID;

        public Guid UniqueID
        {
            get { return _UniqueID; }
            set { _UniqueID = value; }
        }
        private int _UserID;

        public int UserID
        {
            get { return _UserID; }
            set { _UserID = value; }
        }
        private string _IntegralCode;

        public string IntegralCode
        {
            get { return _IntegralCode; }
            set { _IntegralCode = value; }
        }
        private string _IP;

        public string IP
        {
            get { return _IP; }
            set { _IP = value; }
        }
        private DateTime _CreateTime;

        public DateTime CreateTime
        {
            get { return _CreateTime; }
            set { _CreateTime = value; }
        }
    }
}
