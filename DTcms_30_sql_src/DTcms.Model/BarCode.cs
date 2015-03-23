using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    [Serializable]
    public class BarCode
    {
        private Guid _UniqueID;

        public Guid UniqueID
        {
            get { return _UniqueID; }
            set { _UniqueID = value; }
        }
        private int _ClientID;
        private int _BarCodeCreateRecordID;

        public int BarCodeCreateRecordID
        {
            get { return _BarCodeCreateRecordID; }
            set { _BarCodeCreateRecordID = value; }
        }
        public int ClientID
        {
            get { return _ClientID; }
            set { _ClientID = value; }
        }
        private string _BoxCode;

        public string BoxCode
        {
            get { return _BoxCode; }
            set { _BoxCode = value; }
        }
        private string _LogisticsCode;

        public string LogisticsCode
        {
            get { return _LogisticsCode; }
            set { _LogisticsCode = value; }
        }
        private string _IntegralCode;

        public string IntegralCode
        {
            get { return _IntegralCode; }
            set { _IntegralCode = value; }
        }
        private DateTime _CreateTime;

        public DateTime CreateTime
        {
            get { return _CreateTime; }
            set { _CreateTime = value; }
        }
        private int _Operator;

        public int Operator
        {
            get { return _Operator; }
            set { _Operator = value; }
        }
        private int _State;

        public int State
        {
            get { return _State; }
            set { _State = value; }
        }
        private string _Batch;

        public string Batch
        {
            get { return _Batch; }
            set { _Batch = value; }
        }
        private string _Remark;

        public string Remark
        {
            get { return _Remark; }
            set { _Remark = value; }
        }
    }
}
