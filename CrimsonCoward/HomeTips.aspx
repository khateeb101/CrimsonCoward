<%@ Page Title="Home Tips | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="HomeTips.aspx.cs" Inherits="CrimsonCoward.HomeTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h3 class="Title">Home Tips</h3>
        <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right; text-align: right;">
            <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>

        <div class="clear"></div>

        <h3 class="Title" style="border: unset !important; width: 100% !important; text-align: center;">Upgrades That Add Big Value<br />
            to Your Apartment</h3>

        <div class="clear"></div>
        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="pnlHomeTips">
            <ProgressTemplate>
                <img src="/img/imgLoading.gif" alt="Loading" class="imgLoad" />
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="pnlHomeTips" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:DataPager runat="server" ID="dtHomeTips" PagedControlID="rptHomeTips" PageSize="4">
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
                <asp:ListView runat="server" ID="rptHomeTips" OnPagePropertiesChanging="rptHomeTips_PagePropertiesChanging">
                    <ItemTemplate>
                        <div class="row" style="margin-top: 20px; margin-bottom: unset;">
                            <div class="col-lg-12">

                                <div class="row" style="position: relative">
                                    <div class="col-lg-12" style="border: 7px solid #dedede; padding: unset">
                                        <a href='<%#Eval("Link") %>'><asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?HomeTipid=" + Eval("Id") + "&secImg=HomeTips" %>'
                                            Width="100%" Style="max-height: 510px" runat="server" AlternateText='<%# Eval("title")%>' /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3 class="Title" style="border-left: unset !important;"><%#Eval("Title") %></h3>
                        <div class="clear"></div>
                        <div class="row">
                            <div class="col-lg-12" style="padding: unset">
                                <div class="col-lg-5" style="padding: unset">
                                    <span class="text">
                                        <%#Eval("Text1") %>
                                    </span>
                                </div>
                                <div class="col-lg-1" style="padding: unset; height: 20px;">
                                </div>
                                <div class="col-lg-5" style="padding: unset">
                                    <span class="text">
                                        <%#Eval("Text2") %>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <div class="clear" />
                </div>
                <div class="row">
                        <div class="paginationContainer">
                            <asp:DataPager runat="server" ID="dtProps" PagedControlID="rptHomeTips" PageSize="4">
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
                </div>
                    <div runat="server" id="NoResult" visible="false" style="color:red;font-size:larger;text-align:center;">No Results found</div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
