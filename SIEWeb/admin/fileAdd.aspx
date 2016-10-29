<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminPage.master" AutoEventWireup="true" CodeFile="fileAdd.aspx.cs" Inherits="admin_fileAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    文件标题:<br />
    <asp:TextBox runat="server" ID="TxtTitle" ></asp:TextBox><br />
    选择文件:<br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Label ID="LabMessage" runat="server" ></asp:Label><br />
    <asp:Button runat="server" Text="提交" ID="BtnOk" OnClick="BtnOk_Click" />

</asp:Content>

