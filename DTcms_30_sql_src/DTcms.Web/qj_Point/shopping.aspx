﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shopping.aspx.cs" Inherits="DTcms.Web.qj_Point.shopping" %>

<%@ Register src="/layout/head.ascx" tagname="head" tagprefix="uc1" %>

<%@ Register src="/layout/foot.ascx" tagname="foot" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>购物中心－<%=config.webname%></title>
    <link href="css/point.css" rel="stylesheet" />
    <script src="../scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
    <script src="js/base.js"></script>
    <script src="js/cart.js"></script>
</head>

<body>
<!--Header-->
<uc1:head ID="head1" runat="server" />
<!--/Header-->

<div class="boxwrap">
  <div class="cart_box">
    <%if(action=="cart"){%>
    <!--购物车-->
    <h1 class="main_tit">
      <span><a onclick="DeleteCart(this,'/','0');" href="javascript:;">清空礼品车</a></span>
      我的礼品车<strong>Shopping Cart</strong>
    </h1>
    <div class="cart_step">
      <ul>
        <li class="selected"><span>1</span>放进礼品车</li>
        <li><span>2</span>填写订单信息</li>
        <li class="last"><span>3</span>支付/确定订单</li>
      </ul>
    </div>
    <div class="line20"></div>
    
    <table width="938" border="0" align="center" cellpadding="8" cellspacing="0" class="cart_table">
      <tr>
        <th width="64"></th>
        <th align="left">商品名称</th>
        <th width="80" align="center">积分</th>
        <%--<th width="80" align="center">单价</th>--%>
        <th width="80" align="center">数量</th>
<%--        <th width="80" align="center">优惠</th>
        <th width="100" align="center">金额小计</th>--%>
        <th width="100" align="center">积分小计</th>
        <th width="50" align="center">操作</th>
      </tr>
      <%System.Collections.Generic.IList<DTcms.Model.cart_items> ls1=get_cart_list();%>
      <%foreach(DTcms.Model.cart_items modelt in ls1){%>
      <tr>
        <td><a target="_blank" href="productDetail.aspx?id=<%=modelt.id%>"><img src="<%=modelt.img_url%>" class="img" /></a></td>
        <td><a target="_blank" href="productDetail.aspx?id=<%=modelt.id%>"><%=modelt.title%></a></td>
        <td align="center">
          <%=modelt.point%>
        </td>
        <%--<td align="center">￥{modelt.price}<input name="goods_price" type="hidden" value="{modelt.user_price}" /></td>--%>
        <td align="center">
          <a href="javascript:;" class="reduce" title="减一" onclick="CartComputNum(this, '/', '<%=modelt.id%>', -1);">减一</a>
          <input type="text" name="goods_quantity" class="input" style="width:30px;text-align:center;ime-mode:Disabled;" value="<%=modelt.quantity%>" onblur="CartAmountTotal(this, '/', '<%=modelt.id%>');" onkeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))" />
          <a href="javascript:;" class="subjoin" title="加一" onclick="CartComputNum(this,'/', '<%=modelt.id%>', 1);">加一</a>
        </td>
