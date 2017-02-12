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
                            <img class="img-responsive" src="images/banner_1.jpg">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="images/banner_2.jpg">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="images/banner_3.jpg">
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
                    <li runat="server" id="news_li"><a href="newslist.aspx?classid=0">新闻速递</a></li>
                    <li runat="server" id="notice_li"><a href="newslist.aspx?classid=1">通知公告</a></li>
                    <li runat="server" id="student_li"><a href="newslist.aspx?classid=2">学生家园</a></li> 
					<li ><a href="HNDlist.aspx?classid=3">HND招生简章</a></li> 
					<li ><a href="HNDlist.aspx?classid=4">HND教学教务</a></li> 
					<li ><a href="HNDlist.aspx?classid=5">HND学子风采</a></li>
					<li ><a href="ZAlist.aspx?classid=6">中美合作办学项目</a></li> 
					<li ><a href="ZAlist.aspx?classid=7">中澳合作办学项目</a></li> 
					<li><a href="Rulelist.aspx?classid=8">学院规章制度</a></li>
					<li><a href="Rulelist.aspx?classid=9">学生规章制度</a></li>
					<li ><a href="ZAlist2.aspx?classid=10">入学招生简章</a></li>
                </ul>
            </div>

            <div class="containRight">
                <asp:Repeater runat="server" ID="Rpt">
                    <ItemTemplate>
                       <h1 class="alignCenter"> <%#Eval("title")%></h1>
                       <!--<span class="alignCenter"><%#Eval("updatetime")%></span><br /><br />-->
                        <%#Eval("body") %>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="clearFloat"></div>
        </div>

</asp:Content>

