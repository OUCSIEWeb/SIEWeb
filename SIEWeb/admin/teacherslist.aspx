<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminPage.master" AutoEventWireup="true" CodeFile="teacherslist.aspx.cs" Inherits="admin_teacherslist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>姓名</td>
            <td>职位</td>
            <td>编辑</td>
            <td>删除</td>
        </tr>
        <asp:Repeater ID="RptTeacher"  runat="server" OnItemCommand="RptTeacher_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("tname")%></td>
                    <td><%#Eval("title")%></td>
                    <td><a href="editorTeacher.aspx?tid=<%#Eval("id")%>">编辑</a></td>
                    <td><asp:Button runat="server" CommandArgument='<%#Eval("id")%>'  CommandName="del" Text="删除" /></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Button runat="server" ID="BtnTAdd" OnClick="BtnTAdd_Click" Text="添加新教师" />
</asp:Content>

