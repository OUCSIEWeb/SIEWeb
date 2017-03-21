using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editorPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int pageId = 0;
            try
            {
                pageId = Convert.ToInt32(Request.QueryString["pid"].ToString());
                using (var db = new SiewebEntities())
                {
                    var page = db.pages.First(a => a.id == pageId);
                    LabTitle.Text = page.title;
                    editor.InnerHtml = page.body;
                }
            }
            catch
            {
                Response.Redirect("index.aspx");
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        int pageId = 0;
        try
        {
            pageId = Convert.ToInt32(Request.QueryString["pid"].ToString());
            using (var db = new SiewebEntities())
            {
                string str = Server.HtmlDecode(editor.InnerHtml);
                var page = db.pages.First(a => a.id == pageId);
                page.body = str;
                page.updatetime = DateTime.Now;
                db.SaveChanges();
                Response.Write("<script>alert('修改成功')</script>");
            }
        }
        catch
        {
            Response.Redirect("index.aspx");
        }
    }
}