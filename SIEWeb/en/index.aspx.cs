using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected int i = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            NDataBind(Rptn1, 0);
            NDataBind(Rptn2, 1);
            NDataBind(Rptn3, 2);
            news temp=PBind(0);
            img1.Src ="../"+ temp.listpicture;
            a1.HRef="newsshow.aspx?nid="+temp.id.ToString();
            temp = PBind(1);
            img2.Src = "../" + temp.listpicture;
            a2.HRef = "newsshow.aspx?nid=" + temp.id.ToString();
            temp = PBind(2);
            img3.Src = "../" + temp.listpicture;
            a3.HRef = "newsshow.aspx?nid=" + temp.id.ToString();
            bindTop1();
            bindTop2();
           
        }
    }

    protected void bindTop1()
    {
        using (var db = new SiewebEntities())
        {
            var se = from it in db.pics
                     select it;
            //RptTop1.DataSource = se.ToList();
            //RptTop1.DataBind();
            imgtop1.ImageUrl = "../admin/" + se.ToList()[0].picname;
            imgtop2.ImageUrl = "../admin/" + se.ToList()[1].picname;
            imgtop3.ImageUrl = "../admin/" + se.ToList()[2].picname;
        }
    
    }

    protected void NDataBind(Repeater rp,int i)
    {
        using(var db = new SiewebEntities())
        {
            var se = from it in db.news
                     where it.lang == 1 && it.newclass == i
                     orderby it.updatetime descending
                     select it;
            rp.DataSource = se.Take(8).ToList();
            rp.DataBind();
        }
    }


    protected void bindTop2()
    {
        using (var db = new SiewebEntities())
        {
            var top = from it in db.news
                        where it.lang == 1 && it.toppicture!=""
                        orderby it.updatetime descending
                        select it;
            RptTop2.DataSource = top.ToList().Take(3);
            RptTop2.DataBind();
        }
    }
    protected news PBind(int i)
    {
        news re = new news();
        try
        {
            using (var db = new SiewebEntities())
            {
                var se = from it in db.news
                         where it.lang == 1 && it.newclass == i
                         orderby it.updatetime descending
                         select it;
                for (int j = 0; j < se.ToList().Count; j++)
                {
                    if (se.ToList()[j].listpicture != "")
                        return se.ToList()[j];
                }
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