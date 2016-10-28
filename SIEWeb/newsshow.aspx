<%@ Page Title="" Language="C#" MasterPageFile="~/indexMaster.master" AutoEventWireup="true" CodeFile="newsshow.aspx.cs" Inherits="newsshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            <div class="containLeft" runat="server" >

                <h3>信息导航</h3>
                <ul class="navContain" id="navContain">
                    <li><a href="newslist.aspx?classid==0">新闻速递</a></li>
                    <li><a href="newslist.aspx?classid==1">通知公告</a></li>
                    <li><a href="newslist.aspx?classid==2">学生家园</a></li> 
                </ul>
            </div>

            <div class="containRight">
                <asp:Repeater runat="server" ID="Rpt">
                    <ItemTemplate>
                       <h1 class="alignCenter"> <%#Eval("title")%></h1>
                       <span class="alignCenter"><%#Eval("updatetime")%></span><br /><br />
                        <%#Eval("body") %>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="clearFloat"></div>
        </div>

</asp:Content>

