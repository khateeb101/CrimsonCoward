<%@ Page Title="News Events | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="NewsEvents.aspx.cs" Inherits="CrimsonCoward.NewsEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .Title {
            min-height:70px;
            width:440px !important;
        }
    </style>
    <div class="container">
        <h3 class="Title" style="min-height:unset !important;">NEWS</h3>
        <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right; text-align: right;">
            <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>

        <div class="clear"></div>
        <div class="row" style="position: relative">
            <div class="col-lg-12">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="pnlNews">
                    <ProgressTemplate>
                        <img src="/img/imgLoading.gif" alt="Loading" class="imgLoad" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="pnlNews" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DataPager runat="server" ID="dtNews" PagedControlID="rptNews" PageSize="6">
                            <Fields>
                                <asp:TemplatePagerField>
                                    <PagerTemplate>
                                        <div class="contentRow showingResults" style="color: black; margin-bottom: 10px;">
                                            Showing <span>
                                                <asp:Label runat="server" ID="CurrentPageLabel" Text='<%#(Container.StartRowIndex / Container.PageSize) + 1 == Math.Ceiling((double)(Container.TotalRowCount) / Container.PageSize)  ? Container.TotalRowCount - Container.StartRowIndex : Container.PageSize %>' />
                                            </span>results out of <span>
                                                <asp:Label runat="server" ID="TotalPagesLabel" Text='<%# Container.TotalRowCount %>' />
                                            </span>
                                        </div>
                                    </PagerTemplate>
                                </asp:TemplatePagerField>
                            </Fields>
                        </asp:DataPager>
                        <asp:ListView runat="server" ID="rptNews" OnPagePropertiesChanging="rptNews_PagePropertiesChanging">
                            <ItemTemplate>
                                <div class="col-lg-5" style="margin-bottom: 140px;box-shadow: 0 0 15px 0 rgba(0,0,0,0.3);">
                                    <a href='<%#(Eval("Link") != null && !string.IsNullOrEmpty(Eval("Link").ToString()))?Eval("Link"):ResolveUrl("~/") +"NewsDetails.aspx?id="+Eval("Id") %>'>
                                        <asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?Newsid=" + Eval("Id") + "&secImg=HomeTips" %>'
                                            Width="100%" Style="max-height: 510px" runat="server" AlternateText='<%# Eval("title")%>' /></a>
                                    <h3 class="Title"><%#Eval("Title") %></h3>
                                </div>
                                <div class="col-lg-1"></div>
                            </ItemTemplate>
                        </asp:ListView>
                        <div class="clear" />
                        </div>
                        <div class="paginationContainer">
                            <asp:DataPager runat="server" ID="dtProps" PagedControlID="rptNews" PageSize="6">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="text_white_shadow btnPagingPrev pull-left"
                                        ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false"
                                        ShowLastPageButton="false" PreviousPageImageUrl="~/img/Prev.png" />

                                    <asp:NumericPagerField CurrentPageLabelCssClass="NumPagingSelected" NumericButtonCssClass="NumPaging" />

                                    <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="text_white_shadow btnPagingNext pull-right"
                                        ShowFirstPageButton="false" ShowPreviousPageButton="false" ShowNextPageButton="true"
                                        ShowLastPageButton="false" NextPageImageUrl="~/img/Next.png" LastPageText="Last " />



                                </Fields>
                            </asp:DataPager>
                        </div>
                        </div>
                    <div runat="server" id="NoResult" visible="false" style="color: #D12229; font-size: larger; text-align: center;">No Results found</div>
                    </ContentTemplate>
                </asp:UpdatePanel>


            </div>
        </div>
    </div>
</asp:Content>
