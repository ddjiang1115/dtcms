using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    public class OutWarehouse
    {
        private int _OutWarehouseID;
        private int _ClientID;
        private Guid _UniqueID;
        private int _Operator;
        private string _OutWarehouseNumber;
        private string _LogisticsCode;
        private int _State;
        private DateTime _CreateTime;
        private string _Remark;       
        public int OutWarehouseID
        {
            get { return _OutWarehouseID; }
            set { _OutWarehouseID = value; }
        }
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
        public int Operator
        {
            get { return _Operator; }
            set { _Operator = value; }
        }
        public string OutWarehouseNumber
        {
            get { return _OutWarehouseNumber; }
            set { _OutWarehouseNumber = value; }
        }
        public string LogisticsCode
        {
            get { return _LogisticsCode; }
            set { _LogisticsCode = value; }
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
