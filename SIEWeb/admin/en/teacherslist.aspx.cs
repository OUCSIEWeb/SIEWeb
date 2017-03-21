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
            //绑定        
            using (var db = new SiewebEntities())
            {
                var teas = from it in db.teacher
                           where it.lang==1
                           select it;
                RptTeacher.DataSource = teas.ToList();
                RptTeacher.DataBind();
            }

        }


    }

    protected void BtnTAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("addTeacher.aspx");
    }

    protected void RptTeacher_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            using(var db=new SiewebEntities())
            {
                string str = e.CommandArgument.ToString();
                int tid = Convert.ToInt32(e.CommandArgument.ToString());
                var tea = db.teacher.FirstOrDefault(a => a.id == tid);
                db.teacher.Remove(tea);
                db.SaveChanges();
                Response.Write("<script>alert('删除成功');window.location.href='teacherslist.aspx'</script>");
            }
        }
    }
}