<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminPage.master" AutoEventWireup="true" CodeFile="fileAdd.aspx.cs" Inherits="admin_fileAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    文件标题:<br />
    <asp:TextBox runat="server" ID="TxtTitle" ></asp:TextBox><br />
    选择文件:<br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Label ID="LabMessage" runat="server" ></asp:Label><br />
    选择资料类型<br />
    <asp:DropDownList ID="DdlKind" runat="server">
       <asp:ListItem value="0">学生资料</asp:ListItem>
       <asp:ListItem value="1">办公资料</asp:ListItem>
	   <asp:ListItem value="4">报名表下载</asp:ListItem>
	  
    </asp:DropDownList>
    <br />
    <asp:Button runat="server" Text="提交" ID="BtnOk" OnClick="BtnOk_Click" />

</asp:Content>

