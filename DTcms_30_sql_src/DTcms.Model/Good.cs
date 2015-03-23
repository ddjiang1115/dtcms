using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    [Serializable]
    public class Good
    {
        private Guid _UniqueID;
        private int _ClientID;
        private string _GoodCode;
        private DateTime _CreateTime;
        private string _Remark;
        public Guid UniqueID
        {
            get { return _UniqueID; }
            set { _UniqueID = value; }
        }
        public int ClientID
        {
            get { return _ClientID; }
            set { _ClientID = value; }
        }
        public string GoodCode
        {
            get { return _GoodCode; }
            set { _GoodCode = value; }
        }
        public DateTime CreateTime
        {
            get { return _CreateTime; }
            set { _CreateTime = value; }
        }
        public string Remark
        {
            get { return _Remark; }
            set { _Remark = value; }
        }
    }
}
