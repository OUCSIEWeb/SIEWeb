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
            var tea = new teachers();
            tea.place = TxtPlace.Text.Trim();
            tea.tname = TxtName.Text.Trim();
            tea.phone = TxtPhone.Text.Replace("\n", "<br/>");
            tea.title = TxtTitle.Text.Trim();
            tea.body = Server.HtmlDecode(editor.InnerHtml);
            tea.lang = 0;
            tea.createtime = DateTime.Now;
            tea.updatetime = DateTime.Now;
            tea.describe = TxtDes.Text;
            tea.email = TxtEmail.Text.Trim();
            db.teachers.Add(tea);
            db.SaveChanges();
            Response.Write("<script>alert('添加成功');window.location.href='teacherslist.aspx'</script>");
        }
    }
}