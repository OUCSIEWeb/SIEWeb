﻿<%@ Page Title="" Language="C#" MasterPageFile="~/indexMaster.master" AutoEventWireup="true" CodeFile="filesDownload.aspx.cs" Inherits="newslist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <%--页面样式，标题在左时间在右--%>
    <style>
        .containRight a{
            float:left;
        }
        .containRight{
            text-align:right;
        }
        .containRight h1{
            text-align:left;
        }
		.containRight {
			font-size: 16px;
			line-height: 2;
		}
		input[type="submit"]{
			background-color:#f2f2f2;
			border:none;
			padding:0px 5px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="containAbout">
        <div class="containBanner">
            <div class="indexMainBanner">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img class="img-responsive" src="images/banner_2.jpg">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="images/banner_2.jpg">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="images/banner_2.jpg">
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="containLeft" runat="server">
                <h3>资料下载</h3>
                <ul class="navContain" id="navContain">
                    <li id="li_student" runat="server"><a href="filesDownload.aspx?viewlevel=0">学生资料</a></li>
                    <li id="li_teacher" runat="server"><a href="filesDownload.aspx?viewlevel=1">办公资料</a></li>
					  <li id="li_chart" runat="server"><a href="filesDownload.aspx?viewlevel=4">报名表下载</a></li>
                </ul>
            </div>

            <div class="containRight">
                <h1><asp:Label ID="lbKind" runat="server"></asp:Label></h1>
                
                <asp:Repeater runat="server" ID="Rpt"> 
                    <ItemTemplate>
                        <a href="<%#"."+Eval("filename")%>"><%#Eval("title")%></a>
                        <%#Eval("createtime")%><br />
                    </ItemTemplate>
                </asp:Repeater>
                 <br />
                <asp:Button ID="BtnPreviousPage" runat="server" OnClick="BtnPreviousPage_Click" Text="上一页" />
                <asp:Button ID="BtnNextPage" runat="server" OnClick="BtnNextPage_Click" Text="下一页" />
                <asp:Button ID="BtnHomePage" runat="server" OnClick="BtnHomePage_Click" Text="首页" />
                <asp:Button ID="BtnTrailerPage" runat="server" OnClick="BtnTrailerPage_Click" Text="尾页" />
                页次：
                <asp:Label ID="lbNow" runat="server" Text="1"></asp:Label>
                /
                <asp:Label ID="lbTotal" runat="server" Text="1"></asp:Label>
                转<asp:TextBox ID="TxtPageNum" runat="server" Height="22px" style="font-size: large" Width="37px">1</asp:TextBox>
                页
                <asp:Button ID="BtnJumpPage" runat="server" OnClick="BtnJumpPage_Click" Text="GO" />
            </div>
            <div class="clearFloat"></div>
        </div>
            </div>
</asp:Content>

