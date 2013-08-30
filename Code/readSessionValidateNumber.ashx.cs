using System.Web;

namespace Code
{
    /// <summary>
    /// readSessionValidateNumber 的摘要描述
    /// </summary>
    public class readSessionValidateNumber : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string ValidateNumber = (string)context.Session["ValidateNumber"];
            context.Response.Write(ValidateNumber);
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