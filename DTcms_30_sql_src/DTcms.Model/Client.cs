using System;
using System.Collections.Generic;

namespace DTcms.Model
{
    [Serializable]
    public partial class Client
    {
        private int _ClientID;
        private Guid _UniqueID;       
        private string _ClientAccount;
        private string _ClientName;
        private string _Phone;
        private string _Email;
        private string _ClientAddress;
        private DateTime _CreateTime;
        private int _State;        
        private string _Remark;

        public int ClientID
        {
            get { return _ClientID; }
            set { _ClientID = value; }
        }
        public Guid UniqueID
        {
            get { return _UniqueID; }
            set { _UniqueID = value; }
        }
        public string ClientAccount
        {
            get { return _ClientAccount; }
            set { _ClientAccount = value; }
        }
        public string ClientName
        {
            get { return _ClientName; }
            set { _ClientName = value; }
        }
        public string Phone
        {
            get { return _Phone; }
            set { _Phone = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string ClientAddress
        {
            get { return _ClientAddress; }
            set { _ClientAddress = value; }
        }
        public DateTime CreateTime
        {
            get { return _CreateTime; }
            set { _CreateTime = value; }
        }
        public int State
        {
            get { return _State; }
            set { _State = value; }
        }
        public string Remark
        {
            get { return _Remark; }
            set { _Remark = value; }
        }
    }
}
