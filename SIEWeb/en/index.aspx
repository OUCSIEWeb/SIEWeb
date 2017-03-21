<%@ Page Title="" Language="C#" MasterPageFile="./indexMaster.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/index_style.css">
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
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                     
  				</ol>
  			<!-- Wrapper for slides -->
  				<div class="carousel-inner" role="listbox">
                       <asp:Repeater ID="RptTop2" runat="server">
                          <ItemTemplate>
                              <div class=' <%=(i++) <1 ? "item active" : "item" %>'>
                              <a href="newsshow.aspx?nid=<%#Eval("id")%>"><img class="img-responsive" src="<%#"../"+Eval("toppicture")%>"  ></a>
                                  </div>
                          </ItemTemplate>
                      </asp:Repeater>
    				<div class="item">
                        <%--<img id="imgtop1"  class="img-responsive" runat="server" src="images/banner_1.jpg" alt="">--%>
                        <asp:Image ID="imgtop1" runat="server" ImageUrl="../images/banner_1.jpg" CssClass="img-responsive" />
    				</div>
    				<div class="item">
      			<%--		<img class="img-responsive" id="imgtop2"  runat="server" src="images/banner_1.jpg">--%>
                         <asp:Image ID="imgtop2" runat="server" ImageUrl="../images/banner_1.jpg" CssClass="img-responsive" />
    				</div>
    				<div class="item">
      				<%--	<img class="img-responsive"  id="imgtop3"  runat="server" src="images/banner_1.jpg">--%>
                         <asp:Image ID="imgtop3" runat="server" ImageUrl="../images/banner_1.jpg" CssClass="img-responsive" />
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
			<div class="indexMainInnerChild">
				<div class="childTittle clearfix">
					<h3>新闻动态</h3>
					<span>NEWS</span>
					<a href="newslist.aspx?classid=0">更多>></a>
				</div>
				<div class="childBorder"></div>
				<div class="childInner">
					<a class="picture" id="a1" runat="server" href="">
                        <img id="img1" runat="server" src="../images/picture.png" alt=""></a>
					<ul>
                        <asp:Repeater ID="Rptn1" runat="server">
                            <ItemTemplate>
                               <%-- <font color="<%# Container.ItemIndex == 0 ? "red": ""%>">--%>
                                <li class="clearfix"><i class="glyphicon glyphicon-chevron-right"></i><a style= "color:<%# Container.ItemIndex == 0 ?  "red":""%>"  href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a><span style= "color:<%# Container.ItemIndex == 0 ?  "red":""%>"><%#Eval("updatetime","{0:MM-dd}")%></span></li>
                                <%--//</font>--%>
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</div>
			</div>
			<div class="indexMainInnerChild">
				<div class="childTittle clearfix">
					<h3>通知公告</h3>
					<span>NOTICE</span>
					<a href="newslist.aspx?classid=1">更多>></a>
				</div>
				<div class="childBorder"></div>
				<div class="childInner">
					<a class="picture" id="a2" runat="server" href=""><img id="img2" runat="server" src="../images/picture.png" alt=""></a>
					<ul>
                        <asp:Repeater ID="Rptn2" runat="server">
                            <ItemTemplate>
                            <li class="clearfix"><i class="glyphicon glyphicon-chevron-right"></i><a style= "color:<%# Container.ItemIndex == 0 ?  "red":""%>"  href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a><span style= "color:<%# Container.ItemIndex == 0 ?  "red":""%>"><%#Eval("updatetime","{0:MM-dd}")%></span></li>
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</div>
			</div>
			<div class="indexMainInnerChild">
				<div class="childTittle clearfix">
					<h3>学生家园</h3>
					<span>HOME</span>
					<a href="newslist.aspx?classid=2">更多>></a>
				</div>
				<div class="childBorder"></div>
				<div class="childInner">
					<a class="picture" id="a3" runat="server" href=""><img id="img3" runat="server" class="picture" src="../images/picture.png" alt=""></a>
					<ul>
                        <asp:Repeater ID="Rptn3" runat="server">
                            <ItemTemplate>
                                <li class="clearfix"><i class="glyphicon glyphicon-chevron-right"></i><a style= "color:<%# Container.ItemIndex == 0 ?  "red":""%>"  href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a><span style= "color:<%# Container.ItemIndex == 0 ?  "red":""%>"><%#Eval("updatetime","{0:MM-dd}")%></span></li>
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="childLittle">
				<li>
					<a href="http://www.ouc.edu.cn" style="display:inline"><img src="../images/cn01.png" /></a>
					<a href="http://www.moe.gov.cn" style="display:inline"><img src="../images/cn02.png" /></a>
					<a href="http://www.csc.edu.cn"style="display:inline"><img src="../images/cn03.png" /></a>
					<a href="http://www.lxbx.net/index.html"style="display:inline"><img src="../images/cn04.png" /></a>
					<a href="http://hanban.edu.cn/"style="display:inline"><img src="../images/cn05.png" /></a>
					<a href="http://www.mps.gov.cn/n16/n84147/index.html"style="display:inline"><img src="../images/cn06.png" /></a>
					<a href="http://www.ceaie.edu.cn/index.html"style="display:inline"><img src="../images/cn07.jpg" /></a>
					<a href="http://www.cafsa.org.cn/"style="display:inline"><img src="../images/cn08.jpg" /></a>
				</li>
			</div>
</asp:Content>

