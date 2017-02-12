using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pageShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
                using(var db = new SiewebEntities())
                {
                    var pa = from it in db.pages
                             where it.id == pid
                             select it;
                    if (pa.ToList().Count == 0)
                    {
                        Response.Redirect("index.aspx");
                    }else
                    {
                        Rpt.DataSource = pa.ToList();
                        Rpt.DataBind();
                        var se = pa.ToList().First();
                        Session["belong"] = se.belong;
                    }
                }
            }
            catch
            {
                Response.Redirect("index.aspx");
            }
        }
    }
}