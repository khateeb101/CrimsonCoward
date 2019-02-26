<%@ Page Title="CrimsonCoward | Real Estate Consultancy And Brokerage In Lebanon" Language="C#"
    MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="CCHome.aspx.cs"
    Inherits="CrimsonCoward.CCHome" EnableEventValidation="false" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/UcSearch.ascx" TagName="ucSearch" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">        menuID = "menu_home"</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section id="featured" style="position: relative; display: grid">
        <!-- Slider -->
        <div id="main-slider" class="flexslider">

            <div class="flex-caption">
            </div>
            <ul class="slides">

                <asp:Repeater runat="server" ID="rptBanner">
                    <ItemTemplate>
                        <li>
                            <asp:Image runat="server" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?id=" + Eval("Id") + "&secImg=HomeTips&r="+Guid.NewGuid()  %>' />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>

        </div>
        <!-- end slider -->
    </section>
    <section id="story" style="position: relative; display: grid;">
        <h3 class="title">
            <img src="assets/CC_Assets_Titles_OUR-STORY.png" alt="Our Story" /></h3>
        <p class="text">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        </p>
        <p class="text" style="padding-bottom: 20px;">
            try's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        </p>
    </section>
    <section id="article" style="position: relative;">
        <div id="article1" class="col-lg-6 article">
            <div class="CenteredImage">
                <h2 style="color: white;">HOURS OF OPERATION</h2>
                <h3 style="color: white;">MONDAY - Sunday<br />
                    12 PM TO 12 AM</h3>
            </div>
        </div>
        <div id="article2" class="col-lg-6 article">
            <div class="CenteredImage">
                <h3 style="color: white;">10405 Lakewood Blvd
                    <br />
                    Downey CA 90241</h3>
            </div>
        </div>
    </section>
    <section id="banner" style="position: relative;">
        <div id="banner1" class="col-lg-12 article" style="height: 335px;">
            <img src="assets/CC_Assets_Titles_Follow-US.png" alt="Follow us" style="width: 100%" />
        </div>
    </section>
    <section id="map" style="position: relative;">
        <div id="map1" class="col-lg-12 article" style="padding: 0px; height: 300px">
            <div class="col-md-12 newsbox" style="padding-left: 0px !important; padding-right: 0px !important; background-color: darkgray">
                <iframe width="100%" height="300px"
                    frameborder="0" style="border: 0"
                    src="https://www.google.com/maps/embed/v1/place?key=*********************&q=CrimsonCoward" allowfullscreen></iframe>
            </div>
        </div>
    </section>
    <section id="footer">
                    <div style="background-color:#842522;display:inline-block; width:100%; border-top:10px solid #E9B244">
                         <div class="row col-lg-12">
                        <div class="col-lg-12 CenteredImage"  style="width:60%;padding-top:20px;">
                            <asp:TextBox placeholder="ENTER EMAIL ADDRESS" style="padding-left:10px;" BorderStyle="None" Width="70%" Height="50px" runat="server" ID="txtSubscribe" CssClass="text"></asp:TextBox>
                            <asp:Button OnClientClick="return validateEmail($this.text)" OnClick="btnSubscribe_Click" ID="btnSubscribe" runat="server" Width="25%" Height="50px" Text="STAY TUNED" BackColor="#E9B244" BorderStyle="None" ForeColor="White" Font-Bold="true" />
                        </div>
                             </div>
                           
                         <div class="row col-lg-12" style="text-align:center">
                        <div class="col-lg-12 CenteredImage"  style="width:60%">
                          <h3 style="color:white; font-weight:bold;">DO YOU NEED ANY HELP?</h3>
                            <h5 style="color:white; font-weight:lighter">“Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.”</h5>
                        </div>
                            </div>
                        <div class="row col-lg-12">
                            <div class="col-lg-push-1 col-lg-4 col-sm-12 col-sm-push-0">
                               
                <h4 style="color: white;">HOURS OF OPERATION</h4>
                <h5 style="color: white;">MONDAY - Sunday<br />
                    12 PM TO 12 AM</h5>
           <h5 style="color: white;">10405 Lakewood Blvd
                    <br />
                    Downey CA 90241</h5><br />

                                <div>
                                <a style="color:white; font-weight:bold" href="javascript:$('html, body').animate({ scrollTop: 0 }, 700);">HOME</a>&nbsp-&nbsp
                                <a style="color:white; font-weight:bold" href="javascript:$('html, body').animate({ scrollTop: $('#story').position().top},700);">OUR STORY</a>&nbsp-&nbsp
                                <a style="color:white; font-weight:bold" href="javascript:$('html, body').animate({ scrollTop: $(document).height()},700);"">CONTACT US</a>
                                    </div>
            </div>
                          
                            <div class="col-lg-4" style="text-align:center">
                                <asp:Label runat="server" Text="CONTACT US!" BackColor="White" BorderStyle="None" style="border-radius:5px;" Font-Bold="true" ForeColor="#842522" Width="140px" Height="22px"   />
                                <div class="clear"></div>
                                
                                     <img ImageHeight="33px" src="~/assets/footer_Facebook.png" style="margin-top: 20px; margin-bottom:5px;" runat="server" />
                                
                                    <img ImageHeight="33px" src="~/assets/footer_Insta.png" style="margin-top: 20px; margin-bottom:5px;" runat="server" />
                                
                                    <img ImageHeight="33px" src="~/assets/footer_Snap.png" style="margin-top: 20px; margin-bottom:5px;" runat="server" />
                                 
                                
                            </div>
                            <div class="col-lg-pull-1 col-lg-4  col-sm-12 col-sm-pull-0" style="text-align:right">
                                <img  src="assets/footer_logo.png" />
                                <h5 style="color:white">Copyright © 2019 - CRIMSON COWARD - All Rights Reserved</h5>
                            </div>
                        </div>
                    </div>
                </section>
    <%-- <section id="banner" style="position:relative;">
          <div id="banner1" class="col-lg-5 article">
          
           </div>
                   <div id="socialBanner" class="col-lg-2 article">
                       </div>
          <div id="banner2" class="col-lg-5 article">
            
           </div>
    </section>   --%>
</asp:Content>

