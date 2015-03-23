<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registe.aspx.cs" Inherits="DTcms.Web.admin.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>新用户注册-门店(促销员)</title>
<link media="screen" type="text/css" href="/templates/green/css/style.css" rel="stylesheet"/>
<script src="/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/admin/js/layout.js"></script>
    <script src="/web/js/layer.min.js"></script>
    <link href="/web/style/layer.css" rel="stylesheet" />
    <link href="/web/style/layer.ext.css" rel="stylesheet" />
    <style>
        label.error {
            margin-left:5px;color:red;
        }
        dl dt span {color:red;
        }
        dl dd span {color:red;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //初始化表单验证
            $("#signupForm").initValidform();
        });
</script>
</head>

<body>
<!--Header-->

<!--/Header-->

<div class="boxwrap">
  <div class="main_box">
    <h1 class="main_tit">
      门店注册<strong>Register</strong>
    </h1>

    <div class="reg-box">
      <div class="reg-top">
        <ul class="step">
          <li class="step1"><em>1</em>填写门店信息</li>
          
          <li class="step3"><em>2</em>注册成功</li>
          
        </ul>
      </div>
      <form runat="server" id="signupForm">
      <div class="reg-con">

            <dl>
    <dt><span>*</span>&nbsp;姓名</dt>
    <dd><asp:TextBox ID="txtname" runat="server" CssClass="input normal" datatype="s6-20" nullmsg="请输入姓名" sucmsg=" " ajaxurl="/ashx/AdminVerification.ashx?action=adminusername"></asp:TextBox></dd>
  </dl>
            <dl>
    <dt><span>*</span>&nbsp;登录密码</dt>
    <dd><asp:TextBox ID="txtPassword" runat="server" CssClass="input normal" TextMode="Password" datatype="*6-20" nullmsg="请输入密码" errormsg="密码范围在6-20位之间" sucmsg=" "></asp:TextBox></dd>
  </dl>
  <dl>
    <dt><span>*</span>&nbsp;确认密码</dt>
    <dd><asp:TextBox ID="confirm_password" runat="server" CssClass="input normal" TextMode="Password" datatype="*" recheck="txtPassword" nullmsg="请再输入一次密码" errormsg="两次输入的密码不一致" sucmsg=" "></asp:TextBox></dd>
  </dl>
            <dl>
    <dt><span>*</span>&nbsp;手机号码</dt>
    <dd><asp:TextBox ID="txtTelephone" runat="server" CssClass="input normal" datatype="m" nullmsg="请输入手机号码！" errormsg="手机号码格式不对！" ajaxurl="/ashx/AdminVerification.ashx?action=mobile"></asp:TextBox></dd>
  </dl>
              <dl>
    <dt><span>*</span>&nbsp;门店编号</dt>
    <dd><asp:TextBox ID="txtShopCode" runat="server" CssClass="input normal" datatype="*" nullmsg="请输入经销商编号！"></asp:TextBox></dd>
  </dl> 
