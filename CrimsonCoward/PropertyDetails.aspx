<%@ Page Title="" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="PropertyDetails.aspx.cs" Inherits="CrimsonCoward.PropertyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">        menuID = "menu_PropDetails"</script>
    <script src="/js/dw_scroll_c.js" type="text/javascript"></script>
    <link href="/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />
    <link href="/css/social-share-kit.css" rel="stylesheet" type="text/css" />
    <script src="/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
    <link href="/css/tinycarousel.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/social-share-kit.js"></script>
    <script type="text/javascript">
        function preloadImage(url) {
            var img = new Image();
            img.src = url;
        }
    </script>
    <script type="server">
        <asp:Literal Text="" id="ltrPreload" runat="server" />;
    </script>
    <style type="text/css">
        .scroll {
            position: relative;
            padding-right: 15px;
        }
        /* to make scrollbars always visible */
        .always-visible.ps-container.ie > .ps-scrollbar-y {
            opacity: 0.6;
            visibility: visible;
        }

        ps-container.ie .ps-scrollbar-y {
            visibility: visible !important;
        }

        .ps-container > .ps-scrollbar-y-rail {
            opacity: 0.6 !important;
        }

        .buttons {
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.scroll').perfectScrollbar();
        });
    </script>
    <script type="text/javascript">

        var switchTo5x = true;

    </script>
    <script type="text/javascript" src="/js/buttons.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h3 class="Title">Property Details</h3>
        <div class="clearfix"></div>
        <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right">
            <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>
        <div class="clear"></div>  <asp:HyperLink NavigateUrl="tel:+961 1 993399" Width="50px" ToolTip="Call" CssClass="btn" runat="server" >
                   <asp:Image ImageUrl="~/img/Phone.png" runat="server" /><%--&nbsp;Call--%>
                </asp:HyperLink>
                  <asp:HyperLink id="IntrestedUrl" ToolTip="Email" CssClass="btn" runat="server" >
                    <asp:Image ImageUrl="~/img/Email.png" runat="server" /><%-->&nbsp;Email--%>
                 </asp:HyperLink>

                  <asp:HyperLink  NavigateUrl="mailto:info@pbm-leb.com " Width="50px" ToolTip="Share" CssClass="btn" runat="server" >
                    <asp:Image ImageUrl="~/img/Share.png" runat="server" /><%--&nbsp;Share--%>
                 </asp:HyperLink>
        <div id="prop_img" style="background-color: rgb(232, 232, 232); margin-top: 10px; display: block; margin-left:auto;margin-right:auto; position: relative; vertical-align: middle; max-height:500px">
            <asp:Image ImageUrl="#" ID="imgProp" ClientIDMode="Static" runat="server" AlternateText="Property Thumbnail"
                title="Property Thumbnail" Style="display: block; max-width:100%; max-height:500px; margin-left:auto; margin-right:auto; vertical-align: middle" />
          
        </div>
        
<%--                <asp:HyperLink NavigateUrl="#" Width="135px" CssClass="btn" runat="server" >
                    <asp:Image ImageUrl="~/img/Heart.png" runat="server" />&nbsp;Save
                </asp:HyperLink>
                <br />--%>
             
           
        <div class="clear">
            <asp:Panel runat="server" ID="prop_thumbs_container" ClientIDMode="Static">
                <%--<asp:Literal Text="<div<div id='carousel'>" ID="imgsOpeningDiv" runat="server" /> --%>
                <div id='slider1'>
                    <a id="BtnPrev" style="display:block" class='buttons prev' runat="server" onclick='$("#imgSlider").animate({scrollLeft: 

($("#imgSlider").scrollLeft() - 460)},500)'>
                        <p>
                            &#60;
                        </p>
                    </a>
                    <div style="height: 123px; width: 100%;" class='viewport' id="imgSlider">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <asp:Repeater runat="server" ID="rptThumbs">
                                    <ItemTemplate>
                                        <td>
                                            <div style="background-color: rgb(232, 232, 232); height: 123px; width: 220px; margin: 5px;">
                                                <img src='<%# ResolveUrl("~/") + "Thumbnail.aspx?imgID=" + Eval("ID") + "&secImg=thumb" %>'
                                                    onclick="swapImage('imgProp', this.src.replace('Thumbnail','ImageStreamer').replace('&secImg=thumb',''))" alt="Property Image" title="Property Image"></img>
                                            </div>
                                        </td>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </table>
                    </div>
                    <a id="BtnNext" style="display:block" class='buttons next' runat="server" onclick='$("#imgSlider").animate({scrollLeft: 

