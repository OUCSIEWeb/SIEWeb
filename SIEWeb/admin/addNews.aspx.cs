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

    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        using (var db = new SiewebEntities())
        {
            string str = Server.HtmlDecode(editor.InnerHtml);
            var page = new news();
            string topName, listName,topPath,listPath;
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
                }
                else
                {
                    Lbltips1.InnerText = "图片格式不正确";
                    return;
                }
            }
            else
            {
                topName = "/images/banner_1.jpg";
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
                }
                else
                {
                    Lbltips2.InnerText = "图片格式不正确";
                    return;
                }
            }
            else
            {
                listName = "/images/picture.png";
            }
            page.toppicture = topName;
            page.listpicture = listName;
            page.iftop = true;
            page.title = TxtTitle.Text.Trim();
            page.body = str;
            page.createtime = DateTime.Now;
            page.updatetime = DateTime.Now;
            page.lang = 0;
            int belo = Convert.ToInt32(DdlSelect.SelectedValue);
            page.newclass = belo;
            db.news.Add(page);
            db.SaveChanges();
            Response.Write("<script>alert('添加成功');</script>");
        }
    }
}