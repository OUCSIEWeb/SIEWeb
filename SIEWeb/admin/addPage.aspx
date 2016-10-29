<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminPage.master"  validateRequest="false" AutoEventWireup="true" CodeFile="addPage.aspx.cs" Inherits="admin_addPage" %>

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
        <asp:ListItem Text="关于我们" Value="0"></asp:ListItem>
        <asp:ListItem Text="新闻公告" Value="1"></asp:ListItem>
        <asp:ListItem Text="入学申请" Value="2"></asp:ListItem>
        <asp:ListItem Text="专业学习" Value="3"></asp:ListItem>
        <asp:ListItem Text="HSK" Value="4"></asp:ListItem>
        <asp:ListItem Text="奖学金" Value="5"></asp:ListItem>
        <asp:ListItem Text="生活指南" Value="6"></asp:ListItem>
        <asp:ListItem Text="规章制度" Value="7"></asp:ListItem>
        <asp:ListItem Text="联系我们" Value="8"></asp:ListItem>

    </asp:DropDownList>
    <asp:Button runat="server" ID="BtnOk" OnClick="BtnOk_Click" Text="提交" />
    <script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('<%=editor.ClientID%>');
    </script>
</asp:Content>

