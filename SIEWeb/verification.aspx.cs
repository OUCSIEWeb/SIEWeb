using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string validateNum = CreateRandomNum(4);
            CreateImage(validateNum);
            Session["ValidateNum"] = validateNum;
        }
    }
    //生产随机数
    private string CreateRandomNum(int NumCount)
    {
        string allChar = "0,1,2,3,4,5,6,7,8,9";
        string[] allCharArray = allChar.Split(',');//拆分成数组
        string randomNum = "";
        int temp = -1;                             //记录上次随机数的数值，尽量避免产生几个相同的随机数
        Random rand = new Random();
        for (int i = 0; i < NumCount; i++)
        {
            if (temp != -1)
            {
                rand = new Random(i * temp * ((int)DateTime.Now.Ticks));
            }
            int t = rand.Next(10);
            if (temp == t)
            {
                return CreateRandomNum(NumCount);
            }
            temp = t;
            randomNum += allCharArray[t];


        }
        return randomNum;
    }
    //生产图片
    private void CreateImage(string validateNum)
    {
        if (validateNum == null || validateNum.Trim() == string.Empty)
            return;
        //生成BitMap图像
        System.Drawing.Bitmap image = new System.Drawing.Bitmap(validateNum.Length * 12 + 12, 22);
        Graphics g = Graphics.FromImage(image);
        try
        {
            //生成随机生成器
            Random random = new Random();
            //清空图片背景
            g.Clear(Color.White);
            Font font = new System.Drawing.Font("Arial", 12, (System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic));
            System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);
            g.DrawString(validateNum, font, brush, 2, 2);
            //画图片的边框线
            g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            //将图像保存到指定流
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            Response.ClearContent();
            Response.ContentType = "image/Gif";
            Response.BinaryWrite(ms.ToArray());
        }
        finally
        {
            g.Dispose();
            image.Dispose();
        }
    }
}