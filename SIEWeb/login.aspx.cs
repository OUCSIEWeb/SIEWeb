using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnOK_Click(object sender, EventArgs e)
    {
        string verstring = Session["ValidateNum"].ToString();
        if (TextBox1.Text.Trim() == verstring)
        {
            Response.Write("<script>alert('正确')</script>");
        }
        else{
            Response.Write("<script>alert('错误')</script>");
        }
    }
}