using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_teacherslist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        if (!IsPostBack)
        {
            int classid = 0;
            try
            {
                classid = Convert.ToInt32(Request.QueryString["classid"].ToString());

            }
            catch
            {
                classid = 0;
            }
            using(var db = new SiewebEntities())
            {
                var select = from it in db.news
                             where it.newclass == classid
                             orderby it.updatetime descending
                             select it;
                Rpt.DataSource = select.ToList();
                Rpt.DataBind();
            }
        }
    }

    protected void BtnTAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("addNews.aspx");
    }

    protected void Rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            using(var db = new SiewebEntities())
            {
                int nid = Convert.ToInt32(e.CommandArgument.ToString());
                var ne = db.news.FirstOrDefault(a => a.id == nid);
                db.news.Remove(ne);
                db.SaveChanges();
                Response.Write("<script>alert('删除成功');window.location.href='newslist.aspx'</script>");
            }
        }
    }

    protected void BtnQuery_Click(object sender, EventArgs e)
    {
        int classid = 0;
        try
        {
            classid = Convert.ToInt32(DdlSelect.SelectedValue.ToString());
        }
        catch
        {
            classid = 0;
        }
        Response.Redirect("newslist.aspx?classid=" + classid.ToString());
    }
}