using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Common
{
    public class Rule
    {
        //public string GetBarCode(int i)
        //{
        //    char[] chars = {
        //                        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
        //                    };
        //    string str = string.Empty;
        //    Random rd = new Random(unchecked((int)DateTime.Now.Ticks));
        //    for (int j = 0; j < i; j++)
        //    {

        //        str += chars[rd.Next(0, 9)].ToString();
        //    }
        //    return str;
        //}
        public string GetBarCode(int j)
        {
            char[] chars = {
                                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
                            };
            string code = string.Empty;
            for (int i = 0; i < j; i++)
            {
                //这里是关键，传入一个seed参数即可保证生成的随机数不同            
                //Random rnd = new Random(unchecked((int)DateTime.Now.Ticks));
                Random rnd = new Random(GetRandomSeed());
                code += chars[rnd.Next(1, 9)].ToString();
            }
            return code;
        }
        static int GetRandomSeed()
        {
            byte[] bytes = new byte[4];
            System.Security.Cryptography.RNGCryptoServiceProvider rng = new System.Security.Cryptography.RNGCryptoServiceProvider();
            rng.GetBytes(bytes);
            return BitConverter.ToInt32(bytes, 0);
        }
    }
}
