<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DTcms.Web.admin.users.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        <!--用户注册-->
<%--        <link rel="stylesheet" href="/css/validate.css" />
		<script type="text/javascript" src="/scripts/jquery/jquery.form.min.js"></script>
        <script type="text/javascript" src="/scripts/jquery/Validform_v5.3.2_min.js"></script>
        <script type="text/javascript" src="/templates/green/js/register_validate.js"></script>--%>
        <%--<form id="regform" name="regform" url="/tools/submit_ajax.ashx?action=user_register">--%>
          
         <%-- <dl>
            <dt><em>*</em>用户名：</dt>
            <dd>
              <input id="txtUserName" name="txtUserName" class="input wide" type="text" datatype="s3-50" nullmsg="请输入用户名" sucmsg=" " ajaxurl="/tools/submit_ajax.ashx?action=validate_username" />
              <span class="Validform_checktip"></span>
              <i>（5-20位字母、数字或下划线组合，首字符必须为字母。）</i>
            </dd>
          </dl>
          <dl>
            <dt><em>*</em>密码：</dt>
            <dd>
              <input id="txtPassword" name="txtPassword" class="input wide" type="password" datatype="*6-20" nullmsg="请输入密码" errormsg="密码范围在6-20位之间" sucmsg=" " />
              <span class="Validform_checktip"></span>
              <i>（为了您的帐户安全，强烈建议您的密码使用字符+数字等多种不同类型的组合，并且密码长度大于6位。）</i>
            </dd>
          </dl>
          <dl>
            <dt><em>*</em>确认密码：</dt>
            <dd>
              <input id="txtPassword1" name="txtPassword1" class="input wide" type="password" datatype="*" recheck="txtPassword" nullmsg="请再输入一次密码" errormsg="两次输入的密码不一致" sucmsg=" " />
              <span class="Validform_checktip"></span>
              <i>（确保密码输入正确。）</i>
            </dd>
          </dl>
          <dl>
            <dt><em>*</em>手机号码：</dt>
            <dd>
              <input id="txtMobile" name="txtMobile" class="input wide" type="text" datatype="m" nullmsg="请再输入手机号码" sucmsg=" " />
              <span class="Validform_checktip"></span>
              <i>（填写正确的手机号码，忘记密码时可以通过短信找回！）</i>
            </dd>
          </dl>
          <dl>
            <dt><em>*</em>Email：</dt>
            <dd>
              <input id="txtEmail" name="txtEmail" class="input wide" type="text" datatype="e" nullmsg="请再输入邮箱地址" sucmsg=" " />
              <span class="Validform_checktip"></span>
              <i>（填写正确的邮箱地址，忘记密码时可以通过邮箱找回！）</i>
            </dd>
          </dl>
          <dl>
            <dt><em>*</em>验证码：</dt>
            <dd>
              
              <input id="txtCode" name="txtCode" class="input small" type="text" datatype="s4-20" style="ime-mode:disabled;text-transform:uppercase;">
              <a id="verifyCode" style="display:none;" href="javascript:;" onclick="ToggleCode(this, '/tools/verify_code.ashx');return false;"><img src="/tools/verify_code.ashx" width="80" height="22" /> 看不清楚？</a>
              <span class="Validform_checktip"></span>
              <i>（单击显示验证码，不区别大小写！）</i>
              
            </dd>
          </dl>
          
          <dl>
            <dt><em>*</em>注册条款：</dt>
            <dd>
              <input id="chkAgree" type="checkbox" value="1" name="chkAgree">
              <label for="chkAgree">我已仔细阅读并接受<a href="javascript:;" onclick="showWindow('regrules');">注册许可协议</a>。</label>
              <div id="regrules" title="注册许可协议" style="display:none;">1、在本站注册的会员，必须遵守《互联网电子公告服务管理规定》，不得在本站发表诽谤他人，侵犯他人隐私，侵犯他人知识产权，传播病毒，政治言论，商业讯息等信息。<br/>
2、在所有在本站发表的文章，本站都具有最终编辑权，并且保留用于印刷或向第三方发表的权利，如果你的资料不齐全，我们将有权不作任何通知使用你在本站发布的作品。
3、在登记过程中，您将选择注册名和密码。注册名的选择应遵守法律法规及社会公德。您必须对您的密码保密，您将对您注册名和密码下发生的所有活动承担责任。</div>
            </dd>
          </dl>
          
          <dl>
            <dt></dt>
            <dd>
              
              <input id="btnSubmit" name="btnSubmit" type="submit" class="btn_submit" value="注 册" disabled="disabled" />
              
            </dd>
          </dl>--%>
            <dl>
    <dt><span>*</span>&nbsp;姓名</dt>
    <dd><asp:TextBox ID="txtname" runat="server" CssClass="input normal" datatype="s3-50" nullmsg="请输入姓名" sucmsg=" " ajaxurl="/ashx/AdminVerification.ashx?action=adminusername"></asp:TextBox></dd>
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
    <dt><span>*</span>&nbsp;经销商编号</dt>
    <dd><asp:TextBox ID="txtDealerCode" runat="server" CssClass="input normal" datatype="*" nullmsg="请输入经销商编号！"></asp:TextBox></dd>
  </dl> 
<dl>
    <dt><span>*</span>&nbsp;经销商名称</dt>
    <dd><asp:TextBox ID="txtDealerName" runat="server" CssClass="input normal" datatype="*" nullmsg="请输入经销商名称！"></asp:TextBox></dd>
  </dl>
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
    <dd><asp:Button ID="Button1" runat="server" Text="注册" CssClass="btn" onclick="btnSubmit_Click" style="width:70px; text-align:center;padding:0;"/><input style="margin-left:10px;" type="button" value="登录" class="btn" onclick="location.href = 'login.aspx'" /></dd>
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
                  layer.alert('注册成功！账户会在1-2个工作日内开通', -1, !1);
              };
              $.ajax({
                  type: "get",
                  url: "/ashx/Ganged.ashx?action=city&code=" + $("#drpProvice").val(),
                  success: function (msg) {
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
