<%@ Page Title="CrimsonCoward | Real Estate Consultancy And Brokerage In Lebanon" Language="C#"
    MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs"
    Inherits="CrimsonCoward.home" EnableEventValidation="false" MaintainScrollPositionOnPostback="true" %>
<%@ Register Src="~/UcSearch.ascx" TagName="ucSearch" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">        menuID = "menu_home"</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="featured" style="position: relative;">
        <!-- Slider -->
        <div id="main-slider" class="flexslider">

            <div class="flex-caption">
            </div>
            <ul class="slides">
                
                <asp:Repeater runat="server" ID="rptBanner">
                    <ItemTemplate>
                        <li>
                                <asp:Image ImageUrl='<%# ResolveUrl("~/") + "ImageStreamer.aspx?PropertyImageId=" + Eval("Id")+"&r="+Guid.NewGuid() %>' runat="server" />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>

        </div>

        <!-- end slider -->
     
                 <uc1:ucSearch ID="ucSearch1" runat="server" />
       

    </section>
       <div class="container">
          <h3 class="Title">Latest Properties</h3>
           <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right">
                        <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>
        <div class="clear"></div>
       

            <div class="row" style="position: relative">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <img  src="/img/imgLoading.gif" alt="Loading" class="imgLoad" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Repeater runat="server" ID="rptLatestProperties">
                            <ItemTemplate>
                                <div class="col-lg-4" style="margin-bottom: 40px">  
                                    
                                   
                                    <div class="imgContainer" style="width: 100%;background:lightgray; height: 280px;overflow:hidden;position:relative; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);">
                                        <a style="overflow:hidden;height:100%;width:100%;display:flex" href='<%#ResolveUrl("~/") +(Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ","").Split('-')[0]  :Eval("PropertyType").ToString().Contains("/") ? Eval("PropertyType").ToString().Replace(" ","").Split('/')[0] : Eval("PropertyType")) + "/" + (!string.IsNullOrEmpty(Eval("Qadaa").ToString())?Eval("Qadaa"):"Qadaa") + "/" + (!string.IsNullOrEmpty(Eval("District").ToString())?Eval("District"):"District" )+ "/" + Eval("PRL") %>'
                        title='<%# (Eval("Department") != null && !string.IsNullOrEmpty(Eval("Department").ToString())) ? Eval("Department") + " - " + Eval("District") : (Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ", "").Split('-')[1] : Eval("PropertyType")) + " for " + Eval("PropertyFor") + " in " + Eval("District")%>'>
                                        <asp:Image CssClass="CenteredImage" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?Id=" + Eval("PRL") + "&secImg=big" %>'
                                            Style="    position: absolute;left: -100%;right: -100%;top: -100%;bottom:-100%;margin: auto;min-width: 100%;min-height: 100%;;background-color: darkgray; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);" runat="server" AlternateText='<%# Eval("PropertyType") + " for " +  Eval("PropertyFor") %>' />
                                        
                                        <div class="PriceTag" style="background-color:#d12229 !important;"><%# string.Format("{0:###,###,##0}", (Eval("PropertyFor").ToString().ToLower().Contains("rent") && Eval("PropertyFor").ToString().ToLower().Contains("sale") ? string.Format("{0:###,###,##0}",Eval("saleprice")) +" USD <br>"+string.Format("{0:###,###,##0}",Eval("RentPrice"))+ " USD / year" :Eval("PropertyFor").ToString().ToLower().Contains("rent") ? string.Format("{0:###,###,##0}",Eval("RentPrice"))+ " USD / year" : string.Format("{0:###,###,##0}",Eval("saleprice"))+" USD"))%></div>
                                            </a>
                                    </div>
                                          <a href='<%#(Eval("PropertyType").ToString().Contains("-") ? Eval("PropertyType").ToString().Replace(" ","").Split('-')[0] :Eval("PropertyType").ToString().Contains("/") ? Eval("PropertyType").ToString().Replace(" ","").Split('/')[0]  : Eval("PropertyType")) + "/" + (!string.IsNullOrEmpty(Eval("Qadaa").ToString())?Eval("Qadaa"):"Qadaa") + "/" + (!string.IsNullOrEmpty(Eval("District").ToString())?Eval("District"):"District" )+ "/" + Eval("PRL") %>'>
                                    <span style="color: #000000; font-weight: bold !important;height:170px !important;overflow-wrap:break-word; font-size: 20px; display: block; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.1); padding: 15px; text-transform: uppercase"><span style="color:#d12229"><%#Eval("PropertyType") +" for "+Eval("PropertyFor")%></span><br />
                                        <span style="font-weight:normal"><%#" in "+ (Eval("District").ToString().ToLower()=="achrafieh"?" Achrafieh ":" ") +Eval("Neighborhood")  %></span>
                                        </a>
                                       <%-- <span style="font-weight: normal; font-size: 18px;height:65px !important;display:block;overflow:hidden; ">
                                            <%# Eval("Web_GuideDescription").ToString()%>
                                        </span>--%>
                                                                              <div style="position:absolute;bottom:10px;left:30px;">
                                              <div style="width: 100%; margin-left: auto; margin-right: auto; padding: 5px; padding-left:0px !important">
                                           
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
                        </asp:Repeater>
                                <div class="clear"></div>
                        <div style="width:100%; position:relative;text-align:center">
                            <asp:LinkButton Text="View More" ID="btnViewMore" OnClick="btnViewMore_Click" style="border:1px solid #939597;padding:8px 10px 8px 10px; color:black;"  runat="server" />
                            </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnViewMore" />
                    </Triggers>
                </asp:UpdatePanel>
               

            </div>
        <h3 class="Title">ABOUT US</h3>
     
        <div class="clear"></div>
        <br />
        <div class="col-lg-12">
            <div class="project">
                <div class="row" style="position: relative">

                    <div class="col-lg-4" style="margin-bottom: 40px">
                        <asp:Image ImageUrl="~/img/homebadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                        <br />
                        <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span> is the winner of the Best Real Estate Agency in Lebanon for the year 2012 in the International Property Awards.</span>
                    </div>

                    <div class="col-lg-4" style="margin-bottom: 40px">
                        <asp:Image ImageUrl="~/img/globebadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                        <br />
                        <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span> is one of the few companies that provide a full-service in the Lebanese and International real estate market.</span>
                    </div>

                    <div class="col-lg-4" style="margin-bottom: 40px">
                        <asp:Image ImageUrl="~/img/agentbadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                        <br />
                        <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span> offers its clients a high level of professional real estate brokerage, property management and consulting services. </span>
                    </div>
                </div>
                <div class="row" style="position: relative">

                    <div class="col-lg-8" style="margin-bottom: 40px">
                        <asp:Image ImageUrl="~/img/housebadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                        <br />
                        <span style="display: block; margin-left: auto; margin-right: auto; width: 85%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span> is committed to building value through the high level services it provides to its clients and community. We are dedicated to obtaining the most favorable results for our clients while developing constructive, long-term and mutually rewarding relationships.</span>
                    </div>

                    <div class="col-lg-4" style="margin-bottom: 40px">
                        <asp:Image ImageUrl="~/img/notebadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                        <br />
                        <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span>  grants information and performance that is accurate, responsive, independent and confidential</span>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="clear"></div>
        <div class="row" style="width:100%;margin:unset; height:500px;position:relative;background:url('img/shutterstock_261828422.png'); background-size:cover !important;">
              <table style="width: 100%;position:absolute; margin-bottom: 50px;top:40%">

            <tr>
                <td style="position: relative; width: 100%; text-align: center; font-family: 'Open Sans'; font-size: 18px; color: #292929;">
                    <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; font-size: 23px; text-transform: uppercase;">
                        <span style="font-weight: bolder">Join our newsletter</span><br />
                        and receive the latest hot deals and home tips</span>
                </td>
            </tr>
            <tr>
                <td style="height: 30px;"></td>
            </tr>
            <tr>
                <td style="position: relative; width: 100%; text-align: center; font-family: 'Open Sans'; font-size: 18px; color: #292929;">
                    <asp:TextBox runat="server" ID="txtEmail" ValidateRequestMode="Enabled" TextMode="Email" Width="300px" CssClass="text-center" placeholder="Enter Your Email" />
                    <br /><br />
                    <asp:Button Text="Subscribe" ID="btnSubscribe" style="margin-left:auto;margin-right:auto;display:block"  Width="150px" CssClass="btn btn-success btn-lg btn-block" OnClick="btnSubscribe_Click" runat="server" />
                </td>
            </tr>
        </table>
        </div>
     
      <div class="container">


        <h3 class="Title">PARTNERSHIPS</h3>
        <div class="clear"></div>
        <asp:Repeater runat="server" ID="rptPartnership">
            <ItemTemplate>
                <div class="col-md-12" style="box-shadow: 0 0 5px 0 rgba(0,0,0,0.1); padding:unset !important; margin:unset !important">
                
                    <div class="col-md-6 newsbox" style="padding-left:0px !important;padding-right:0px !important;background-color: darkgray">
                          <asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?partnershipId=" + Eval("Id") + "&secImg=PartnershipThumb" %>'
                                            Width="100%" Style="max-height: 280px" runat="server" AlternateText='<%# Eval("title")%>' />
                    </div>
                      <div class="col-md-6 newsbox" style="padding-left:0px !important;padding-right:0px !important; margin-bottom: 50px;margin-top:40px;display:inline-block">
                           <h3 style="text-transform: uppercase; margin-left: 20px;"><%#Eval("Title") %></h3>
                           <span class="col-md-8"  style="float: left;margin-left: 5px;font-size: 20px;"><%#Eval("Text") %></span>
                    <asp:Image CssClass="col-md-3" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?partnershipId=" + Eval("Id") + "&logo=true&secImg=logo" %>'
                                            Style="margin-right: 15px" runat="server" AlternateText='<%# Eval("title")%>' />
                    </div>
            
                    </div>
              <%--  <table style="width: 100%; margin-bottom: 50px;">

            <tr style="height: 280px; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);">
                <td style="background-color: darkgray; width: 50%;">
                    <asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?partnershipId=" + Eval("Id") + "&secImg=PartnershipThumb" %>'
                                            Width="100%" Style="max-height: 510px" runat="server" AlternateText='<%# Eval("title")%>' />
                </td>
                <td>
                    <h3 style="text-transform: uppercase; margin-left: 20px;"><%#Eval("Title") %></h3>
                   <div class="row">
                         <span class="col-md-8"  style="float: left;margin-left: 20px;font-size: 20px;"><%#Eval("Text") %></span>
                    <asp:Image CssClass="col-md-3" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?partnershipId=" + Eval("Id") + "&logo=true&secImg=logo" %>'
                                            Style="margin-right: 15px" runat="server" AlternateText='<%# Eval("title")%>' />
                   </div>
                  
                </td>
            </tr>
        </table>--%>

            </ItemTemplate>
        </asp:Repeater>
               
        <h3 class="Title">NEWS & TIPS</h3>
        <div class="clear"></div>
     

           
              <asp:Repeater runat="server" ID="lstNews">
                      <ItemTemplate>
                                          <div class="col-md-12" style="box-shadow: 0 0 5px 0 rgba(0,0,0,0.1); padding:unset !important; margin:unset !important">
                
                    <div class="col-md-6 newsbox" style="padding-left:0px !important;padding-right:0px !important;background-color: darkgray">
                          <asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?newsid=" + Eval("Id") + "&secImg=PartnershipThumb" %>'
                                            Width="100%" Style="max-height: 280px" runat="server" AlternateText='<%# Eval("title")%>' />
                    </div>
                      <div class="col-md-6 newsbox" style="padding-left:0px !important;padding-right:0px !important;margin-top:40px; display:inline-block">
                           <h3 style="text-transform: uppercase; margin-left: 20px;"><%#Eval("title") %></h3>
                           <span class="col-md-10"  style="float: left;margin-left: 5px;font-size: 20px;"><%#Eval("description").ToString() %></span>
                  
                    </div>
            
                    </div>
              <%--  <table style="width: 100%; margin-bottom: 50px;">

            <tr style="height: 280px; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);">
                <td style="background-color: darkgray; width: 50%;">
                    <asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?newsid=" + Eval("Id") + "&secImg=PartnershipThumb" %>'
                                            Width="100%" Style="max-height: 510px" runat="server" AlternateText='<%# Eval("title")%>' />
                </td>
                <td>
                    <h3 style="text-transform: uppercase; margin-left: 20px;"><%#Eval("title") %></h3>
                  
                         <span   style="float: left;margin-left: 20px;font-size: 20px;"><%#Eval("description").ToString().Substring(0,200) %></span>
                  
                  
                  
                </td>
            </tr>
        </table>--%>
            </ItemTemplate>
               <%--     <ItemTemplate>
                        <div class="col-lg-12" style="margin-bottom: 20px">
                    <a href='<%#Eval("Link") != null && !string.IsNullOrEmpty(Eval("Link").ToString()) ?Eval("Link") :ResolveUrl("~/") +"NewsDetails.aspx?id="+ Eval("Id")  %>'><asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?newsid=" + Eval("Id") + "&secImg=HomeNewsThumb" %>'
                                            Width="100%" Style="max-height: 510px" runat="server" AlternateText='<%# Eval("title")%>' /></a>
                        <span style="color: #000000; font-weight: bold !important; font-size: 20px; display: block; box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1); padding: 15px;">REAL ESTATE</span>
                    </div>
                    </ItemTemplate>--%>
                </asp:Repeater>
                
                <asp:ListView runat="server" ID="lstTips">
                    <ItemTemplate>
                        <div class="col-lg-6" style="margin-bottom: 20px">
                    <a href='<%#Eval("Link") != null && !string.IsNullOrEmpty(Eval("Link").ToString())?Eval("Link"):ResolveUrl("~/") +"HomeTips.aspx" %>'><asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?HomeTipid=" + Eval("Id") + "&secImg=HomeNewsThumb" %>'
                                            Width="100%" Style="max-height: 510px" runat="server" AlternateText='<%# Eval("title")%>' /></a>
                    <span style="color: #000000; font-weight: bold !important; font-size: 20px; display: block; box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1); padding: 15px;">
                        HOME TIPS
                    </span>
                </div>
                    </ItemTemplate>
                </asp:ListView>
                

           
      

        <h3 class="Title">Memberships</h3>
        <div class="clear"></div>
        <div class="col-lg-12">
            <div class="row" style="box-shadow: 6px 2px 6px 0px rgba(0,0,0,0.1);">

                <div class="col-lg-4">
                    <asp:Image ImageUrl="~/img/Real.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto; padding: 15px;" />
                </div>
                <div class="col-lg-4">
                    <asp:Image ImageUrl="~/img/FiaBCI.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto; padding: 15px;" />
                </div>
                <div class="col-lg-4">
                    <asp:Image ImageUrl="~/img/RealTor.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto; padding: 15px;" />
                </div>


            </div>
        </div>
        <h3 class="Title">contact us</h3>
        <div class="clear"></div>
             <div class="col-md-12" style="box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);margin-bottom: 50px;">
                
                    <div class="col-md-6 newsbox" style="padding-left:0px !important;padding-right:0px !important;background-color: darkgray">
                       <iframe width="100%" height="280px"
                        frameborder="0" style="border: 0"
                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAc_M_kWLeLkrZ7rUfL_orpAaBJB9b4ogY&q=CrimsonCoward" allowfullscreen></iframe>
                    </div>
                 
                      <div class="col-md-6 newsbox" style="padding-left:0px !important;padding-right:0px !important; margin-bottom: 50px;margin-top:40px;padding-left:15px ; display:inline-block">
                              <span class="col-md-12" style="float: left;color:black;font-size:16px; font-weight:bold">Zahia Kaddoura Street, Khatchadourian Bld,<br />
                        1st floor, Down Town Beirut, Lebanon<br />
                        <span style="color:red"> P.O. Box:</span> 175 315 Beirut, Lebanon<br />
                        <span style="color:red"> T /F</span> +961 1 993399 (ext.101)<br />
                        <span style="color:red"> M</span> +961 70 600670
                        <br />
                        info@pbm-leb.com
                    </span>
                    </div>
            
                    </div>
      <%--  <table style="width: 100%; margin-bottom: 50px;">

            <tr style="height: 280px; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);">
                 <td style="width:50%;"><iframe width="100%" height="280px"
                        frameborder="0" style="border: 0"
                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAc_M_kWLeLkrZ7rUfL_orpAaBJB9b4ogY&q=CrimsonCoward" allowfullscreen></iframe></td>
               
                <td>

                    <span  style="float: left;height:100%;color:black;font:18px; font-weight:bold;margin-top:-40px; margin-left: 15px;">Zahia Kaddoura Street, Khatchadourian Bld,<br />
                        1st floor, Down Town Beirut, Lebanon<br />
                        <span style="color:red"> P.O. Box:</span> 175 315 Beirut, Lebanon<br />
                        <span style="color:red"> T /F</span> +961 1 993399 (ext.101)<br />
                        <span style="color:red"> M</span> +961 70 600670
                        <br />
                        info@pbm-leb.com
                    </span>
                </td>
            </tr>
        </table>--%>

      
        


    </div>
</asp:Content>

