<%@ Page Title="Blog | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="CrimsonCoward.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .Title {
            min-height: 70px;
            
           
        }
        .col-lg-4
        {
            margin-bottom:60px !important;
        }
        

            .col-lg-4 .Title {
                /*
                margin-bottom: 0px !important;
               
                padding-bottom: 35px !important;*/
                 padding-top: 5px !important;
                 margin-top: 0px !important;
                 height:75px !important;
                 width: 100% !important;
            }

    </style>
    <div class="container">
        <h3 class="Title" style="min-height: unset !important;">Blog</h3>
        <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right; text-align: right;">
            <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>

        <div class="clear"></div>
        <div class="row">
          <div class="col-md-12">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="pnlNews">
                    <ProgressTemplate>
                        <img src="/img/imgLoading.gif" alt="Loading" class="imgLoad" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="pnlNews" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                     <%--   <asp:DataPager runat="server" ID="dtBlogCat" PagedControlID="rptBlogsCat" PageSize="6">
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
                        </asp:DataPager>--%>
                        <div class="clearfix"></div>
                       
                        <asp:ListView runat="server" ID="rptBlogsCat" >
                            <ItemTemplate>
                                <div class="col-lg-4" style="margin-bottom: 140px; ">
                               
                                    <a href='<%#ResolveUrl("~/") +"BlogDetails.aspx?id="+Eval("Id") %>'>
                                        <asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?BlogCatid=" + Eval("Id") + "&secImg=HomeTips" %>'
                                            Width="100%" Style="max-height: 510px" runat="server" AlternateText='<%# Eval("title")%>' />
                                    <h3 style="height:145px;" class="Title"><%#Eval("title") %></h3></a></div>
                                
                            </ItemTemplate>
                        </asp:ListView>
                           
                      <%--  <div class="paginationContainer">
                            <asp:DataPager runat="server" ID="dtProps" PagedControlID="rptBlogsCat" PageSize="6">
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
                        </div>--%>
 
                    <div runat="server" id="NoResult" visible="false" style="color: #D12229; font-size: larger; text-align: center;">No Results found</div>
                    </ContentTemplate>
                </asp:UpdatePanel>


          </div>
        </div>
    </div>
</asp:Content>
