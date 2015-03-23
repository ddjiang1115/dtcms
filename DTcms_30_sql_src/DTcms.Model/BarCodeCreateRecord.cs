using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    [Serializable]
    public class BarCodeCreateRecord
    {
        public BarCodeCreateRecord() { }
        private int _BarCodeCreateRecordID;

        public int BarCodeCreateRecordID
        {
            get { return _BarCodeCreateRecordID; }
            set { _BarCodeCreateRecordID = value; }
        }
        private Guid _UniqueID;
        private int _ClientID;
        private int _GoodCategoryID;
        private string _GoodCategoryIDs;

        public string GoodCategoryIDs
        {
            get { return _GoodCategoryIDs; }
            set { _GoodCategoryIDs = value; }
        }
        private string _DownLoad;

        public string DownLoad
        {
            get { return _DownLoad; }
            set { _DownLoad = value; }
        }
        /// <summary>
        /// 商品码
        /// </summary>
        private string _GoodBarCode;

        public string GoodBarCode
        {
            get { return _GoodBarCode; }
            set { _GoodBarCode = value; }
        }
        /// <summary>
        /// 规格
        /// </summary>
        private int _Standard;

        public int Standard
        {
            get { return _Standard; }
            set { _Standard = value; }
        }
        /// <summary>
        /// 箱数
        /// </summary>
        private int _BoxSum;

        public int BoxSum
        {
            get { return _BoxSum; }
            set { _BoxSum = value; }
        }

        private int _GoodCount;
        private string _RetrospectCode;
        private int _Operator;
        private DateTime _CreateTime;
        private string _Batch;
        private decimal _BrokerageRatio;

        public decimal BrokerageRatio
        {
            get { return _BrokerageRatio; }
            set { _BrokerageRatio = value; }
        }
        private int _IntegralRatio;

        public int IntegralRatio
        {
            get { return _IntegralRatio; }
            set { _IntegralRatio = value; }
        } 
        public string Batch
        {
            get { return _Batch; }
            set { _Batch = value; }
        }
        private int _State;
        private int _Show;

        public int Show
        {
            get { return _Show; }
            set { _Show = value; }
        }
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
        public int GoodCategoryID
        {
            get { return _GoodCategoryID; }
            set { _GoodCategoryID = value; }
        }
        public int GoodCount
        {
            get { return _GoodCount; }
            set { _GoodCount = value; }
        }
        public string RetrospectCode
        {
            get { return _RetrospectCode; }
            set { _RetrospectCode = value; }
        }
        public int Operator
        {
            get { return _Operator; }
            set { _Operator = value; }
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
