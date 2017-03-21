<%@ Page Title="" Language="C#" MasterPageFile="./left.master" AutoEventWireup="true" CodeFile="pageShow.aspx.cs" Inherits="pageShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cout1" Runat="Server">
    
    <asp:Repeater runat="server" ID="Rpt">
        
        <ItemTemplate>
            <h1 class="alignCenter"><%#Eval("title")%></h1>
            <%#Eval("body")%>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

