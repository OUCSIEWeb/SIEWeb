<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminPage.master"  validateRequest="false" AutoEventWireup="true" CodeFile="editorNews.aspx.cs" Inherits="admin_addPage" %>

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
    <asp:Label runat="server" ID="label1">标题:</asp:Label><br />
    <asp:TextBox ID="TxtTitle"  runat="server" ></asp:TextBox><br />
    <asp:Label runat="server" ID="label2">页面内容:</asp:Label><br />
    <textarea id="editor" runat="server" type="text/plain"></textarea>
    <asp:DropDownList ID="DdlSelect" runat="server">
        <asp:ListItem Text="新闻速递" Value="0"></asp:ListItem>
        <asp:ListItem Text="通知公告" Value="1"></asp:ListItem>
        <asp:ListItem Text="学生家园" Value="2"></asp:ListItem>
    </asp:DropDownList>
        <br />
    <asp:Label runat="server" ID="label3">主页滚动图片(可选，请上传1190×400px大小的图片):</asp:Label><br />
    <asp:FileUpload runat="server" ID="filedtop" /><label runat="server" id="Lbltips1" style="color:red" > </label>
    <br />
    <asp:Label runat="server" ID="label4">列表顶端图片(可选，请上传380×140px大小的图片)</asp:Label>
    <br />
    <asp:FileUpload runat="server" ID="filedlist" /><label runat="server" id="Lbltips2" style="color:red" ></label>
    <%--<asp:CheckBox ID="IfTop" runat="server" Text="是否选择在主页中显示" />--%><br />
    <asp:Button runat="server" ID="BtnOk" OnClick="BtnOk_Click" Text="提交" />
    <script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('<%=editor.ClientID%>');
    </script>
</asp:Content>

