using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new SiewebEntities())
            {
                var se1 = from it in db.news
                          where it.newclass == 0
                          orderby it.updatetime 
                          descending select it;
                var se2 = from it in db.news
                          where it.newclass == 2
                          orderby it.updatetime 
                          descending select it;
                var se3 = from it in db.news
                          where it.newclass == 1
                          orderby it.updatetime
                          descending
                          select it;
                Rptnews1.DataSource = se1.Take(8).ToList();
                Rptnews1.DataBind();
                Rptnews2.DataSource = se2.Take(8).ToList();
                Rptnews2.DataBind();
                Repeater1.DataSource = se3.Take(8).ToList();
                Repeater1.DataBind();
            }
        }
    }
}