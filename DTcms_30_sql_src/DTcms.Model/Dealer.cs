using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    public class Dealer
    {
        private int _DealerID;
        private string _DealerCode = "";
        private string _DealerName = "";
        private DateTime _CreateTime;       
        public int DealerID
        {
            get { return _DealerID; }
            set { _DealerID = value; }
        }
        public string DealerCode
        {
            get { return _DealerCode; }
            set { _DealerCode = value; }
        }
        public string DealerName
        {
            get { return _DealerName; }
            set { _DealerName = value; }
        }
        public DateTime CreateTime
        {
            get { return _CreateTime; }
            set { _CreateTime = value; }
        }
    }
}
