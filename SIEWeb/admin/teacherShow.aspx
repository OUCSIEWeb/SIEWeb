<%@ Page Title="" Language="C#" MasterPageFile="~/left.master" AutoEventWireup="true" CodeFile="teacherShow.aspx.cs" Inherits="teacherShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cout1" Runat="Server">
    <asp:Repeater runat="server" ID="Rpt">
        <ItemTemplate>
             <h1 class="alignCenter"><%#Eval("tname") +"简介"%> </h1>
            <%#Eval("body") %>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

