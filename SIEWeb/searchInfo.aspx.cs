using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class searchInfo : System.Web.UI.Page
{
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
            if (Session["searchInfo"] == null || Session["searchInfo"]=="")
                Response.Redirect("index.aspx");
            Session["pagenum"] = 1;
            int currentPage = 1;
            int pageSize = 10;
            ArticlesBind(currentPage, pageSize);
        }
    }


    void ArticlesBind(int CurrentPage, int PageSize) //文章绑定
    {
        string searchInfo;
        try
        {
            searchInfo = Session["searchInfo"].ToString();
             using (var db = new SiewebEntities())
            {
                var se = from items in db.news
                         where items.title.Contains(searchInfo)
                         orderby items.id descending
                         select new { items.id, items.title, items.newclass, items.createtime, items.body, items.updatetime};
                int totalAmount = se.Count();
                if (totalAmount > 0)
                {
                    Session["pageCount"] = Math.Ceiling((double)totalAmount / (double)PageSize); //总页数，向上取整
                    lbTotal.Text = Math.Ceiling((double)totalAmount / (double)PageSize).ToString();
                    se = se.Skip(PageSize * (CurrentPage - 1)).Take(PageSize); //分页
                    Rpt.DataSource = se.ToList();
                    Rpt.DataBind();
                }
                else
                {
                    rep.Visible = false;
                    lbNone.Text = "没有找到与" + Session["searchInfo"].ToString() + "相关的信息";
                    lbNone.Visible = true;
                
                
                }
            }
        }
        catch
        {
              Response.Redirect("index.aspx");
        }
      
    }
  
    int getPageCount(int pageSize) //获得总页数
    {
        string searchInfo;
        try
        {
            searchInfo = Session["searchInfo"].ToString();
            int pageCount = 1;
            if (Session["pageCount"] == null)
            {
                using (var db = new SiewebEntities())
                {
                    var se = from it in db.news
                             where it.title.Contains(searchInfo)
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
        catch
        {
            Response.Redirect("index.aspx");
            return 0;
        }
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