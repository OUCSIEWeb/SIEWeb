using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addPage : System.Web.UI.Page
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
                    var ne = db.news.FirstOrDefault(a => a.id == nid);
                    TxtTitle.Text = ne.title;
                    DdlSelect.SelectedValue = ne.newclass.ToString();
                    editor.InnerHtml = ne.body;
                }
            }
            catch
            {
                Response.Redirect("newslist.aspx");
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        int nid = -1;
        try
        {
            using (var db = new SiewebEntities())
            {
                nid = Convert.ToInt32(Request.QueryString["nid"].ToString());
                string str = Server.HtmlDecode(editor.InnerHtml);
                var page = db.news.FirstOrDefault(a => a.id == nid);
                page.title = TxtTitle.Text.Trim();
                page.body = str;
                page.updatetime = DateTime.Now;
                int belo = Convert.ToInt32(DdlSelect.SelectedValue);
                page.newclass = belo;

                db.SaveChanges();
                Response.Write("<script>alert('修改成功');window.location.href='newslist.aspx'</script>");
            }
        }
        catch
        {
            Response.Redirect("newslist.aspx");
        }
    }
}