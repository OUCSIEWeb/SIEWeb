<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Image ID="Image1" imageUrl="~/verification.aspx"  runat="server" />
        <asp:Button ID="BtnOK" runat="server" Text="Button" OnClick="BtnOK_Click" />
    </div>
    </form>
</body>
</html>
