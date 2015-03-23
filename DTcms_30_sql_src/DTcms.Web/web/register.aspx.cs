using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.IO;
using System.Net;
using System.Web;
namespace DTcms.Web.web
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public void Send()
        {
            String username = "ceshfj2";
            String password = "123456";
            String SendTime = "";
            String AppendID = "";

            String Contentsingle = "国都DEMO,测试消息";
            String Contentbatch = "国都DEMO,测试消息";
            String[] ContentsSynamic = { "国都DEMO,测试消息1", "国都DEMO,测试消息2" };

            String[] DesMobilesingle = { "13122216412" };
            String[] DesMobile2batch = { "15810708705", "15810708705" };
            String[] DesMobileSynamic = { "15810708705", "15810708705" };

            //GuoDuDEMO gd=new GuoDuDEMO();
            /*post方式发送单条消息*/
            String singleResponse = postSendMsg(username, password, Contentsingle, DesMobilesingle, AppendID, SendTime);
        }
        public String postSendMsg(String OperID, String OperPass, String Content, String[] DesMobiles, String AppendID, String SendTime)
        {
		/*将内容用URLEncoder编两次GBK*/
		String EncoderContent = "";
		try {
            EncoderContent = HttpUtility.UrlEncode(Content,System.Text.Encoding.GetEncoding("gbk"));
            EncoderContent = HttpUtility.UrlEncode(EncoderContent,System.Text.Encoding.GetEncoding("gbk"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		
		/*将手机号从数组转变成一个用逗号分开的字符串，字符串末尾有逗号不影响消息下发。*/
		String DesMobile="";
		for(int i=0;i<DesMobiles.Length;i++) {
    		//DesMobile = DesMobiles[i]+","+DesMobile;
            DesMobile = DesMobiles[i]  + DesMobile;
    	}
		
		/*url地址*/
		String URL="http://221.179.180.158:9008/HttpQuickProcess/submitMessageAll?";
		
		/*消息参数*/
		String str="OperID="+OperID+"&OperPass="+OperPass+"&SendTime="+SendTime+"&AppendID="+AppendID+"&DesMobile="+DesMobile+"&Content="+EncoderContent;
		
		Response.Write("发送的内容为："+str);
		/*使用post方式发送消息*/
        String response = this.GETFileData(URL+str);
		
		/*返回响应*/
		return response;
		
	}
    
        protected string GETFileData(string TheURL)
        {
            try
            {
                Uri uri = new Uri(TheURL);
                System.Net.HttpWebRequest request = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(uri);
                request.Method = "GET";
                request.ContentType = "application/x-www-form-urlencoded";
                request.AllowAutoRedirect = false;
                request.Timeout = 5000;
                System.Net.HttpWebResponse response = (System.Net.HttpWebResponse)request.GetResponse();
                Stream responseStream = response.GetResponseStream();
                StreamReader readStream = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                string retext = readStream.ReadToEnd().ToString();
                readStream.Close();
                return retext;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }
        public string GetHttp(string url, string queryString)
    {
        //string queryString = "?";

        //foreach (string key in httpContext.Request.QueryString.AllKeys)
        //{
        //    queryString += key + "=" + httpContext.Request.QueryString[key] + "&";
        //}

        //queryString = queryString.Substring(0, queryString.Length - 1);

        HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url  +"?"+queryString);

        httpWebRequest.ContentType = "application/json";
        httpWebRequest.Method = "GET";
        httpWebRequest.Timeout = 20000;

        //byte[] btBodys = Encoding.UTF8.GetBytes(body);
        //httpWebRequest.ContentLength = btBodys.Length;
        //httpWebRequest.GetRequestStream().Write(btBodys, 0, btBodys.Length);

        HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        StreamReader streamReader = new StreamReader(httpWebResponse.GetResponseStream());
        string responseContent = streamReader.ReadToEnd();

        httpWebResponse.Close();
        streamReader.Close();

        return responseContent;
    }


        protected void btnpost_Click(object sender, EventArgs e)
        {
            DoAdd();
        }
        #region 增加操作=================================
        private void DoAdd()
        {
            Model.users model = new Model.users();
            BLL.users bll = new BLL.users();

            model.group_id = 1;
            model.status = 0;
            //检测用户名是否重复
            //if (bll.Exists(txtUserName.Value.Trim()))
            //{
            //    return;
            //}
            model.user_name = Utils.DropHTML(tel.Value.Trim());
            //获得6位的salt加密字符串
            model.salt = Utils.GetCheckCode(6);
            //以随机生成的6位字符串做为密钥加密
            model.password = DESEncrypt.Encrypt(txtPassword.Value.Trim(),model.salt);
            model.reg_time = DateTime.Now;
            model.reg_ip = DTRequest.GetIP();
            model.mobile = tel.Value.Trim();
            if (bll.Add(model) > 0)
            {
                Session[DTKeys.SESSION_USER_INFO] = bll.GetModel(tel.Value.Trim());
                //AddAdminLog(DTEnums.ActionEnum.Add.ToString(), "添加用户:" + model.user_name); //记录日志
                Response.Redirect("/web/member.aspx");
            }
            //return result;
        }
        #endregion
    }
}