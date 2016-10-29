using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class files : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new SiewebEntities())
            {
                var fs = from it in db.files
                         orderby it.createtime descending
                         select it;
                Rpt.DataSource = fs.ToList();
                Rpt.DataBind();
            }
        }
    }

    protected void BtnTAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("fileAdd.aspx");
    }

    protected void Rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            int id =Convert.ToInt32(e.CommandArgument);
            using(var db = new SiewebEntities())
            {
                var fs = db.files.First(a => a.id == id);
                db.files.Remove(fs);
                db.SaveChanges();
                Response.Write("<script>alert('删除成功');location='files.aspx'</script>");
            }
        }
    }
}