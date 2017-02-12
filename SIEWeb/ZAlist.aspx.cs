using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZAlist : System.Web.UI.Page
{
    int classid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //using(var db = new SiewebEntities())
            //{
            //    var se = from it in db.news
            //             where it.newclass == classid
            //             select it;
            //    Rpt.DataSource = se.ToList();
            //    Rpt.DataBind();
            //}
            titleBind(classid);
            Session["pagenum"] = 1;
            int currentPage = 1;
            int pageSize = 10;
            ArticlesBind(currentPage, pageSize);
        }
    }

    void titleBind(int titleId)
    {
        if (titleId == 6)
        {
            lbKind.Text = "中美合作项目";
           // notice_li.Attributes["class"] = "";
            student_li.Attributes["class"] = "";
            // news_li.Attributes["class"] = "on";
            Li3.Attributes["class"] = "on";
        }
        if (titleId == 7)
        {
            lbKind.Text = "中澳合作项目";
            //notice_li.Attributes["class"] = "on";
            student_li.Attributes["class"] = "on";
            // news_li.Attributes["class"] = "";
            Li3.Attributes["class"] = "";
        }
    }

    void ArticlesBind(int CurrentPage, int PageSize) //文章绑定
    {
        try
        {
            classid = Convert.ToInt32(Request.QueryString["classid"].ToString());
            titleBind(classid);
        }
        catch
        {
            classid = 0;
            titleBind(classid);
        }
        using (var db = new SiewebEntities())
        {
            var se = from items in db.news
                     where items.newclass == classid
                     orderby items.id descending
                     select new { items.id, items.title, items.newclass, items.createtime, items.body, items.updatetime };
            int totalAmount = se.Count();
            Session["pageCount"] = Math.Ceiling((double)totalAmount / (double)PageSize); //总页数，向上取整
            lbTotal.Text = Math.Ceiling((double)totalAmount / (double)PageSize).ToString();
            se = se.Skip(PageSize * (CurrentPage - 1)).Take(PageSize); //分页
            Rpt.DataSource = se.ToList();
            Rpt.DataBind();

        }
    }

    int getPageCount(int pageSize) //获得总页数
    {
        try
        {
            classid = Convert.ToInt32(Request.QueryString["classid"].ToString());
            titleBind(classid);
        }
        catch
        {
            classid = 0;
            titleBind(classid);
        }

        int pageCount = 1;
        if (Session["pageCount"] == null)
        {
            using (var db = new SiewebEntities())
            {
                var se = from it in db.news
                         where it.newclass == classid
                         select it;
                int totalAmount = se.Count();
                pageCount = (int)Math.Ceiling((double)totalAmount / (double)pageSize); //总页数，向上取整
            }
            Session["pageCount"] = pageCount;
        }
        else
        {
            pageCount = Convert.ToInt32(Session["pageCount"]);
        }
        return pageCount;
    }



    int getPageNum() //获得当前文本框中的合法数字页码
    {
        int pageNum = Convert.ToInt16(Session["pagenum"]);
        lbNow.Text = Session["pagenum"].ToString();
        return pageNum;
    }

    protected void BtnPreviousPage_Click(object sender, EventArgs e)
    {
        int pageNum = Convert.ToInt16(Session["pagenum"]) - 1;
        int pageSize = 10;
        if (pageNum < 1)
        {
            pageNum = 1;
            return;
        }
        Session["pagenum"] = pageNum;
        ArticlesBind(pageNum, pageSize);
        TxtPageNum.Text = pageNum.ToString();
        lbNow.Text = TxtPageNum.Text;
    }

    protected void BtnNextPage_Click(object sender, EventArgs e)
    {
        int pageNum = Convert.ToInt16(Session["pagenum"]) + 1;
        int pageSize = 10;
        if (pageNum >= getPageCount(pageSize))
        {
            pageNum = getPageCount(pageSize);
        }
        Session["pagenum"] = pageNum;
        ArticlesBind(pageNum, pageSize);
        TxtPageNum.Text = pageNum.ToString();
        lbNow.Text = TxtPageNum.Text;
    }

    protected void BtnHomePage_Click(object sender, EventArgs e)
    {
        ArticlesBind(1, 10);
        TxtPageNum.Text = "1";
        lbNow.Text = TxtPageNum.Text;
        Session["pagenum"] = 1;
    }

    protected void BtnTrailerPage_Click(object sender, EventArgs e)
    {
        int pageSize = 10;
        int pageNum = getPageCount(pageSize);
        if (pageNum <= 0) //没有内容的情况
        {
            pageNum = 1;
        }
        Session["pagenum"] = pageNum;
        ArticlesBind(pageNum, pageSize);
        TxtPageNum.Text = pageNum.ToString();
        lbNow.Text = TxtPageNum.Text;
    }

    protected void BtnJumpPage_Click(object sender, EventArgs e)
    {
        int pageNum;
        if (!Filter.IsNumeric(TxtPageNum.Text) || TxtPageNum.Text.Length > 8)
            pageNum = 1;
        else
            pageNum = Convert.ToInt32(TxtPageNum.Text);
        int pageSize = 10;
        int pageCount = getPageCount(pageSize);
        if (pageNum < 1)
        {
            pageNum = 1;
        }
        else if (pageNum > pageCount)
        {
            pageNum = getPageCount(pageSize);
        }
        Session["pagenum"] = pageNum;
        ArticlesBind(pageNum, pageSize);
        TxtPageNum.Text = pageNum.ToString();
        lbNow.Text = TxtPageNum.Text;
    }

}