<%--        <td align="center">￥<label name="discount_amount"><%=((modelt.price-modelt.user_price)*modelt.quantity)%></label></td>--%>
<%--        <td align="center"><font color="#FF0000" size="2">￥<label name="real_amount"><%=(modelt.user_price*modelt.quantity)%></label></font></td>--%>
        <td align="center">
          <font color="#FF0000" size="2">
            <label name="point_count"><%=(modelt.point*modelt.quantity)%></label>
          </font>
        </td>
        <td align="center"><a onclick="DeleteCart(this,'/','<%=modelt.id%>');" href="javascript:;">删除</a></td>
      </tr>
      <%}%>
      <%if(ls1.Count<1){%>
      <tr>
        <td colspan="9">
          <div class="msg_tips">
            <div class="ico warning"></div>
            <div class="msg">
              <strong>礼品车没有商品！</strong>
              <p>您的礼品车为空，<a href="product.aspx">马上去选购</a>吧！</p>
            </div>
          </div>
        </td>
      </tr>
      <%}%>
      <tr>
        <th colspan="9" align="right">
          礼品件数：<%=cartModel.total_quantity %>件 &nbsp;&nbsp; 
          <%--商品总金额（不含运费）：<font color="#FF0000" size="2">￥{cartModel.real_amount}</font>元 &nbsp;&nbsp;--%> 
          总积分：<font color="#FF0000" size="2"><%=cartModel.total_point%>分</font>
        </th>
      </tr>
      
	</table>
    <div class="line20"></div>
    <div class="right">
      <a class="btn" href="product.aspx">继续选购</a>
      <%if(cartModel.total_quantity==0){%>
      <a class="btn btn-gray">不能结算</a>
      <%}else{%>
      <a class="btn btn-success marL10" href="shopping.aspx?action=confirm">马上去结算</a>
      <%}%>
    </div>
    <div class="clear">
        
      </div>
    <!--/购物车-->
    
    <%}else if(action=="confirm"){%>
    <link rel="stylesheet" href="/css/validate.css" />
	<script type="text/javascript" src="/scripts/jquery/jquery.form.min.js"></script>
    <script type="text/javascript" src="/scripts/jquery/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript">
        $(function () {
            //表单提交
            AjaxInitForm('order_form', 'btnSubmit', 0);
        });
    </script>
    <!--结算中心-->
    <h1 class="main_tit">
      <span><a href="shopping.aspx?action=cart">返回</a></span>
      确认订单信息<strong>Confirm order</strong>
    </h1>
    <div class="cart_step">
      <ul>
        <li class="item"><span>1</span>放进礼品车</li>
        <li class="selected"><span>2</span>填写订单信息</li>
        <li class="last"><span>3</span>支付/确定订单</li>
          
      </ul>
    </div>
    <div class="line20"></div>
    
    <form name="order_form" id="order_form" url="/tools/submit_ajax.ashx?action=order_save">
    <h3 class="bar_tit">1、收货信息</h3>
    <div class="form_box">
      <dl>
        <dt>收货人姓名：</dt>
        <dd><input name="accept_name" id="accept_name" type="text" class="input txt wide" value="<%=userModel.nick_name%>"}" datatype="s2-20" sucmsg=" " /><span class="Validform_checktip">*收货人姓名</span></dd>
      </dl>
      <dl>
        <dt>收货地址：</dt>
        <dd><input name="address" id="address" type="text" class="input txt" value="<%=userModel.address%>" datatype="*2-100" sucmsg=" " style="width:300px;" /><span class="Validform_checktip">*收货人的详细地址</span></dd>
      </dl>
      <dl>
        <dt>邮政编码：</dt>
        <dd><input name="post_code" id="post_code" type="txt" class="input txt" /><span class="Validform_checktip">所在地区的邮政编码，非必填</span></dd>
      </dl>
      <dl>
        <dt>手机号码：</dt>
        <dd><input name="mobile" id="mobile" type="text" class="input txt" value="<%=userModel.mobile%>" datatype="m" sucmsg=" " /><span class="Validform_checktip">*收货人的手机号码</span></dd>
      </dl>
      <dl>
        <dt>联系电话：</dt>
        <dd><input name="telphone" id="telphone" type="text" class="input txt" value="<%=userModel.telphone%>" /><span class="Validform_checktip">收货人的联系电话，非必填</span></dd>
      </dl>
    </div>
    
<%--    <div class="line20"></div>
    <h3 class="bar_tit">2、支付方式</h3>
    <ul class="item_box">
      <%set DataTable list1=get_payment_list(0, "is_lock=0")%> <!--取得一个DataTable-->
      <%loop dr1 list1%>
      <%set (decimal){poundage_amount}=get_payment_poundage_amount({strtoint({dr1[id]})})%>
      <li>
        <%if(dr1__loop__id==(list1.Rows.Count))%>
        <label><input name="payment_id" type="radio" onclick="PaymentAmountTotal(this);" value="{dr1[id]}" datatype="*" sucmsg=" " /><input name="payment_price" type="hidden" value="{poundage_amount}" />{dr1[title]}
        <%else%>
        <label><input name="payment_id" type="radio" onclick="PaymentAmountTotal(this);" value="{dr1[id]}" /><input name="payment_price" type="hidden" value="{poundage_amount}" />{dr1[title]}
        <%/if%>
        <em>手续费：{poundage_amount}元</em></label>
      </li>
      <%/loop%>
    </ul>--%>
    
