using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editorTopPic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindPic();
        }
    }


    protected void bindPic()
    {
        using (var db = new SiewebEntities())
        {
            var data = from it in db.pics
                       orderby it.createtime descending
                       select it;
            ImgCurrentWorkPic1.ImageUrl = data.ToList()[0].picname;
            ImgCurrentWorkPic2.ImageUrl = data.ToList()[1].picname;
            ImgCurrentWorkPic3.ImageUrl = data.ToList()[2].picname;
        }
    
    }

    string uploadWorkPic3() //上传封面图片，返回文件名。
    {
        //int maxFileSize = 3145728; // 限制为3MiB以下
        if (fulPicture3.HasFile)
        {
            //取得文件MIME内容类型 
            string uploadFileType = this.fulPicture3.PostedFile.ContentType.ToLower();
            if (!uploadFileType.Contains("image"))    //图片的MIME类型为"image/xxx"，这里只判断是否图片。 
            {
                lblUploadMessage3.Visible = true;
                lblUploadMessage3.Text = "只能上传图片类型文件！";

                return "error";
            }
            string f1 = DateTime.Now.ToFileTime().ToString() + ".jpg";
            string path = "img/" + f1;
            fulPicture3.SaveAs(Server.MapPath("img/" + f1));
            lblUploadMessage3.Text = "上传成功";
            lblUploadMessage3.Visible = true;
            return path;
        }
        else
        {
            lblUploadMessage3.Text = "请选择文件";
            return null;

        }
    }


    string uploadWorkPic2() //上传封面图片，返回文件名。
    {
        //int maxFileSize = 3145728; // 限制为3MiB以下
        if (fulPicture2.HasFile)
        {
            //取得文件MIME内容类型 
            string uploadFileType = this.fulPicture2.PostedFile.ContentType.ToLower();
            if (!uploadFileType.Contains("image"))    //图片的MIME类型为"image/xxx"，这里只判断是否图片。 
            {
                lblUploadMessage2.Visible = true;
                lblUploadMessage2.Text = "只能上传图片类型文件！";

                return "error";
            }
            string f1 = DateTime.Now.ToFileTime().ToString() + ".jpg";
            string path = "img/" + f1;
            fulPicture2.SaveAs(Server.MapPath("img/" + f1));
            lblUploadMessage2.Text = "上传成功";
            lblUploadMessage2.Visible = true;
            return path;
        }
        else
        {
            lblUploadMessage2.Text = "请选择文件";
            return null;

        }
    }


     string uploadWorkPic1() //上传封面图片，返回文件名。
    {
        try
        {
            //int maxFileSize = 3145728; // 限制为3MiB以下
            if (fulPicture1.HasFile)
            {
                //取得文件MIME内容类型 
                string uploadFileType = this.fulPicture1.PostedFile.ContentType.ToLower();
                if (!uploadFileType.Contains("image"))    //图片的MIME类型为"image/xxx"，这里只判断是否图片。 
                {
                    lblUploadMessage1.Visible = true;
                    lblUploadMessage1.Text = "只能上传图片类型文件！";

                    return "error";
                }
                string f1 = DateTime.Now.ToFileTime().ToString() + ".jpg";
                string path = "img/" + f1;
                fulPicture1.SaveAs(Server.MapPath("img/" + f1));
                lblUploadMessage1.Text = "上传成功";
                lblUploadMessage1.Visible = true;
                return path;
            }
            else
            {
                lblUploadMessage1.Text = "请选择文件";
                return null;
            }
        }
        catch { return null; }
    }

    protected void submit_Click(object sender, EventArgs e)
    {

        using (var db = new SiewebEntities())
        {
            if (uploadWorkPic1() != null)
            {
                var data1 = db.pics.FirstOrDefault(a => a.id == 1);
                string path1 = uploadWorkPic1();
                data1.picname = path1;
            }
            if (uploadWorkPic2() != null)
            {
                string path2 = uploadWorkPic2();
                var data2 = db.pics.FirstOrDefault(a => a.id == 2);
                data2.picname = path2;
            }
            if (uploadWorkPic3() != null)
            {
                string path3 = uploadWorkPic3();
                var data3 = db.pics.FirstOrDefault(a => a.id == 3);
                data3.picname = path3;
            }
                   
            db.SaveChanges();
            bindPic();
        }

    }
}