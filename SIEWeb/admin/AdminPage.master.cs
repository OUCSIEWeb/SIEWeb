using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AdminPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 0;
        try
        {
            id = Convert.ToInt32(Session["adid"]);
        }
        catch
        {
            id = -1;
        }
        if (id == -1)
        {
            Response.Redirect("login.aspx");
        }
        else
        {try
            {
                using (var db=new SiewebEntities())
                {
                    var ad = db.admins.FirstOrDefault(a => a.id == id);
                    LabName.Text = ad.account;
                }
            }
            catch
            {
                Response.Redirect("login.aspx");
            }
        }
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("login.aspx");
    }
}
