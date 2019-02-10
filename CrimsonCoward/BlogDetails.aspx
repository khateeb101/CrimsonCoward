<%@ Page Title="Blog Details | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="BlogDetails.aspx.cs" Inherits="CrimsonCoward.BlogDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .newspaper {
            -webkit-column-count: 2; /* Chrome, Safari, Opera */
            -moz-column-count: 2; /* Firefox */
            column-count: 2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h3 class="Title">
            <asp:Literal Id="ltTitle" runat="server" /></h3>
        <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right; text-align: right;">
            <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>
        <div class="clearfix"></div>
         <div class="col-lg-12">
        <asp:Repeater runat="server" ID="rptBlogs">
            <ItemTemplate>
       

            <div class="col-md-6" >

               
                        <asp:Image ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?Blogid=" + Eval("Id") + "&secImg=HomeTips" %>' 
                                             Style="max-height: 510px;max-width:100%; margin-left: auto;margin-right: auto;display: block;" runat="server" AlternateText='<%# Eval("title")%>' /></a>
               <div class="row"> 
          <div style="padding-left:15px; padding-right:15px;">
        <h3 class="Title" style="border-left: unset !important;padding-left:0px !important;margin-bottom:0px !important">
          <%#Eval("title") %></h3>
        <div class="clearfix"></div><br />
        <h4 class="Title" style="border-left: unset !important;padding-left:0px !important; font-weight: normal !important;margin-top:0px !important; ">
            <%#Eval("Subtitle") %></h4>
        <div class="clear"></div>
        
            <div class="newspaper">
                 <%#Eval("description") %>
            </div>
        </div>
                <hr /></div>
                  </div>
     <div class="clearfix" style='<%# Container.ItemIndex % 2 == 0 ? "display:none" : "" %> '></div>
                </ItemTemplate>
        </asp:Repeater>
       
    </div>
</asp:Content>
