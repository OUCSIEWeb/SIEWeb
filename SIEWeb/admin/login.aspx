<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SIE后台</title>
    <link rel="stylesheet" type="text/css" href="css/consoleStyle.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="img/后台头部logo.jpg" alt="">
        </div>
        <div class="main">
            <div class="loginMain">
                <div class="loginHeader">用户登录</div>
                <div class="loginBody">
                    <form id="form1" runat="server">
                        <asp:TextBox runat="server" ID="TxtAc" placeholder="用户名" ></asp:TextBox>
                         <asp:TextBox runat="server" ID="TxtPas" placeholder="密码" TextMode="Password"></asp:TextBox>
                         <asp:TextBox runat="server" ID="TxtVer" placeholder="验证码" class="yanzheng" ></asp:TextBox><asp:Image ID="Image1" imageUrl="~/verification.aspx"  runat="server"  width="155" height="60"/>
                        <asp:Button runat="server" CssClass="doubi" ID="BtnOk" OnClick="BtnOk_Click" Text="用户登录" />
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
