using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            NDataBind(Rptn1, 0);
            NDataBind(Rptn2, 1);
            NDataBind(Rptn3, 2);
            news temp=PBind(0);
            img1.Src = temp.listpicture;
            a1.HRef="newsshow.aspx?nid="+temp.id.ToString();
            temp = PBind(1);
            img2.Src = temp.listpicture;
            a2.HRef = "newsshow.aspx?nid=" + temp.id.ToString();
            temp = PBind(2);
            img3.Src = temp.listpicture;
            a3.HRef = "newsshow.aspx?nid=" + temp.id.ToString();
            using (var db = new SiewebEntities())
            {
                var top = from it in db.news
                          where it.lang == 0 && it.iftop == true
                          orderby it.updatetime descending
                          select it;
                RptTop1.DataSource = top.ToList().Take(5);
                RptTop1.DataBind();
                RptTop2.DataSource = top.ToList().Take(5);
                RptTop2.DataBind();
            }
        }
    }

    protected void NDataBind(Repeater rp,int i)
    {
        using(var db = new SiewebEntities())
        {
            var se = from it in db.news
                     where it.lang == 0 && it.newclass == i
                     orderby it.updatetime descending
                     select it;
            rp.DataSource = se.Take(8).ToList();
            rp.DataBind();
        }
    }

    protected news PBind(int i)
    {
        news re=new news();
        try
        {
            using (var db = new SiewebEntities())
            {
                news m = db.news.FirstOrDefault(a => a.lang == 0 && a.newclass == i);
                re = m;
            }
        }
        catch
        {
            re.id = 0;
            re.listpicture = "";
        }
        return re;
    }

   
}