using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newsshow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            int nid = -1;
            try
            {
                nid = Convert.ToInt32(Request.QueryString["nid"].ToString());
                using (var db = new SiewebEntities())
                {
                    var se = from it in db.news
                             where it.id == nid
                             select it;
                    if (se.ToList().Count == 0)
                    {
                        Response.Redirect("newslist.aspx");
                    }
                    else
                    {
                        Rpt.DataSource = se.ToList();
                        Rpt.DataBind();
                    }
                }
            }
            catch
            {
                Response.Redirect("newslist.aspx");
            }
        }
    }
}