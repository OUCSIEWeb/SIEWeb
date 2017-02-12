<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminPage.master" AutoEventWireup="true" CodeFile="changePwd.aspx.cs" Inherits="admin_changePwd" %>

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
    <table width="100%"class="cont">
    <tr>
        <td width="2%">&nbsp;</td>
        <td>原密码：</td>
        <td>  <asp:TextBox ID="TxtOldPassword" runat="server" TextMode="Password" MaxLength="16" placeholder="密码长度为6到16位"></asp:TextBox></td>
        <td>原密码</td>
        <td width="2%">&nbsp;</td>
    </tr>
                                 
        <tr>
        <td width="2%">&nbsp;</td>
        <td>新密码：</td>
        <td>  <asp:TextBox ID="TxtNewPassword" runat="server" TextMode="Password" MaxLength="16" placeholder="密码长度为6到16位"></asp:TextBox></td>
        <td>新密码<td>
        <td width="2%">&nbsp;</td>
    </tr> 
    <tr>
        <td>&nbsp;</td>
        <td colspan="3"> <asp:Button ID="btnSubmit" runat="server" Text="提交"  OnClick="btnSubmit_Click" /></td>
        <td>&nbsp;</td>
    </tr>
</table>

</asp:Content>

