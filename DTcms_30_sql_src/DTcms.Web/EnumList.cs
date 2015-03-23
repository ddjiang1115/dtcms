using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
namespace DTcms.Web
{
    public static class EnumList
    {
        public enum StateList
        {
            [Description("生成")]
            State1 = 1,
            [Description("出库")]
            State2 = 2,
            [Description("销售")]
            State3 = 3,
            [Description("已兑换(未激活)")]
            State4 = 4,
            [Description("激活(未支付)")]
            State5 = 5,
            [Description("已支付")]
            State6 = 6
        }
        public enum OrderState
        {
            [Description("生成订单")]
            State1 = 1,
            [Description("确认订单")]
            State2 = 2,
            [Description("完成订单")]
            State3 = 3,
            [Description("取消订单")]
            State4 = 4,
            [Description("作废订单")]
            State5 = 5,
        }  
    }
}