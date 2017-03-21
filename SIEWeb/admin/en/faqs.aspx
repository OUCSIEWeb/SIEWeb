<%@ Page Title="" Language="C#" MasterPageFile="./AdminPage.master" AutoEventWireup="true" CodeFile="faqs.aspx.cs" Inherits="admin_teacherslist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <asp:DropDownList ID="DdlSelect"  runat="server">
        <asp:ListItem Text="未回复" Value="0"></asp:ListItem>
        <asp:ListItem Text="已回复" Value="1"></asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="BtnQuery" runat="server" Text="确认查找"  OnClick="BtnQuery_Click"/>
    <table>
        <tr>
            <td>标题</td>
            <td>创建时间</td>
            <td>回复</td>
            <td>删除</td>
        </tr>
        <asp:Repeater runat="server" ID="Rpt" OnItemCommand="Rpt_ItemCommand">
            <ItemTemplate>
                <tr><td><%#Eval("title")%></td>
                    <td><%#Eval("createtime")%></td>
                    <td><a href="reply.aspx?nid=<%#Eval("id")%>">回复</a></td>
                    <td><asp:Button runat="server" ID="del" CommandName="del" CommandArgument='<%#Eval("id")%>' Text="删除" /></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Content>

