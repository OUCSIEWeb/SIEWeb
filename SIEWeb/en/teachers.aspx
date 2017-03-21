<%@ Page Title="" Language="C#" MasterPageFile="./left.master" AutoEventWireup="true" CodeFile="teachers.aspx.cs" Inherits="teachers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cout1" Runat="Server">
    <h1 class="alignCenter">现任领导</h1>
			<table style="border:none;" cellspacing="0" cellpadding="0" border="1" align="center">
			<tbody class="leaderTable">
				<tr>
					<td>
						<p>
							<b><span>姓名</span></b> 
						</p>
					</td>
					<td>
						<p>
							<b><span>职务</span></b> 
						</p>
					</td>
					<td>
						<p>
							<b><span>办公地点</span></b> 
						</p>
					</td>
					<td>
						<p>
							<b><span>办公电话</span></b> 
						</p>
					</td>
					<td>
						<p>
							<b><span>E-mail</span></b> 
						</p>
					</td>
					<td>
						<p>
							<b><span>工作职责</span></b> 
						</p>
					</td>
				</tr>
                <asp:Repeater runat="server" ID="Rpt">
                    <ItemTemplate>

				<tr>
					<td>
						<p>
							<span ><a href="teacherShow.aspx?tid=<%#Eval("id")%>"><%#Eval("tname")%></a></span> 
						</p>
					</td>
					<td>
						<p>
							<span><%#Eval("title")%></span> 
						</p>
					</td>
					<td>
						<p>
							<span><%#Eval("place")%></span> 
						</p>
					</td>
					<td>
						<p>
							<span><%#Eval("phone")%> </span>
						</p>
					</td>
					<td>
						<p>
							<span><%#Eval("email")%></span> 
						</p>
					</td>
					<td>
						<p>
							<span><%#Eval("describe")%></span> 
						</p>
					</td>
				</tr>
                        
                    </ItemTemplate>
                </asp:Repeater>
			</tbody>
		</table>
</asp:Content>

