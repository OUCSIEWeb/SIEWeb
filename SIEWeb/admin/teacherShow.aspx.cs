using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacherShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["belong"] = 0;
            try
            {
                int tid = Convert.ToInt32(Request.QueryString["tid"].ToString());
                using(var db = new SiewebEntities())
                {
                    var se = from it in db.teacher
                             where it.id == tid
                             select it;
                    if (se.ToList().Count == 0) Response.Redirect("teachers.aspx");
                    Rpt.DataSource = se.ToList();
                    Rpt.DataBind();
                }
            }
            catch
            {
                Response.Redirect("teachers.aspx");
            }
        }
    }
}