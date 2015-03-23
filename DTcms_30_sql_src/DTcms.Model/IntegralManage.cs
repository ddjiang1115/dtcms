using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    public class IntegralManage
    {
        private int _IntegralManageID;
        private Guid _UniqueID;
        private int _ClientID;
        private int _Operator;
        private string _IntegralCode;
        private string _IP;
        private string _PostChannel;
        private int _IsProxy;
        private DateTime _CreateTime;
        private string _Remark;       
        public int IntegralManageID
        {
            get { return _IntegralManageID; }
            set { _IntegralManageID = value; }
        }
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
        public int Operator
        {
            get { return _Operator; }
            set { _Operator = value; }
        }
        public string IntegralCode
        {
            get { return _IntegralCode; }
            set { _IntegralCode = value; }
        }
        public string IP
        {
            get { return _IP; }
            set { _IP = value; }
        }
        public string PostChannel
        {
            get { return _PostChannel; }
            set { _PostChannel = value; }
        }
        public int IsProxy
        {
            get { return _IsProxy; }
            set { _IsProxy = value; }
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
