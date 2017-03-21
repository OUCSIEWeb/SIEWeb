using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addPage : System.Web.UI.Page
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
                    var ne = db.news.FirstOrDefault(a => a.id == nid);
                    TxtTitle.Text = ne.title;
                    DdlSelect.SelectedValue = ne.newclass.ToString();
                    editor.InnerHtml = ne.body;
                }
            }
            catch
            {
                Response.Redirect("newslist.aspx");
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        int nid = -1;
        try
        {
            using (var db = new SiewebEntities())
            {
                nid = Convert.ToInt32(Request.QueryString["nid"].ToString());
                string str = Server.HtmlDecode(editor.InnerHtml);
                var page = db.news.FirstOrDefault(a => a.id == nid);
                page.title = TxtTitle.Text.Trim();
                page.body = str;
                page.updatetime = DateTime.Now;
                int belo = Convert.ToInt32(DdlSelect.SelectedValue);
                page.newclass = belo;
                string topName, listName, topPath, listPath;
                if (filedtop.HasFile)
                {
                    string savePath = Server.MapPath("~/admin/upload/");//指定上传文件在服务器上的保存路径
                                                                        //检查服务器上是否存在这个物理路径，如果不存在则创建
                    if (!System.IO.Directory.Exists(savePath))
                    {
                        System.IO.Directory.CreateDirectory(savePath);
                    }
                    string Extension = Path.GetExtension(filedtop.FileName); //获取后缀名
                    if (Extension == ".jpg" || Extension == ".png" || Extension == ".gif" || Extension == ".bmp")
                    {
                        string fname = DateTime.Now.ToString("yyyyMMddHHmmssffff"); //当前时间作为文件名
                        topName = "/admin/upload/" + fname + Extension;  //存在数据库中的路径
                        topPath = savePath + "\\" + fname + Extension;
                        filedtop.SaveAs(topPath);
                        Lbltips1.InnerText = "";
                        page.toppicture = topName;
                    }
                    else
                    {
                        Lbltips1.InnerText = "图片格式不正确";
                        return;
                    }
                }
                if (filedlist.HasFile)
                {
                    string savePath = Server.MapPath("~/admin/upload/");//指定上传文件在服务器上的保存路径
                                                                        //检查服务器上是否存在这个物理路径，如果不存在则创建
                    if (!System.IO.Directory.Exists(savePath))
                    {
                        System.IO.Directory.CreateDirectory(savePath);
                    }
                    string Extension = Path.GetExtension(filedlist.FileName); //获取后缀名
                    if (Extension == ".jpg" || Extension == ".png" || Extension == ".gif" || Extension == ".bmp")
                    {
                        string fname = DateTime.Now.ToString("yyyyMMddHHmmssffff"); //当前时间作为文件名
                        listName = "/admin/upload/" + fname + Extension;  //存在数据库中的路径
                        listPath = savePath + "\\" + fname + Extension;
                        filedlist.SaveAs(listPath);
                        Lbltips2.InnerText = "";
                        page.listpicture = listName;
                    }
                    else
                    {
                        Lbltips2.InnerText = "图片格式不正确";
                        return;
                    }
                }
                db.SaveChanges();
                Response.Write("<script>alert('修改成功');window.location.href='newslist.aspx'</script>");
            }
        }
        catch
        {
            Response.Redirect("newslist.aspx");
        }
    }
}