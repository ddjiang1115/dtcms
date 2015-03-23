using System;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;
using System.Web.SessionState;
using DTcms.Common;

namespace DTcms.Web.tools
{
    /// <summary>
    /// 验证码生成类
    /// </summary>
    public class verify_code : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            int codeW = 80;
            int codeH = 22;
            int fontSize = 16;
            string chkCode = string.Empty;
            //颜色列表，用于验证码、噪线、噪点 
            Color[] color = { Color.Black, Color.Red, Color.Blue, Color.Green, Color.Orange, Color.Brown, Color.Brown, Color.DarkBlue };
            //字体列表，用于验证码 
            string[] font = { "Times New Roman", "Verdana", "Arial", "Gungsuh", "Impact" };
            //验证码的字符集，去掉了一些容易混淆的字符 
            char[] character = { '2', '3', '4', '5', '6', '8', '9', '1', '0'};
            Random rnd = new Random();
            //生成验证码字符串 
            for (int i = 0; i < 6; i++)
            {
                chkCode += character[rnd.Next(character.Length)];
            }
            //写入Session
            context.Session[DTKeys.SESSION_CODE] = chkCode;
            //创建画布
            Bitmap bmp = new Bitmap(codeW, codeH);
            Graphics g = Graphics.FromImage(bmp);
            g.Clear(Color.White);
            //画噪线 
            for (int i = 0; i < 1; i++)
            {
                int x1 = rnd.Next(codeW);
                int y1 = rnd.Next(codeH);
                int x2 = rnd.Next(codeW);
                int y2 = rnd.Next(codeH);
                Color clr = color[rnd.Next(color.Length)];
                g.DrawLine(new Pen(clr), x1, y1, x2, y2);
            }
            //画验证码字符串 
            for (int i = 0; i < chkCode.Length; i++)
            {
                string fnt = font[rnd.Next(font.Length)];
                Font ft = new Font(fnt, fontSize);
                Color clr = color[rnd.Next(color.Length)];
                g.DrawString(chkCode[i].ToString(), ft, new SolidBrush(clr), (float)i * 18 + 2, (float)0);
            }
            //画噪点 
            for (int i = 0; i < 100; i++)
            {
                int x = rnd.Next(bmp.Width);
                int y = rnd.Next(bmp.Height);
                Color clr = color[rnd.Next(color.Length)];
                bmp.SetPixel(x, y, clr);
            }
            //清除该页输出缓存，设置该页无缓存 
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = System.DateTime.Now.AddMilliseconds(0);
            context.Response.Expires = 0;
            context.Response.CacheControl = "no-cache";
            context.Response.AppendHeader("Pragma", "No-Cache");
            //将验证码图片写入内存流，并将其以 "image/Png" 格式输出 
            MemoryStream ms = new MemoryStream();
            try
            {
                bmp.Save(ms, ImageFormat.Png);
                context.Response.ClearContent();
                context.Response.ContentType = "image/Png";
                context.Response.BinaryWrite(ms.ToArray());
                Send(context, context.Request.QueryString["tel"], "您正在注册新账户，短信校验码" + chkCode + "，请尽快按页面提示提交校验码 【 联沛】");
                //Send(context, context.Request.QueryString["tel"], chkCode);
            }
            finally
            {
                //显式释放资源 
                bmp.Dispose();
                g.Dispose();
            }
        }
        public void Send(HttpContext context, string tel, string Contentsingle)
        {
            String username = "ceshfj2";
            String password = "123456";
            String SendTime = "";
            String AppendID = "";

            //String Contentsingle = "国都DEMO,测试消息";
            String Contentbatch = "国都DEMO,测试消息";
            String[] ContentsSynamic = { "国都DEMO,测试消息1", "国都DEMO,测试消息2" };
            
            //String[] DesMobilesingle = { "13122216412" };
            //String[] DesMobile2batch = { "15810708705", "15810708705" };
            //String[] DesMobileSynamic = { "15810708705", "15810708705" };

            //GuoDuDEMO gd=new GuoDuDEMO();
            /*post方式发送单条消息*/
            String singleResponse = postSendMsg(username, password, Contentsingle, tel, AppendID, SendTime,context);
        }
        public String postSendMsg(String OperID, String OperPass, String Content, string tel, String AppendID, String SendTime, HttpContext context)
        {
            /*将内容用URLEncoder编两次GBK*/
            String EncoderContent = "";
            try
            {
                EncoderContent = HttpUtility.UrlEncode(Content, System.Text.Encoding.GetEncoding("gbk"));
                EncoderContent = HttpUtility.UrlEncode(EncoderContent, System.Text.Encoding.GetEncoding("gbk"));
            }
            catch (Exception e)
            {
                // TODO Auto-generated catch block
                //e.printStackTrace();
            }

            /*将手机号从数组转变成一个用逗号分开的字符串，字符串末尾有逗号不影响消息下发。*/
            String DesMobile = "";
            //for (int i = 0; i < DesMobiles.Length; i++)
            //{
            //    DesMobile = DesMobiles[i]+","+DesMobile;
            //}
            DesMobile = tel;
            /*url地址*/
            String URL = "http://221.179.180.158:9008/HttpQuickProcess/submitMessageAll?";

            /*消息参数*/
            String str = "OperID=" + OperID + "&OperPass=" + OperPass + "&SendTime=" + SendTime + "&AppendID=" + AppendID + "&DesMobile=" + DesMobile + "&Content=" + EncoderContent;

            context.Response.Write("发送的内容为：" + str);
            /*使用post方式发送消息*/
            String response = this.GETFileData(URL + str);

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
        //public string GetHttp(string url, string queryString)
        //{
        //    //string queryString = "?";

        //    //foreach (string key in httpContext.Request.QueryString.AllKeys)
        //    //{
        //    //    queryString += key + "=" + httpContext.Request.QueryString[key] + "&";
        //    //}

        //    //queryString = queryString.Substring(0, queryString.Length - 1);

        //    HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url + "?" + queryString);

        //    httpWebRequest.ContentType = "application/json";
        //    httpWebRequest.Method = "GET";
        //    httpWebRequest.Timeout = 20000;

        //    //byte[] btBodys = Encoding.UTF8.GetBytes(body);
        //    //httpWebRequest.ContentLength = btBodys.Length;
        //    //httpWebRequest.GetRequestStream().Write(btBodys, 0, btBodys.Length);

        //    HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        //    StreamReader streamReader = new StreamReader(httpWebResponse.GetResponseStream());
        //    string responseContent = streamReader.ReadToEnd();

        //    httpWebResponse.Close();
        //    streamReader.Close();

        //    return responseContent;
        //}
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
