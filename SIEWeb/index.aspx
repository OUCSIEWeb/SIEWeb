<%@ Page Title="" Language="C#" MasterPageFile="~/indexMaster.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="css/index_style.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="indexMain">
		<div class="indexMainBanner">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
  				<ol class="carousel-indicators">
    				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
    				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
                      <asp:Repeater ID="RptTop1" runat="server">
                          <ItemTemplate>
                              <li data-target="#carousel-example-generic" data-slide-to="<%# Container.ItemIndex + 3%>"></li>
                          </ItemTemplate>
                      </asp:Repeater>
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
                      <asp:Repeater ID="RptTop2" runat="server">
                          <ItemTemplate>
                              <div class="item">
                              <a href="newsshow.aspx?nid=<%#Eval("id")%>"><img class="img-responsive" src="<%#Eval("toppicture")%>"  ></a>
                                  </div>
                          </ItemTemplate>
                      </asp:Repeater>
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
			<div class="indexMainInnerChild">
				<div class="childTittle clearfix">
					<h3>新闻动态</h3>
					<span>NEWS</span>
					<a href="">更多>></a>
				</div>
				<div class="childBorder"></div>
				<div class="childInner">
					<a class="picture" id="a1" runat="server" href=""><img id="img1" runat="server" class="picture" src="images/picture.png" alt=""></a>
					<ul>
                        <asp:Repeater ID="Rptn1" runat="server">
                            <ItemTemplate>
                                <li class="clearfix"><a href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a><span><%#Eval("updatetime","{0:MM-dd}")%></span></li>
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</div>
			</div>
			<div class="indexMainInnerChild">
				<div class="childTittle clearfix">
					<h3>通知公告</h3>
					<span>NOTICE</span>
					<a href="">更多>></a>
				</div>
				<div class="childBorder"></div>
				<div class="childInner">
					<a class="picture" id="a2" runat="server" href=""><img id="img2" runat="server" src="images/picture.png" alt=""></a>
					<ul>
                        <asp:Repeater ID="Rptn2" runat="server">
                            <ItemTemplate>
                                <li class="clearfix"><a href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a><span><%#Eval("updatetime","{0:MM-dd}")%></span></li>
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</div>
			</div>
			<div class="indexMainInnerChild">
				<div class="childTittle clearfix">
					<h3>学生家园</h3>
					<span>HOME</span>
					<a href="">更多>></a>
				</div>
				<div class="childBorder"></div>
				<div class="childInner">
					<a class="picture" id="a3" runat="server" href=""><img id="img3" runat="server" class="picture" src="images/picture.png" alt=""></a>
					<ul>
                        <asp:Repeater ID="Rptn3" runat="server">
                            <ItemTemplate>
                                <li class="clearfix"><a href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a><span><%#Eval("updatetime","{0:MM-dd}")%></span></li>
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</div>
			</div>
			<div class="childLittle">
				<li>
					<a href="">中国海洋大学</a>
					<span>&nbsp;|&nbsp;</span>
					<a href="">中国海洋大学教务处</a>
					<span>&nbsp;|&nbsp;</span>
					<a href="">中华人民共和国出入管理局</a>
					<span>&nbsp;|&nbsp;</span>
					<a href="">国家留学网</a>
					<span>&nbsp;|&nbsp;</span>
					<a href="">测试</a>
				</li>
			</div>
		</div>
	</div>
</asp:Content>

