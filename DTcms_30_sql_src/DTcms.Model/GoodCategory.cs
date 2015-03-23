using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    [Serializable]
    public class GoodCategory
    {   
        private int _GoodCategoryID;
        private Guid _UniqueID;
        private int _ClientID;
        private string _GoodCategoryName;
        private int _Operator;
        private string _GoodBarCode;
        private decimal _BrokerageRatio;
        private int _IntegralRatio;
        private int _Standard;
        private int _State;
        private DateTime _CreateTime;
        private string _Remark;
        public int GoodCategoryID
        {
            get { return _GoodCategoryID; }
            set { _GoodCategoryID = value; }
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
        public string GoodCategoryName
        {
            get { return _GoodCategoryName; }
            set { _GoodCategoryName = value; }
        }
        public int Operator
        {
            get { return _Operator; }
            set { _Operator = value; }
        }
        public string GoodBarCode
        {
            get { return _GoodBarCode; }
            set { _GoodBarCode = value; }
        }
        public decimal BrokerageRatio
        {
            get { return _BrokerageRatio; }
            set { _BrokerageRatio = value; }
        }
        public int IntegralRatio
        {
            get { return _IntegralRatio; }
            set { _IntegralRatio = value; }
        }
        public int Standard
        {
            get { return _Standard; }
            set { _Standard = value; }
        }
        public int State
        {
            get { return _State; }
            set { _State = value; }
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
