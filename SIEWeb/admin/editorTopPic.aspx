<%@ Page Language="C#" MasterPageFile="~/admin/AdminPage.master"  validateRequest="false"  AutoEventWireup="true" CodeFile="editorTopPic.aspx.cs" Inherits="admin_editorTopPic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" charset="utf-8" src="utf8-net/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-net/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="utf8-net/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1><strong>请上传1190×400px大小的图片</strong></h1>
    当前图片一：<asp:Image ID="ImgCurrentWorkPic1" runat="server"  Width="300px" Height="90px"/>
    <br />
    <asp:FileUpload ID="fulPicture1" runat="server" />
    <asp:Label ID="lblUploadMessage1" runat="server" Font-Size="20pt" Text="状态正常" Visible="False"></asp:Label>
    <br />
    当前图片二：<asp:Image ID="ImgCurrentWorkPic2" runat="server"  Width="300px" Height="90px"/>
    <br />
    <asp:FileUpload ID="fulPicture2" runat="server" />
    <asp:Label ID="lblUploadMessage2" runat="server" Font-Size="20pt" Text="状态正常" Visible="False"></asp:Label>
    <br />
    当前图片三：<asp:Image ID="ImgCurrentWorkPic3" runat="server"  Width="300px" Height="90px"/>
    <br />
    <asp:FileUpload ID="fulPicture3" runat="server" />
    <asp:Label ID="lblUploadMessage3" runat="server" Font-Size="20pt" Text="状态正常" Visible="False"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Button ID="submit" runat="server" Text="提交修改"  OnClick="submit_Click" Height="32px" Width="151px"/>

</asp:Content>


