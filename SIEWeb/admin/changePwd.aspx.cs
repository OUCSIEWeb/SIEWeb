using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_changePwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adid"] == null)
            Response.Redirect("Login.aspx");

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (TxtNewPassword.Text.Trim() == "" || TxtNewPassword.Text.Trim() == "")
        {
            Response.Write("<script>alert('密码不能为空')</script>");
            return;
        
        }
        int flag = 0;
        int id = Convert.ToInt32(Session["adid"]);
        try
        {
            
            using (var db = new SiewebEntities())
            {
                var ad = from it in db.admins
                         where it.id == id
                         select it;
                var ad2 = ad.ToList();
                for (int i = 0; i < ad2.Count; i++)
                {
                    if (PasswordHash.PasswordHash.ValidatePassword(TxtOldPassword.Text, ad2[i].password))
                    {
                        flag = 1;
                    }
                }
               
            }
             if(flag==0)
             {
                 Response.Write("<script>alert('密码错误')</script>");
             }
             else
             {
                      
                using (var db2 = new SiewebEntities())
                {
                    //var newad = new admins();
                    admins newad = db2.admins.SingleOrDefault(a => a.id == id);
                    //new 
                    newad.password = PasswordHash.PasswordHash.CreateHash(TxtNewPassword.Text);
                    newad.createtime = newad.createtime;
                    newad.updatetime = DateTime.Now;
                    //db2.admins.Add(newad);
                    db2.SaveChanges();
                    Session.Clear();
                    Response.Write("<script>alert('修改成功，请重新登录');location='Login.aspx'</script>");
                }
            }
           
        }
        catch(Exception ex)
        {
            Response.Redirect("Login.aspx");
            //Response.Write(ex);
        
        }
    }
    
}