<%@ Page Title="" Language="C#" MasterPageFile="./AdminPage.master" AutoEventWireup="true" CodeFile="files.aspx.cs" Inherits="files1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>标题</td>
            <td>添加时间</td>
            <td>删除</td>
        </tr>
        <asp:Repeater runat="server" ID="Rpt" OnItemCommand="Rpt_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("title")%></td>
                    <td><%#Eval("createtime")%></td>
                    <td><asp:Button runat="server" ID="del" CommandName="del" CommandArgument='<%#Eval("id")%>' Text="删除" /></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Button runat="server" ID="BtnTAdd" OnClick="BtnTAdd_Click" Text="添加文件" />
</asp:Content>

