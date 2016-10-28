<%@ Page Title="" Language="C#" MasterPageFile="~/indexMaster.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="indexMain">
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
      					<img class="img-responsive" src="images/banner_1.jpg">
    				</div>
    				<div class="item">
      					<img class="img-responsive" src="images/banner_1.jpg">
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
		<div class="indexMainInner clearfix">
			<div class="indexMainLeft">
				<div class="indexMainLeftTop clearfix">
					<div class="indexMainTittle">新闻动态</div>
					<div class="indexMainTittle">通知公告</div>
					<span class="indexMainMore"><a href="">更多></a></span>
				</div>
				<div class="border"></div>
				<ul type="disc">
                    <asp:Repeater ID="Rptnews1" runat="server" >
                        <ItemTemplate><li><i class="glyphicon glyphicon-chevron-right"></i><a href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a></li></ItemTemplate>
                    </asp:Repeater> 
				</ul>
			</div>
			<div class="indexMainRight">
				<div class="indexMainRightTop clearfix">
					<div class="indexMainTittle">新闻动态</div>
					<span class="indexMainMore"><a href="">更多></a></span>
				</div>
				<div class="border"></div>
				<ul>
                    <asp:Repeater ID="Rptnews2" runat="server" >
                         <ItemTemplate><li><i class="glyphicon glyphicon-chevron-right"></i><a href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a></li></ItemTemplate>
                    </asp:Repeater> 
				</ul>
			</div>
		</div>
	</div>
</asp:Content>

