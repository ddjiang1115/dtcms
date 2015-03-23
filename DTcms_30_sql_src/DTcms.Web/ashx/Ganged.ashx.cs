using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
namespace DTcms.Web.ashx
{
    /// <summary>
    /// Ganged 的摘要说明
    /// </summary>
    public class Ganged : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string action = context.Request.QueryString["action"];
            string code = context.Request.QueryString["code"];
            string result=string.Empty;
            BLL.t_address_city bll_city = new BLL.t_address_city();
            BLL.t_address_town bll_town = new BLL.t_address_town();
            switch (action)
            { 
                case "city":
                    if (bll_city.GetCityByCode(code) != null)
                        result = JsonConvert.SerializeObject(bll_city.GetCityByCode(code), new DataTableConverter());
                    context.Response.Write(result);
                    break;
                case "town":
                    if (bll_town.GetTownByCode(code) != null)
                        result = JsonConvert.SerializeObject(bll_town.GetTownByCode(code), new DataTableConverter());
                    context.Response.Write(result);
                    break;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}