($("#imgSlider").scrollLeft() + 460)},500)'>
                        <p>
                            &#62;
                        </p>
                    </a>

                </div>
            </asp:Panel>

        </div>
        <div class="clear" />

        <div class="row" style="margin-bottom:10px;">
            <div class="col-md-6" style="margin-top: 40px">
                <span style="color: #D12229; font-weight: bold !important; font-size: 20px; display: block; text-transform: uppercase">
                    <asp:Literal runat="server" ID="ltrPropLocation"></asp:Literal>
                </span>
              
            </div>
            <div class="col-md-6" style="margin-top: 40px">
                <span style="float: right; color: #D12229; font-weight: bold !important; font-size: 20px; display: block; text-transform: uppercase">
                   <asp:Literal runat="server" ID="ltrprice1" Visible="false"></asp:Literal><br />
                     <asp:Literal runat="server" ID="ltrPrice"></asp:Literal>
                </span>
            </div>
        </div>
        <div class="row">
           
            <div class="col-md-2" style="margin-top: 40px; margin-bottom:10px;">
                  <div runat="server" id="trSize">
                <span style="color: #000000;font-weight:bold;">Size&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
                <span style="float:right; font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrSize"></asp:Literal>
                </span>
                <hr style="margin-top:0px;" />
                </div>
                
                <span style="color: #000000;font-weight:bold;">Type&nbsp;&nbsp;&nbsp;
                </span>
                <span style="float:right;font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrType"></asp:Literal>
                </span>
                  <hr style="margin-top:0px;" />
                     <div runat="server" id="trZoning">
                <span style="color: #000000;font-weight:bold;">Zoning&nbsp;&nbsp;
                </span>
                <span style="float:right;font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrZone"></asp:Literal>
                </span>
                                     <hr style="margin-top:0px;" /></div>
                  <div runat="server" id="trPricePer">
                 <span style="color: #000000;font-weight:bold;">Price/Sqm&nbsp;&nbsp;&nbsp;
                </span>
                <span style="float:right;font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrPricePer"></asp:Literal>
                </span>
                  <hr style="margin-top:0px;" />
                      </div>
                <span style="color: #000000;font-weight:bold;">Ref #&nbsp;&nbsp;
                </span>
                <span style="float:right;font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrPrl"></asp:Literal>
                </span>
                 <hr style="margin-top:0px;" />
            </div>
             <div runat="server" id="trRooms" class="col-md-6" style="margin-top: 40px; margin-bottom:10px;">
                 <div class="col-md-4">
                 <asp:ListView runat="server" ID="rptRooms" >
                    <ItemTemplate>
                        
                            
                    <span style="color: #000000;font-weight:bold;font-size:14px !important;line-height: 1.6em;"><%#Eval("Name") %>
                </span>
                       <span style="float:right;font-size:14px !important; font-weight: bold !important;line-height: 1.6em; color: #D12229">
                    <%#Eval("Quantity")%>
                </span>
                <hr style="margin-top:0px;" />
                           
                </ItemTemplate>
                 </asp:ListView>
                     </div>
                  <div class="col-md-4">
                   <asp:ListView runat="server" id="rptRooms1">
                    <ItemTemplate>
                        
                            
                    <span style="color: #000000;font-weight:bold;font-size:14px !important;line-height: 1.6em;"><%#Eval("Name") %>
                </span>
                       <span style="float:right;font-size:14px !important; font-weight: bold !important;line-height: 1.6em; color: #D12229">
                    <%#Eval("Quantity")%>
                </span>
                <hr style="margin-top:0px;" />
                           
                </ItemTemplate>
                 </asp:ListView>
                      </div>
                  <div class="col-md-4">
                   <asp:ListView runat="server" id="rptRooms2">
                    <ItemTemplate>
                        
                            
                    <span style="color: #000000;font-weight:bold;font-size:14px !important;line-height: 1.6em;"><%#Eval("Name") %>
                </span>
                       <span style="float:right;font-size:14px !important; font-weight: bold !important;line-height: 1.6em; color: #D12229">
                    <%#Eval("Quantity")%>
                </span>
                <hr style="margin-top:0px;" />
                           
                </ItemTemplate>
                 </asp:ListView>  
                  
                      </div>
                  <div class="col-md-4" runat="server" id="trRooms3" visible="false">
                   <asp:ListView runat="server" id="rptRooms3">
                    <ItemTemplate>
                        
                            
                    <span style="color: #000000;font-weight:bold;font-size:14px !important;line-height: 1.6em;"><%#Eval("Name") %>
                </span>
                       <span style="float:right;font-size:14px !important; font-weight: bold !important;line-height: 1.6em; color: #D12229">
                    <%#Eval("Quantity")%>
                </span>
                <hr style="margin-top:0px;" />
                           
                </ItemTemplate>
                 </asp:ListView>  
                  
                      </div>
                   <asp:DataList runat="server"   RepeatDirection="Vertical"  RepeatColumns="<%# (int)(PropertyroomsCount<=4?1:PropertyroomsCount<=8?2:3) %>"  Width="100%" >
            
                <ItemTemplate>
                    <span style="color: #000000;font-weight:bold;font-size:14px !important;line-height: 1.6em;"><%#Eval("Name") %>
                </span>
                       <span style="float:right;font-size:14px !important; font-weight: bold !important;line-height: 1.6em; color: #D12229">
                    <%#Eval("Quantity")%>
                </span>
                <hr style="margin-top:0px;" />
                </ItemTemplate>
                       <ItemStyle CssClass="col-md-2" />
            </asp:DataList>
        <%--    <asp:Repeater runat="server" ID="rptRooms">
                <ItemTemplate>
                     <span style="color: #000000;font-weight:bold;"><%#Eval("Name") %>&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
                <span style="float:right; font-weight: bold !important; color: #D12229">
                    <%#Eval("Quantity")%>
                </span>
                <hr style="margin-top:0px;" />
                </ItemTemplate>
            </asp:Repeater>--%>
                </div>

           
             <%-- <div class="col-md-2" style="margin-top: 40px;">
                   <div runat="server" id="trBedroom">
                <span style="color: #000000;font-weight:bold;">Bedrooms&nbsp;&nbsp;&nbsp;
                </span>
                <span style="float:right;font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrBedrooms"></asp:Literal>
                </span>
                 <hr style="margin-top:0px;" /></div>
                     <div runat="server" id="trFamilyRoom">
                <span style="color: #000000;font-weight:bold;">Family Room&nbsp;&nbsp;
                </span>
                <span style="float:right;font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrFamilyRoom"></asp:Literal>
                </span>
                  <hr style="margin-top:0px;" /></div>
                  <div runat="server" id="trBath">
                <span style="color: #000000;font-weight:bold;">Bathrooms&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
                <span style="float:right; font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrBathrooms"></asp:Literal>
                </span>
                <hr style="margin-top:0px;" /></div>
                 <div runat="server" id="trParking">
                <span style="color: #000000;font-weight:bold;">Parking&nbsp;&nbsp;
                </span>
                <span style="float:right;font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrParkings"></asp:Literal>
                </span>
                  <hr style="margin-top:0px;" /></div>

                 <div runat="server" id="trZoning">
                <span style="color: #000000;font-weight:bold;">Zoning&nbsp;&nbsp;
                </span>
                <span style="float:right;font-weight: bold !important; color: #D12229">
                    <asp:Literal runat="server" ID="ltrZone"></asp:Literal>
                </span>
                                     <hr style="margin-top:0px;" /></div>
            </div>
      
      <div class="col-md-1" style="margin-top: 40px; margin-bottom:10px;">
                </div>--%>
            <div class="col-md-4" style="margin-top: 25px" id="trAmenities" runat="server">
                                    <div runat="server" id="TableFeatures">
                      <table class="table">
                        <colgroup>
                          <col class="col-xs-3">
                          <col class="col-xs-3">
                        </colgroup>
                        <thead>
                          <tr class="bg-gray">
                            <th>
                                Amenities</th>
                          </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                           <asp:DataList runat="server" ID="featuresList" RepeatDirection="Vertical" RepeatColumns="3" Width="100%" >
                <HeaderTemplate>
                    <ul >
                </HeaderTemplate>
                <ItemTemplate>
                    <li style="display:inline-block; font-size:13px;">
                        <span style="font-weight:bolder;">-</span><asp:Label Text='<%# Eval("Name") %>' ID="lblFeature" runat="server" />
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:DataList>
                                    </td>
                            </tr>
                        </tbody>
                      </table>
                    </div>
               
            </div>
        </div>
        <div class="row">
               <div runat="server" id="trPropDescription" visible="false">
                <span style="color: #000000;font-weight:bold;text-decoration:underline">Description:
                </span><br /><br />
                <span style="font-weight: bold !important;">
                    <asp:Literal runat="server" ID="ltrPropDescription"></asp:Literal>
                </span>
                 <hr style="margin-top:0px;" /></div>
        </div>
      <%--  <h1 class="Title" style="border: none !important;">Nearby places</h1>
        <div class="clear"></div>

        <div class="row" style="text-align: center;">
            <asp:Repeater runat="server" ID="rptNearBy">
                <ItemTemplate>
                    <div class="col-md-4" style="margin-top: 40px">
                        <asp:Image runat="server" ImageUrl="~/img/places.png" />
                        <%--<asp:Literal runat="server" Text='<%#Eval("Place") %>'></asp:Literal>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>--%>
          <div class="clear"></div>  <asp:HyperLink NavigateUrl="tel:+961 1 993399" Width="50px" ToolTip="Call" CssClass="btn" runat="server" >
                   <asp:Image ImageUrl="~/img/Phone.png" runat="server" /><%--&nbsp;Call--%>
                </asp:HyperLink>
                  <asp:HyperLink id="IntrestedUrl1" ToolTip="Email" CssClass="btn" runat="server" >
                    <asp:Image ImageUrl="~/img/Email.png" runat="server" /><%-->&nbsp;Email--%>
                 </asp:HyperLink>

                  <asp:HyperLink  NavigateUrl="mailto:info@pbm-leb.com " Width="50px" ToolTip="Share" CssClass="btn" runat="server" >
                    <asp:Image ImageUrl="~/img/Share.png" runat="server" /><%--&nbsp;Share--%>
                 </asp:HyperLink>
        <div class="clear"></div>
        <h3 class="Title">Similar Properties</h3>
         <div class="clearfix"></div>
        <div class="row" style="position: relative">
            <div class="col-md-12">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="pnlSimilarProjects">
                    <ProgressTemplate>
                        <img src="/img/imgLoading.gif" alt="Loading" class="imgLoad" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="pnlSimilarProjects" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
