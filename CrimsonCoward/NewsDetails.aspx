<%@ Page Title="News Details | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="NewsDetails.aspx.cs" Inherits="CrimsonCoward.NewsDetails" %>

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
        <h3 class="Title">News</h3>
        <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right; text-align: right;">
            <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>

        <div class="clear"></div>

        <div class="row" style="margin-top: 20px; margin-bottom: unset;">
            <div class="col-lg-12">

                <div class="row" style="position: relative">
                    <div class="col-lg-12" style="border: 4px solid gray; padding: unset">
                        <asp:Image Style="max-height: 510px; width:100%;" runat="server" ID="img" />
                    </div>
                </div>
            </div>
        </div>
        <h3 class="Title" style="border-left: unset !important;margin-bottom:0px !important">
            <asp:Literal ID="ltrTitle" runat="server" /></h3>
        <div class="clearfix"></div><br />
        <h4 class="Title" style="border-left: unset !important; font-weight: normal !important;margin-top:0px !important; ">
            <asp:Literal ID="ltrSubtitle" runat="server" /></h4>
        <div class="clear"></div>
        <div class="row">
            <div class="newspaper">
                <asp:Literal ID="ltrDesc" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
