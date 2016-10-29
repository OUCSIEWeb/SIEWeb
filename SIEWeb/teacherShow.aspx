<%@ Page Title="" Language="C#" MasterPageFile="~/left.master" AutoEventWireup="true" CodeFile="teacherShow.aspx.cs" Inherits="teacherShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cout1" Runat="Server">
    <asp:Repeater runat="server" ID="Rpt">
        <ItemTemplate>
            <%#Eval("body") %>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