<%--                        <asp:DataPager runat="server" ID="DataPager1" PagedControlID="rptSimilarProjects" PageSize="4">
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
                        <asp:ListView runat="server" ID="rptSimilarProjects" >
                            <ItemTemplate>
                                <div class="col-md-4" style="margin-bottom: 40px">  
                                    
                                    <div class="imgContainer" style="width: 100%;background:lightgray; height: 280px;overflow:hidden;position:relative; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);">
                                                                           <a style="overflow:hidden;height:100%;width:100%;display:flex" href='<%#ResolveUrl("~/") +(Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ","").Split('-')[0] :Eval("PropertyType").ToString().Contains("/") ? Eval("PropertyType").ToString().Replace(" ","").Split('/')[0]  : Eval("PropertyType")) + "/" + (!string.IsNullOrEmpty(Eval("Qadaa").ToString())?Eval("Qadaa"):"Qadaa") + "/" + (!string.IsNullOrEmpty(Eval("District").ToString())?Eval("District"):"District" )+ "/" + Eval("PRL") %>'
                        title='<%# (Eval("Department") != null && !string.IsNullOrEmpty(Eval("Department").ToString())) ? Eval("Department") + " - " + Eval("District") : (Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ", "").Split('-')[1] : Eval("PropertyType")) + " for " + Eval("PropertyFor") + " in " + Eval("District")%>'>
                                        <asp:Image CssClass="CenteredImage" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?Id=" + Eval("PRL") + "&secImg=big" %>'
                                            Style="    position: absolute;left: -100%;right: -100%;top: -100%;bottom:-100%;margin: auto;min-width: 100%;min-height: 100%;;background-color: darkgray; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);" runat="server" AlternateText='<%# Eval("PropertyType") + " for " +  Eval("PropertyFor") %>' />
                                        
                                      <div class="PriceTag" style="background-color:#d12229 !important;"><%# string.Format("{0:###,###,##0}", (Eval("PropertyFor").ToString().ToLower().Contains("rent") && Eval("PropertyFor").ToString().ToLower().Contains("sale") ? string.Format("{0:###,###,##0}",Eval("saleprice")) +" USD <br>"+string.Format("{0:###,###,##0}",Eval("RentPrice"))+ " USD / year" :Eval("PropertyFor").ToString().ToLower().Contains("rent") ? string.Format("{0:###,###,##0}",Eval("RentPrice"))+ " USD / year" : string.Format("{0:###,###,##0}",Eval("saleprice"))+" USD"))%></div>
                                            </a>
                                    </div>
                                          <a href='<%#ResolveUrl("~/") +(Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ","").Split('-')[0]  :Eval("PropertyType").ToString().Contains("/") ? Eval("PropertyType").ToString().Replace(" ","").Split('/')[0] : Eval("PropertyType")) + "/" + (!string.IsNullOrEmpty(Eval("Qadaa").ToString())?Eval("Qadaa"):"Qadaa") + "/" + (!string.IsNullOrEmpty(Eval("District").ToString())?Eval("District"):"District" )+ "/" + Eval("PRL") %>'>
                                    <span style="color: #000000; font-weight: bold !important;height:170px !important;overflow-wrap:break-word; font-size: 20px; display: block; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.1); padding: 15px; text-transform: uppercase"><span style="color:#d12229"><%#Eval("PropertyType") +" for "+Eval("PropertyFor")%></span><br />
                                        <span style="font-weight:normal"><%#" in "+ (Eval("District").ToString().ToLower()=="achrafieh"?" Achrafieh ":" ") +Eval("Neighborhood")  %></span>
                                        </a>
                                       <%-- <span style="font-weight: normal; font-size: 18px;height:65px !important;display:block;overflow:hidden; ">
                                            <%# Eval("Web_GuideDescription").ToString()%>
                                        </span>--%>
                                                                              <div style="position:absolute;bottom:10px;left:30px;">
                                              <div style="width: 100%; margin-left: auto; margin-right: auto; padding: 5px; padding-left:0px !important">
                                          <span style="margin: 15px" runat="server" visible='<%#(int)Eval("TotalBedrooms")<=0?false:true %>'>
                                                 <span style="color:#d12229"><%#Eval("TotalBedrooms") %></span>  
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
                                            <span style="font-weight: normal; font-size: 18px" runat="server" visible='<%#(int)Eval("Size")<=0?false:true %>'>
                                            <span style="font-weight: bold;">Size: </span><%#Eval("Size") %> m2
                                        </span>
                                        <div class="clear"></div>
                                        <span style="font-weight: normal; font-size: 18px">
                                            <span style="font-weight: bold;">Ref #: </span><%#Eval("PRL") %>
                                        </span>
                                            </div>
                                    </span>
                                       
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <div class="clear" />
                        </div>
                     <%--   <div class="paginationContainer">
                            <asp:DataPager runat="server" ID="dtProps" PagedControlID="rptSimilarProjects" PageSize="3">
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
                        </div>
                    <div runat="server" id="NoResult" visible="false" style="color: #D12229; font-size: larger; text-align: center;">No Results found</div>
                    </ContentTemplate>
                </asp:UpdatePanel>


            </div>
        </div>
    </div>
</asp:Content>
