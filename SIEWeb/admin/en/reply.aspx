<%@ Page Title="" Language="C#" MasterPageFile="./AdminPage.master"  validateRequest="false" AutoEventWireup="true" CodeFile="reply.aspx.cs" Inherits="admin_addPage" %>

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
    标题:<br /><%=title%><br />
    提问人:<br /><%=sname%><br />
    内容:<br /><%=body%><br />
    <asp:Label runat="server" ID="label2">回复内容:</asp:Label><br />
    <textarea id="editor" runat="server" type="text/plain"></textarea>
    <asp:Button runat="server" ID="BtnOk" OnClick="BtnOk_Click" Text="提交" />
    <script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('<%=editor.ClientID%>');
    </script>
</asp:Content>

