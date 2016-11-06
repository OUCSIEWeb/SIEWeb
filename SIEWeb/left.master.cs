using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_left : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int belong = Convert.ToInt32(Session["belong"].ToString());
            view(belong);
            Session["belong"] = null;
        }
        catch
        {
            Response.Redirect("index.aspx");
        }
    }

    protected void view(int belong)
    {
        if (belong == 0)
        {
            Div0.Visible = true;
        }
        else if (belong == 2)
        {
            Div1.Visible = true;
        }
        else if (belong == 3)
        {
            Div2.Visible = true;
        }
        else if (belong == 4)
        {
            Div3.Visible = true;
        }
        else if (belong == 5)
        {
            Div4.Visible = true;
        }
        else if(belong == 6)
        {
            Div5.Visible = true;
        }
        else if (belong == 7)
        {
            Div6.Visible = true;
        }
        else if (belong == 8)
        {
            Div7.Visible = true;
        }
        else if (belong == 9)
        {
            Div8.Visible = true;
        }

    }
}
