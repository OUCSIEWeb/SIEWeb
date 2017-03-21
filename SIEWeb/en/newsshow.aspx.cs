using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newsshow : System.Web.UI.Page
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
                    var se = from it in db.news
                             where it.id == nid
                             select it;
                    news News = db.news.SingleOrDefault(a => a.id == nid);   
                    if (se.ToList().Count == 0)
                    {
                        Response.Redirect("newslist.aspx");
                    }
                    else
                    {
                        addStyle(News.newclass);
                        Rpt.DataSource = se.ToList();
                        Rpt.DataBind();
                    }
                }
            }
            catch
            {
                Response.Redirect("newslist.aspx");
            }
        }

      
    } 
    void addStyle(int classid)
    {
        if (classid == 0)
        {
            notice_li.Attributes["class"] = "";
            student_li.Attributes["class"] = "";
            news_li.Attributes["class"] = "on";
        }
        if (classid == 1)
        {
            notice_li.Attributes["class"] = "on";
            student_li.Attributes["class"] = "";
            news_li.Attributes["class"] = "";
        }
        if (classid == 2)
        {
            notice_li.Attributes["class"] = "";
            student_li.Attributes["class"] = "on";
            news_li.Attributes["class"] = "";
        }
        
        
    }
}