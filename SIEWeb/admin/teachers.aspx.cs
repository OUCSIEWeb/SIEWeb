using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teachers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["belong"] = "0";
            using(var db = new SiewebEntities())
            {
                var se = from it in db.teacher
                         orderby it.title descending
                         select it;
                Rpt.DataSource = se.ToList();
                Rpt.DataBind();
                         
            }
        }
    }
}