<%--    <div class="line20"></div>
    <h3 class="bar_tit">3、配送方式</h3>
    <ul class="item_box">
      <%set DataTable list2=get_express_list(0, "is_lock=0")%> <!--取得一个DataTable-->
      <%loop dr2 list2%>
      <li>
        <%if(dr2__loop__id==(list2.Rows.Count))%>
        <label><input name="express_id" type="radio" onclick="FreightAmountTotal(this);" value="{dr2[id]}" datatype="*" sucmsg=" " /><input name="express_price" type="hidden" value="{dr2[express_fee]}" />{dr2[title]}
        <%else%>
        <label><input name="express_id" type="radio" onclick="FreightAmountTotal(this);" value="{dr2[id]}" /><input name="express_price" type="hidden" value="{dr2[express_fee]}" />{dr2[title]}
        <%/if%>
        <em>费用：{dr2[express_fee]}元</em></label>
      </li>
      <%/loop%>
    </ul>--%>
    
    <div class="line20"></div>
    <h3 class="bar_tit">2、商品清单</h3>
    <table width="938" border="0" align="center" cellpadding="8" cellspacing="0" class="cart_table">
      <tr>
        <th width="64"></th>
        <th align="left">商品名称</th>
        <th width="80" align="center">积分</th>
        <%--<th width="80" align="center">单价</th>--%>
        <th width="80" align="center">数量</th>
<%--        <th width="80" align="center">优惠</th>
        <th width="100" align="center">金额小计</th>--%>
        <th width="100" align="center">积分小计</th>
      </tr>
      <%System.Collections.Generic.IList<DTcms.Model.cart_items> ls2=get_cart_list();%>
      <%foreach(DTcms.Model.cart_items modelt in ls2){%>
      <tr>
        <td><a target="_blank" href="productDetail.aspx?id=<%=modelt.id%>"><img src="<%=modelt.img_url%>" class="img" /></a></td>
        <td><a target="_blank" href="productDetail.aspx?id=<%=modelt.id%>"><%=modelt.title%></a></td>
        <td align="center">
          <%=modelt.point%>
        </td>
<%--        <td align="center">￥modelt.price}<input name="goods_price" type="hidden" value="{modelt.user_price}" /></td>--%>
        <td align="center"><%=modelt.quantity%></td>
<%--        <td align="center">￥<label name="discount_amount"><%=((modelt.price-modelt.user_price)*modelt.quantity)%></label></td>--%>
<%--        <td align="center"><font color="#FF0000" size="2">￥<label name="real_amount"><%=(modelt.user_price*modelt.quantity)%></label></font></td>--%>
        <td align="center">
          <font color="#FF0000" size="2">
            <label name="point_count"><%=(modelt.point*modelt.quantity)%></label>
            </font>
        </td>
      </tr>
      <%}%>
      <%if(ls2.Count<1){%>
      <tr>
        <td colspan="8">
          <div class="msg_tips">
            <div class="ico warning"></div>
            <div class="msg">
              <strong>礼品车没有商品！</strong>
              <p>您的礼品车为空，<a href="product.aspx">马上去选购</a>吧！</p>
            </div>
          </div>
        </td>
      </tr>
      <%}%>
	</table>
    
    <div class="line20"></div>
    <h3 class="bar_tit">3、结算信息</h3>
    <div>
      <div class="left">
        <h4>订单留言<span>字数控制在100个字符内</span></h4>
        <textarea name="message" class="input" style="width:250px;height:35px;"></textarea>
      </div>
      
      <div class="right" style="text-align:right;line-height:40px;">
        礼品件数：<font color="#FF0000"><%=cartModel.total_quantity%></font> 件 &nbsp; &nbsp;&nbsp;
        总积分：<font color="#FF0000"><%=cartModel.total_point%></font> 分 &nbsp; &nbsp;&nbsp;
<%--        商品金额：<font color="#FF0000">￥<label id="goods_amount">{cartModel.real_amount}</label></font>&nbsp; &nbsp;+ &nbsp; 
        运费：<font color="#FF0000">￥<label id="express_fee">0.00</label></font>&nbsp; &nbsp;+ &nbsp; 
        支付手续费：<font color="#FF0000">￥<label id="payment_fee">0.00</label></font>--%>
        
        <br />
        <b class="font18">应付总积分：<font color="#FF0000"><label id="order_amount"><%=cartModel.total_point%></label></font></b>
      </div>
    </div>

    <div class="line20"></div>
    <div class="right">
      <a class="btn" href="shopping.aspx?action=cart">返回修改</a>
      <%if(get_cart_quantity()>0){%>
      <input id="btnSubmit" name="btnSubmit" type="submit" value="确认提交" class="btn btn-success marL10" />
      <%}else{%>
      <a class="btn btn-gray marL10">确认提交</a>
      <%}%>
    </div>
    <div class="clear"></div>
    <!--/结算中心-->
    <%}%>
  </div>
</div>

<div class="clear"></div>

<!--Footer-->
<uc2:foot ID="foot1" runat="server" />
<!--/Footer-->

</body>
</html>
