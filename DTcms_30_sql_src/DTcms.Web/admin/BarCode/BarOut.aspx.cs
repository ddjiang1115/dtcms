using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.admin.BarCode
{
    public partial class BarOut : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strName = FileUpload1.PostedFile.FileName;//使用fileupload控件获取上传文件的文件名
            if (strName != "")//如果文件名存在
            {
                bool fileOK = false;
                int i = strName.LastIndexOf(".");//获取。的索引顺序号，在这里。代表图片名字与后缀的间隔
                string kzm = strName.Substring(i);//获取文件扩展名的另一种方法 string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string newName = Guid.NewGuid().ToString();//生成新的文件名，保证唯一性

                string xiangdui = Server.MapPath( "/DownLoad/");//设置文件相对网站根目录的保存路径 ，~号表示当前目录，在此表示根目录下的images文件夹
               // string juedui = Server.MapPath("~\\DownLoad\\");//设置文件保存的本地目录绝对路径，对于路径中的字符“＼”在字符串中必须以“＼＼”表示，因为“＼”为特殊字符。或者可以使用上一行的给路径前面加上＠
                string newFileName = xiangdui + newName + kzm;
                if (FileUpload1.HasFile)//验证 FileUpload 控件确实包含文件
                {

                    String[] allowedExtensions = { ".xls"};
                    for (int j = 0; j < allowedExtensions.Length; j++)
                    {
                        if (kzm == allowedExtensions[j])
                        {
                            fileOK = true;
                        }
                    }
                }
                if (fileOK)
                {
                    FileUpload1.PostedFile.SaveAs(newFileName);//将图片存储到服务器上
                }
                else
                { 
                    
                }
            }
        }
    }
}