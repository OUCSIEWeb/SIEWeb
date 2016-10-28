using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void BtnOk_Click(object sender, EventArgs e)
    {
        string ver = Session["ValidateNum"].ToString();
        if (ver == TxtVer.Text.Trim())
        {
            //以下注释代码为用户注册
            //
            //
            //using (var db = new SiewebEntities())
            //{
            //    var ve = from it in db.admins
            //             where it.account == TxtAc.Text
            //             select it;
            //    if (ve.LongCount() == 0)
            //    {
            //        var ad = new admins();
            //        ad.account = TxtAc.Text;
            //        ad.password = PasswordHash.PasswordHash.CreateHash(TxtPas.Text);
            //        ad.createtime = DateTime.Now;
            //        ad.updatetime = DateTime.Now;
            //        db.admins.Add(ad);
            //        db.SaveChanges();
            //        Response.Write("<script>alert('注册成功')</script>");
            //    }
            //}
            //
            //用户登录验证
            //
            //
            using(var db = new SiewebEntities())
            {
                var ad = from it in db.admins
                         where it.account == TxtAc.Text.Trim()
                         select it;
                var ad2=ad.ToList();
                for(int i = 0; i < ad2.Count; i++)
                {
                    if (PasswordHash.PasswordHash.ValidatePassword(TxtPas.Text, ad2[i].password))
                    {
                        Session["adid"] = ad.First().id;
                        Response.Write("<script>alert('登录成功');window.location.href='index.aspx'</script>");
                        return;
                    }
                }
                Response.Write("<script>alert('用户名或密码错误')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('验证码错误')</script>");
        }
    }
}