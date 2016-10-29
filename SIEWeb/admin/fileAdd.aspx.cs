using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_fileAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string savePath = Server.MapPath("~/admin/upload/");//指定上传文件在服务器上的保存路径
                                                          //检查服务器上是否存在这个物理路径，如果不存在则创建
            if (!System.IO.Directory.Exists(savePath))
            {
                System.IO.Directory.CreateDirectory(savePath);
            }
            string Extension = Path.GetExtension(FileUpload1.FileName); //获取后缀名
            string fname = DateTime.Now.ToString("yyyyMMddHHmmssffff"); //当前时间作为文件名
            string finalname = "/admin/upload/" + fname + Extension;  //存在数据库中的路径
            savePath = savePath + "\\" + fname+Extension;
            try
            {
                FileUpload1.SaveAs(savePath);
                using(var db = new SiewebEntities())
                {
                    var fs = new files();
                    fs.title = TxtTitle.Text;
                    fs.filename = finalname;
                    fs.createtime = DateTime.Now;
                    db.files.Add(fs);
                    db.SaveChanges();
                    Response.Write("<script>alert('添加成功');window.location.href='files.aspx'</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('添加失败')</script>");
            }
        }
        else
        {
            LabMessage.Text = "你还没有选择上传文件!";
        }
    }
}