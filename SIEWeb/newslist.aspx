<%@ Page Title="" Language="C#" MasterPageFile="~/indexMaster.master" AutoEventWireup="true" CodeFile="newslist.aspx.cs" Inherits="newslist" %>

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
                <h3>信息导航</h3>
                <ul class="navContain" id="navContain">
                    <li runat="server" id="news_li"><a href="newslist.aspx?classid=0">新闻速递</a></li>
                    <li runat="server" id="notice_li"> <a href="newslist.aspx?classid=1">通知公告</a></li>
                    <li runat="server" id="student_li"><a href="newslist.aspx?classid=2">学生家园</a></li> 
                </ul>
            </div>

            <div class="containRight">
                <h1><asp:Label ID="lbKind" runat="server"></asp:Label><small>
                共有
                <asp:Literal ID="LtlArticlesCount" runat="server"></asp:Literal>
                个
                每页<asp:DropDownList ID="DdlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DdlPageSize_SelectedIndexChanged">
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                </asp:DropDownList>个
                </small></h1>
                
                <asp:Repeater runat="server" ID="Rpt">
                    <ItemTemplate>
                        <a href="newsshow.aspx?nid=<%#Eval("id")%>"><%#Eval("title")%></a>
                        <%#Eval("updatetime")%><br />
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

    <script>
        $("#navContain li").click(function () {
            $("#navContain li").removeClass("on");
            $(this).addClass("on");
        })
    </script>
</asp:Content>

