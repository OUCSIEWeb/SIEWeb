using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newslist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int classid = 0;
            try
            {
                classid= Convert.ToInt32(Request.QueryString["classid"].ToString());
            }
            catch
            {
                classid = 0;
            }
            using(var db = new SiewebEntities())
            {
                var se = from it in db.news
                         where it.newclass == classid
                         select it;
                Rpt.DataSource = se.ToList();
                Rpt.DataBind();
            }
        }
    }
}