using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    public class Promotion
    {
        private int _PromotionID;       
        private Guid _UniqueID;        
        private int _ClientID;        
        private string _LogisticsCode;       
        private int _Operator;       
        private decimal _BrokerageRatio;       
        private int _State;        
        private DateTime _CreateTime;        
        private string _Remark;       
        public int PromotionID
        {
            get { return _PromotionID; }
            set { _PromotionID = value; }
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
        public string LogisticsCode
        {
            get { return _LogisticsCode; }
            set { _LogisticsCode = value; }
        }
        public int Operator
        {
            get { return _Operator; }
            set { _Operator = value; }
        }
        public decimal BrokerageRatio
        {
            get { return _BrokerageRatio; }
            set { _BrokerageRatio = value; }
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
