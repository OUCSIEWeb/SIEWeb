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
        if (!IsPostBack) {
            int tid = -1;
            try
            {
                tid = Convert.ToInt32(Request.QueryString["tid"].ToString());
                using(var db = new SiewebEntities())
                {

                    var tea = db.teachers.First(a => a.id == tid);
                    TxtName.Text = tea.tname;
                    TxtDes.Text = tea.describe;
                    TxtEmail.Text = tea.email;
                    TxtPhone.Text = tea.phone.Replace("<br/>", "\n");
                    TxtTitle.Text = tea.title;
                    TxtPlace.Text = tea.place;
                    editor.InnerHtml = tea.body;
                }
            }
            catch
            {
                Response.Redirect("teacherslist.aspx");
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        int tid = -1;
        try
        {
            tid = Convert.ToInt32(Request.QueryString["tid"].ToString());
            using (var db = new SiewebEntities())
            {
                string str = Server.HtmlDecode(editor.InnerHtml);
                var tea = db.teachers.FirstOrDefault(a => a.id == tid);
                tea.place = TxtPlace.Text.Trim();
                tea.tname = TxtName.Text.Trim();
                tea.phone = TxtPhone.Text.Replace("\n", "<br/>");
                tea.title = TxtTitle.Text.Trim();
                tea.body = str;
                tea.updatetime = DateTime.Now;
                tea.describe = TxtDes.Text;
                tea.email = TxtEmail.Text.Trim();
                db.SaveChanges();
                Response.Write("<script>alert('修改成功');window.location.href='teacherslist.aspx'</script>");
            }
        }
        catch
        {
            Response.Redirect("<script>alert('修改失败');window.location.href='teacherslist.aspx'</script>");
        }
    }
}