<%--<dl>
    <dt><span>*</span>&nbsp;经销商名称</dt>
    <dd><asp:TextBox ID="txtDealerName" runat="server" CssClass="input normal" datatype="*" nullmsg="请输入经销商名称！"></asp:TextBox></dd>
  </dl>--%>
            <dl>
    <dt><span>*</span>&nbsp;门店名称</dt>
    <dd><asp:TextBox ID="txtShopName" runat="server" CssClass="input normal" datatype="*" nullmsg="请输入门店名称！"></asp:TextBox></dd>
  </dl>
            <dl>
    <dt><span>*</span>&nbsp;省</dt>
    <dd><asp:DropDownList runat="server" ID="drpProvice"></asp:DropDownList>&nbsp;市&nbsp;<select id="city" name="city"></select>&nbsp;区&nbsp;<select id="town" name="town"></select>&nbsp;<span>*</span>&nbsp;邮编&nbsp;<asp:TextBox ID="txtPostcode" runat="server" CssClass="input normal" datatype="*" nullmsg="请输入邮编！"></asp:TextBox></dd>
  </dl>
            <dl>
    <dt><span>*</span>&nbsp;详细地址</dt>
    <dd><asp:TextBox ID="txtDetailAddress" runat="server" TextMode="MultiLine" CssClass="input normal" Height="56px" Width="322px" datatype="*" nullmsg="请输入详细地址！"></asp:TextBox></dd>
  </dl>
        <%--    <dl>
    <dt><span>*</span>&nbsp;邮编</dt>
    <dd><asp:TextBox ID="txtPostcode" runat="server" CssClass="input normal"></asp:TextBox></dd>
  </dl>--%>
  
    <dl>
    <dt></dt>
    <dd><asp:Button ID="Button1" runat="server" Text="提交" CssClass="btn" onclick="btnSubmit_Click" style="width:160px; text-align:center;padding:0;"/></dd>
  </dl>
        <%--</form>--%>
        <!--用户注册-->
      </div>
          <script type="text/javascript">
              //$().ready(function () {
              //    jQuery.validator.addMethod("isMobile", function (value, element) {
              //        var tel = /^(130|131|132|133|134|135|136|137|138|139|150|153|157|158|159|180|187|188|189)\d{8}$/;
              //        return tel.test(value) || this.optional(element);
              //    }, "请输入正确的手机号码");
              //    jQuery.validator.addMethod("isPhone", function (value, element) {
              //        var length = value.length;
              //       // var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
              //        var tel = /^\d{3,4}-?\d{7,9}$/;
              //        //return this.optional(element) || (tel.test(value) || mobile.test(value));
              //        return this.optional(element) || (tel.test(value));

              //    }, "请正确填写您的联系电话");
              //    $("#signupForm").validate({
              //        rules: {
              //            txtUserName: {
              //                required: true,
              //                minlength: 6,
              //                remote: {
              //                    type: "GET",
              //                    url: "/ashx/Verification.ashx?action=adminusername",
              //                    data: {
              //                        Username: function () { return $("#txtUserName").val(); }
              //                    }
              //                }
              //            },
              //            txtPassword: {
              //                required: true,
              //                minlength: 6
              //            },
              //            confirm_password: {
              //                required: true,
              //                minlength: 6,
              //                equalTo: "#txtPassword"
              //            },
              //            txtcompanyname: {
              //                required: true,
              //                maxlength:50
              //            },
              //            txtname: {
              //                required: true,
              //                maxlength:100
              //            },
              //            txtTelephone: {
              //                required: true
              //            },
              //            txtphone: { isPhone: true }
              //            ,
              //            txtEmail: {
              //                email:true
              //            },
              //            txtaddress: {
              //                maxlength: 200
              //            }
              //            //txtalipayaccount: {
              //            //    required: true
              //            //}
              //        },
              //        messages: {
              //            txtUserName: {
              //                required: "6-18位",
              //                minlength: "6-18位",
              //                remote: "该用户名已被注册"
              //            },
              //            txtPassword: {
              //                required: "6-18位",
              //                minlength: "6-18位"
              //            },
              //            confirm_password: {
              //                required: "6-18位",
              //                minlength: "6-18位",
              //                equalTo: "两次密码不一致"
              //            },
              //            txtcompanyname: {
              //                required: "请输入公司名称",
              //                maxlength:"名称太长了"
              //            },
              //            txtname: {
              //                required: "请输入姓名",
              //                maxlength:"名字太长了"
              //            },
              //            txtTelephone: {
              //                required: "请输入手机号码",
              //                isMobile: "手机格式错误"
              //            },
              //            txtEmail: {
              //                email: "电子邮件格式不对(例子:xxx@163.com)"
              //            },
              //            txtaddress: {
              //                maxlength: "地址太长了"
              //            }
                          
              //        },
              //        errorPlacement: function (error, element) {
              //            //var placement = $(element.parent("td").parent("tr").next("tr").find("td").get(1));
              //            //placement.text('');
              //            error.appendTo(element.parent());
              //        }
              //    });
              //});
              function mess() {
                  layer.alert('注册成功，请耐心等待管理员审核！', -1, !1);
              };
              $.ajax({
                  type: "get",
                  url: "/ashx/Ganged.ashx?action=city&code=" + $("#drpProvice").val(),
                  success: function (msg) {
                      $.each(JSON.parse(msg), function (idx, item) {
                          $("#city").append("<option value='"+item.code+"'>" + item.name + "</option>");
                      });
                      $.ajax({
                          type: "get",
                          url: "/ashx/Ganged.ashx?action=town&code=" + $("#city").val(),
                          success: function (msg2) {
                              $.each(JSON.parse(msg2), function (idx2, item2) {
                                  $("#town").append("<option value='" + item2.code + "'>" + item2.name + "</option>");
                              });
                          }
                      });
                  }
              });
              $("#drpProvice").change(function () {
                  $("#city").html("");
                  $("#town").html("");
                  $.ajax({
                      type: "get",
                      url: "/ashx/Ganged.ashx?action=city&code=" + $("#drpProvice").val(),
                      success: function (msg) {                         
                         // var data = eval("(" + msg + ")");
                          $.each(JSON.parse(msg), function (idx, item) {
                              $("#city").append("<option value='" + item.code + "'>" + item.name + "</option>");
                          });

                          $.ajax({
                              type: "get",
                              url: "/ashx/Ganged.ashx?action=town&code=" + $("#city").val(),
                              success: function (msg2) {
                                  $.each(JSON.parse(msg2), function (idx2, item2) {
                                      $("#town").append("<option value='" + item2.code + "'>" + item2.name + "</option>");
                                  });
                              }
                          });

                      }
                  });
              });
              $("#city").change(function () {
                  $("#town").html("");
                  $.ajax({
                      type: "get",
                      url: "/ashx/Ganged.ashx?action=town&code=" + $("#city").val(),
                      success: function (msg2) {
                          $.each(JSON.parse(msg2), function (idx2, item2) {
                              $("#town").append("<option value='" + item2.code + "'>" + item2.name + "</option>");
                          });
                      }
                  });
              });
          </script>
      </form>

    </div>

    <div class="clear"></div>
  </div>
</div>

<div class="clear"></div>

<!--Footer-->

<!--/Footer-->
</body>
</html>
