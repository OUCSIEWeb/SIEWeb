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

    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        using (var db = new SiewebEntities())
        {
            string str = Server.HtmlDecode(editor.InnerHtml);
            var page = new news();
            page.title = TxtTitle.Text.Trim();
            page.body = str;
            page.createtime = DateTime.Now;
            page.updatetime = DateTime.Now;
            int belo = Convert.ToInt32(DdlSelect.SelectedValue);
            page.newclass = belo;
            db.news.Add(page) ;
            db.SaveChanges();
            Response.Write("<script>alert('添加成功');</script>");
        }
    }
}