<%@ Page Title="Properties | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true"  CodeBehind="Properties.aspx.cs" Inherits="CrimsonCoward.Properties" %>
<%@ Register Src="~/UcSearch.ascx" TagName="ucSearch" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">        menuID = "menu_Properties"</script>
    <style>
        
        #MainRow {
            position: unset !important;
            bottom: unset !important;
            width:100% !important;
        }
        
   
    </style>
</asp:Content>
        
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <h3 class="Title">Our Properties</h3>
        <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right;text-align:right">
                        <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>

        <div class="clear"></div>
            <uc1:ucSearch ID="ucSearch1" runat="server" />
        <div class="col-lg-12">

            <div class="row" style="position: relative;">

             <%--   <ul class="portfolio-categ filter">
                    <li class="all active"><a href="#" title="">All</a></li>
                    <asp:UpdatePanel runat="server" ID="pnlTypes">
                        <ContentTemplate>
                            <asp:Repeater runat="server" ID="rptPropTypes">
                                <ItemTemplate>
                                    <li class='<%#Eval("PropType").ToString().Replace('/','-').Replace(' ','-')  %>'><a href="#" title=""><%#Eval("PropType").ToString().ToUpper() + "   ("+Eval("PropCount").ToString().ToUpper()+")"  %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>

                </ul>--%>

                <div class="col-lg-12">


                            <asp:DataPager runat="server" ID="DataPager1" PagedControlID="rptProjects" >
                                <Fields>
                                    <asp:TemplatePagerField>
                                        <PagerTemplate>
                                            <div class="contentRow showingResults" style="color: black; margin-bottom: 10px;">
                                                Showing <span>
                                                    <asp:Label runat="server" ID="CurrentPageLabel" Text='<%#Container.TotalRowCount != 0? ((Container.StartRowIndex / Container.PageSize) + 1 == Math.Ceiling((double)(Container.TotalRowCount) / Container.PageSize)  ? Container.TotalRowCount - Container.StartRowIndex : Container.PageSize):0 %>' />
                                                </span>results out of <span>
                                                    <asp:Label runat="server" ID="TotalPagesLabel" Text='<%# Container.TotalRowCount %>' />
                                                </span>
                                            </div>
                                        </PagerTemplate>
                                    </asp:TemplatePagerField>
                                </Fields>
                            </asp:DataPager>
                            <ul id="thumbs" class="portfolio">

                                <asp:ListView runat="server" ID="rptProjects" OnPagePropertiesChanging="rptProjects_PagePropertiesChanging">
                                  <ItemTemplate>
                                <div class="col-lg-4" style="margin-bottom: 40px">  
                                    
                                  
                                    <div class="imgContainer" style="width: 100%;background:lightgray; height: 280px;overflow:hidden;position:relative; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);">
                                        <a style="overflow:hidden;height:100%;width:100%;display:flex" href='<%#ResolveUrl("~/") +(Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ","").Split('-')[0] :Eval("PropertyType").ToString().Contains("/") ? Eval("PropertyType").ToString().Replace(" ","").Split('/')[0]  : Eval("PropertyType")) + "/" + (!string.IsNullOrEmpty(Eval("Qadaa").ToString())?Eval("Qadaa"):"Qadaa") + "/" + (!string.IsNullOrEmpty(Eval("District").ToString())?Eval("District"):"District" )+ "/" + Eval("PRL") %>'
                        title='<%# (Eval("Department") != null && !string.IsNullOrEmpty(Eval("Department").ToString())) ? Eval("Department") + " - " + Eval("District") : (Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ", "").Split('-')[1] : Eval("PropertyType")) + " for " + Eval("PropertyFor") + " in " + Eval("District")%>'>
                                        <asp:Image CssClass="CenteredImage" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?Id=" + Eval("PRL") + "&secImg=big" %>'
                                            Style="    position: absolute;left: -100%;right: -100%;top: -100%;bottom:-100%;margin: auto;min-width: 100%;min-height: 100%;;background-color: darkgray; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);" runat="server" AlternateText='<%# Eval("PropertyType") + " for " +  Eval("PropertyFor") %>' />
                                        
                                       <div class="PriceTag" style="background-color:#d12229 !important;"><%# string.Format("{0:###,###,##0}", (Eval("PropertyFor").ToString().ToLower().Contains("rent") && Eval("PropertyFor").ToString().ToLower().Contains("sale") ? string.Format("{0:###,###,##0}",Eval("saleprice")) +" USD <br>"+string.Format("{0:###,###,##0}",Eval("RentPrice"))+ " USD / year" :Eval("PropertyFor").ToString().ToLower().Contains("rent") ? string.Format("{0:###,###,##0}",Eval("RentPrice"))+ " USD / year" : string.Format("{0:###,###,##0}",Eval("saleprice"))+" USD"))%></div>
                                            </a>
                                    </div>
                                          <a href='<%#ResolveUrl("~/") +(Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ","").Split('-')[0] :Eval("PropertyType").ToString().Contains("/") ? Eval("PropertyType").ToString().Replace(" ","").Split('/')[0] : Eval("PropertyType")) + "/" + (!string.IsNullOrEmpty(Eval("Qadaa").ToString())?Eval("Qadaa"):"Qadaa") + "/" + (!string.IsNullOrEmpty(Eval("District").ToString())?Eval("District"):"District" )+ "/" + Eval("PRL") %>'>
                                    <span style="color: #000000; font-weight: bold !important;height:220px !important;overflow-wrap:break-word; font-size: 20px; display: block; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.1); padding: 15px; text-transform: uppercase"><span style="color:#d12229"><%#Eval("PropertyType") +" for "+Eval("PropertyFor")%></span><br />
                                        <span style="font-weight:normal"><%#" in "+ (Eval("District").ToString().ToLower()=="achrafieh"?" Achrafieh ":" ") +Eval("Neighborhood")  %></span>
                                       
                                       <%-- <span style="font-weight: normal; font-size: 18px;height:65px !important;display:block;overflow:hidden; ">
                                            <%# Eval("Web_GuideDescription").ToString()%>
                                        </span>--%>
                                                                              <div style="position:absolute;bottom:0px;left:30px;">
                                              <div style="width: 100%; margin-left: auto; margin-right: auto; padding: 10px; padding-left:0px !important">
                                            <span style="margin: 15px" runat="server" visible='<%#((int)Eval("TotalBedrooms") + (int)Eval("MasterBedrooms"))<=0?false:true %>'>
                                                 <span style="color:#d12229"><%#((int)Eval("TotalBedrooms") + (int)Eval("MasterBedrooms")).ToString() %></span>  
                                                <asp:Image ImageUrl="~/img/bedrooms.png" runat="server" />
                                                  </span>
                                            <span style="margin: 15px" runat="server" visible='<%#(int)Eval("Bathrooms")<=0?false:true %>'>
                                               
                                                 <span style="color:#d12229"><%#Eval("Bathrooms") %></span>
                                                 <asp:Image ImageUrl="~/img/bathrooms.png" runat="server" />
                                                   </span>
                                                   <span style="margin: 15px; margin-left:0px !important" runat="server" visible='<%#(int)Eval("Parkings")<=0?false:true %>'>
                                                 <span style="color:#d12229"><%#Eval("Parkings") %></span>
                                                <asp:Image ImageUrl="~/img/parking.png" runat="server" />
                                                     </span>
                                        </div>
                                            <span style="font-weight: normal;color:black !important; font-size: 18px" runat="server" visible='<%#(int)Eval("Size")<=0?false:true %>'>
                                            <span style="font-weight: bold;">Size: </span><%#Eval("Size") %> m2
                                        </span>
                                        <div class="clear"></div>
                                        <span style="font-weight: normal;color:black !important; font-size: 18px">
                                            <span style="font-weight: bold;">Ref #: </span><%#Eval("PRL") %>
                                        </span>
                         
                                                 <span style="width:100%; text-align:center;">
                                                                                  <div class="col-md-12" style="margin-top:10px; text-align:center">
 <asp:HyperLink NavigateUrl="tel:+961 1 993399" ToolTip="Call" CssClass="btn" runat="server" >
                   <asp:Image ImageUrl="~/img/Phone.png" runat="server" /><%--&nbsp;Call--%>
                </asp:HyperLink>
                <asp:HyperLink  NavigateUrl='<%#ResolveUrl("~/")+"contactUs/"+Eval("PRL") %>' ToolTip="Email" CssClass="btn" runat="server" >
                    <asp:Image ImageUrl="~/img/Email.png" runat="server" /><%-->&nbsp;Email--%>
                 </asp:HyperLink>

                  <asp:HyperLink  NavigateUrl="mailto:info@pbm-leb.com "  ToolTip="Share" CssClass="btn" runat="server" >
                    <asp:Image ImageUrl="~/img/Share.png" runat="server" /><%--&nbsp;Share--%>
                 </asp:HyperLink>
                                                                                      
                                                                                  </div></span>                                 
                                            </div>
                                    
                                  
                                    </span>
                                         </a>
                                </div>
                            </ItemTemplate>
                                    </asp:ListView>
                            </ul>
                            <div class="clear" />
                            </div>
                        <div class="paginationContainer">
                            <asp:DataPager runat="server" ID="dtProps" PagedControlID="rptProjects" PageSize="6">
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



                </div>
            </div>
</asp:Content>
