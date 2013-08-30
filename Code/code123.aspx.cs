using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Code
{
    public partial class code123 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if ((string)Session["ValidateNumber"] == txt_input.Text.Trim())
            {
                Response.Write("剛剛輸入的是" + txt_input.Text + "<hr/>");
            }
            else
            {
                Label1.Text = "驗證碼錯誤";
                return;
            }
        }
    }
}