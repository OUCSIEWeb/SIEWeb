<%@ Page Title="" Language="C#" MasterPageFile="./indexMaster.master" AutoEventWireup="true" CodeFile="enterRules.aspx.cs" Inherits="enterRules" %>

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
                            <img class="img-responsive" src="../images/banner_1.jpg">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="../images/banner_2.jpg">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="../images/banner_3.jpg">
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
            <div id="Div1" class="containLeft" runat="server">
                <h3>入学申请</h3>
                <ul class="navContain" id="navContain">
                   <li><a href="pageShow.aspx?pid=63">入学条件</a></li>
                    <li><a href="pageShow.aspx?pid=64">申请流程</a></li>
                    <li  runat="server" id="Li"><a href="enterRules.aspx?classid=10">招生简章</a></li>
                    <li><a href="pageShow.aspx?pid=66">在线申请</a></li>
                    <li><a href="pageShow.aspx?pid=67">报到流程</a></li>
                    <li><a href="pageShow.aspx?pid=68">费用说明</a></li>
                </ul>
            </div>

            <div class="containRight">
                <h1><asp:Label ID="lbKind" runat="server"></asp:Label></h1>
                
                <asp:Repeater runat="server" ID="Rpt">
                    <ItemTemplate>
                       
                        
                        <a style= "color:<%# Container.ItemIndex == 0 ?  "red":""%>" href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a>
                      <font  style= "color:<%# Container.ItemIndex == 0 ?  "red":""%>">  <%#Eval("updatetime","{0:yyyy-MM-dd}")%></font><br />
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
                转<asp:TextBox ID="TxtPageNum" runat="server" Height="23px" style="font-size: large" Width="37px">1</asp:TextBox>
                页
                <asp:Button ID="BtnJumpPage" runat="server" OnClick="BtnJumpPage_Click" Text="GO" />
            </div>
            <div class="clearFloat"></div>
        </div>
            </div>

    <script>
        $("#navContain li").click(function () {
            $("#navContain li").removeClass("on");
            $(this).addClass("on");
        })
    </script>
</asp:Content>

