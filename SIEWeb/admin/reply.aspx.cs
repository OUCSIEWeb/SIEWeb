using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addPage : System.Web.UI.Page
{
    public string title, sname,body;
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
                    var ne = db.faqs.FirstOrDefault(a => a.id == nid);
                    title = ne.title;
                    sname = ne.sname;
                    body = ne.body;
                    editor.InnerHtml = ne.reply;
                }
            }
            catch
            {
                Response.Redirect("faqs.aspx");
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
                var page = db.faqs.FirstOrDefault(a => a.id == nid);
                page.reply = str;
                page.updatetime = DateTime.Now;
                page.state = 1;
                db.SaveChanges();
                Response.Write("<script>alert('回复成功');window.location.href='faqs.aspx'</script>");
            }
        }
        catch
        {
            Response.Redirect("faqs.aspx");
        }
    }
}