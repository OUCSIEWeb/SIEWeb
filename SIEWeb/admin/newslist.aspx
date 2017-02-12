<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminPage.master" AutoEventWireup="true" CodeFile="newslist.aspx.cs" Inherits="admin_teacherslist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <asp:DropDownList ID="DdlSelect"  runat="server">
       <asp:ListItem Text="新闻速递" Value="0"></asp:ListItem>
        <asp:ListItem Text="通知公告" Value="1"></asp:ListItem>
        <asp:ListItem Text="学生家园" Value="2"></asp:ListItem>
		<asp:ListItem Text="HND招生简章" Value="3"></asp:ListItem>
		<asp:ListItem Text="HND教学教务" Value="4"></asp:ListItem>
		<asp:ListItem Text="HND学子风采" Value="5"></asp:ListItem>
		<asp:ListItem Text="中美合作项目" Value="6"></asp:ListItem>
		<asp:ListItem Text="中澳合作项目" Value="7"></asp:ListItem>
		<asp:ListItem Text="学院规章制度" Value="8"></asp:ListItem>
		<asp:ListItem Text="学生规章制度" Value="9"></asp:ListItem>
		<asp:ListItem Text="入学招生简章" Value="10"></asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="BtnQuery" runat="server" Text="确认查找"  OnClick="BtnQuery_Click"/>
    <table>
        <tr>
            <td>标题</td>
            <td>最后更新时间</td>
            <td>编辑</td>
            <td>删除</td>
        </tr>
        <asp:Repeater runat="server" ID="Rpt" OnItemCommand="Rpt_ItemCommand">
            <ItemTemplate>
                <tr><td><%#Eval("title")%></td>
                    <td><%#Eval("updatetime")%></td>
                    <td><a href="editorNews.aspx?nid=<%#Eval("id")%>">编辑</a></td>
                    <td><asp:Button runat="server" ID="del" CommandName="del" CommandArgument='<%#Eval("id")%>' Text="删除" /></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Button runat="server" ID="BtnTAdd" OnClick="BtnTAdd_Click" Text="添加新闻"  Height="29px" Width="180px" />
</asp:Content>

