<%@ Page Title="Post Request | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="PostRequest.aspx.cs" Inherits="CrimsonCoward.PostRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
         @media (min-width: 100px) and (max-width: 1200px) {
            .Mid {
                width:unset !important;
            }
        }
        .form-control {
            display: inline-block !important;
            width: 65% !important;
            margin-right: 15px !important;
            vertical-align: middle;
            float: right;
        }
       
        @media (min-width: 1200px) {
            .Mid {
                display: inline-block !important;
                width: 31% !important;
                margin-right: 15px !important;
                vertical-align: middle;
                float: right;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h3 class="Title">Request Details</h3>
        <div id="Titlebtn1" style="width: 35%; margin-top: 35px; display: none; float: right; text-align: right;">
            <asp:HyperLink Text="Post Request" NavigateUrl="~/PostRequest.aspx" Width="135px" CssClass="btn" runat="server" />
            <asp:HyperLink Text="Post Property" NavigateUrl="~/PostProperty.aspx" Width="140px" CssClass="btn" runat="server" />
        </div>

        <div class="clear"></div>

        <div class="row" style="margin-top: 20px;">
            <div class="col-lg-6">

                <div class="row" style="position: relative">
                    <asp:Label Text="City" CssClass="label" runat="server"></asp:Label>
                    <asp:TextBox ID="txtCity" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Required" CssClass="color-red" ControlToValidate="txtCity" runat="server" />
                </div>
                <div class="row" style="position: relative">
                    <asp:Label Text="Area" CssClass="label" runat="server"></asp:Label>
                    <asp:TextBox ID="txtArea" CssClass="form-control" runat="server" />
                </div>
                <div class="row" style="position: relative">
                    <asp:Label Text="TYpe" CssClass="label" runat="server"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlType" CssClass="form-control" ClientIDMode="Static"
                                            AutoPostBack="true">
                                            <asp:ListItem Value="Appartment">Apartment</asp:ListItem>
                                            <asp:ListItem Value="Land">Land</asp:ListItem>
                                            <asp:ListItem Value="Building">Building</asp:ListItem>
                                            <asp:ListItem Value="Store/Showroom">Store/Showroom</asp:ListItem>
                                            <asp:ListItem Value="Warehouse">Warehouse</asp:ListItem>
                                            <asp:ListItem Value="Villa">Villa</asp:ListItem>
                                            <asp:ListItem Value="Office">Office</asp:ListItem>
                                            <asp:ListItem Value="Chalet">Chalet</asp:ListItem>
                                            <asp:ListItem Value="Hotel">Hotel</asp:ListItem>
                                            <asp:ListItem Value="Clinic">Clinic</asp:ListItem>
                                        </asp:DropDownList>
                </div>
                <div class="row" style="position: relative">
                    <asp:Label Text="Service" CssClass="label" runat="server"></asp:Label>
                     <asp:DropDownList runat="server" ID="ddlService" CssClass="form-control">
                                            <asp:ListItem Value="Rent/Sale">Select</asp:ListItem>
                                            <asp:ListItem Value="Sale">Sale</asp:ListItem>
                                            <asp:ListItem Value="Rent">Rent</asp:ListItem>
                                        </asp:DropDownList>
                </div>
                <div class="row" style="position: relative">
                    <asp:Label Text="Size (m2)" CssClass="label" runat="server"></asp:Label>
                    <asp:TextBox ID="txtSize" CssClass="form-control" runat="server" />
                </div>
                <div class="row" style="position: relative">
                    <asp:Label Text="Price (USD)" CssClass="label" runat="server"></asp:Label>
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" />
                </div>
            </div>
            <div class="col-lg-6" style="padding:unset !important;">
                <div class="col-lg-6">
                    <div class="row" style="position: relative">
                        <asp:Label Text="Bedrooms" CssClass="label" runat="server"></asp:Label>
                          <asp:DropDownList runat="server" CssClass="form-control Mid" ClientIDMode="Static" ID="drpBedrooms">
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="6" Value="6" />
                    <asp:ListItem Text="7" Value="7" />
                    <asp:ListItem Text="8" Value="8" />
                    <asp:ListItem Text="9" Value="9" />
                    <asp:ListItem Text="10" Value="10" />
                </asp:DropDownList>
                        <%--<asp:TextBox ID="txtBedrooms" CssClass="form-control Mid" runat="server" />--%>
                    </div>
                    <div class="row" style="position: relative">
                        <asp:Label Text="Bathrooms" CssClass="label" runat="server"></asp:Label>
                         <asp:DropDownList runat="server" CssClass="form-control Mid" ClientIDMode="Static" ID="drpBathrooms">
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="6" Value="6" />
                    <asp:ListItem Text="7" Value="7" />
                    <asp:ListItem Text="8" Value="8" />
                    <asp:ListItem Text="9" Value="9" />
                    <asp:ListItem Text="10" Value="10" />
                </asp:DropDownList>
                        <%--<asp:TextBox ID="txtBathrooms" CssClass="form-control Mid" runat="server" />--%>
                    </div>
                    <div class="row" style="position: relative">
                        <asp:Label Text="Balconies" CssClass="label" runat="server"></asp:Label>
                         <asp:DropDownList runat="server" CssClass="form-control Mid" ClientIDMode="Static" ID="drpBalconies">
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="6" Value="6" />
                    <asp:ListItem Text="7" Value="7" />
                    <asp:ListItem Text="8" Value="8" />
                    <asp:ListItem Text="9" Value="9" />
                    <asp:ListItem Text="10" Value="10" />
                </asp:DropDownList>
                        <%--<asp:TextBox ID="txtBalconies" CssClass="form-control Mid" runat="server" />--%>
                    </div>
                    <div class="row" style="position: relative">
                        <asp:Label Text="Living" CssClass="label" runat="server"></asp:Label>
                          <asp:DropDownList runat="server" CssClass="form-control Mid" ClientIDMode="Static" ID="drpLiving">
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="6" Value="6" />
                    <asp:ListItem Text="7" Value="7" />
                    <asp:ListItem Text="8" Value="8" />
                    <asp:ListItem Text="9" Value="9" />
                    <asp:ListItem Text="10" Value="10" />
                </asp:DropDownList>
                        <%--<asp:TextBox ID="txtLiving" CssClass="form-control Mid" runat="server" />--%>
                    </div>
                    <div class="row" style="position: relative">
                        <asp:Label Text="STORAGE" CssClass="label" runat="server"></asp:Label>
                        <asp:DropDownList runat="server" CssClass="form-control Mid" ClientIDMode="Static" ID="drpStorage">
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="6" Value="6" />
                    <asp:ListItem Text="7" Value="7" />
                    <asp:ListItem Text="8" Value="8" />
                    <asp:ListItem Text="9" Value="9" />
                    <asp:ListItem Text="10" Value="10" />
                </asp:DropDownList>
                        <%--<asp:TextBox ID="txtStorage" CssClass="form-control Mid" runat="server" />--%>
                    </div>
                    <div class="row" style="position: relative">
                        <asp:Label Text="Parking" CssClass="label" runat="server"></asp:Label>
                          <asp:DropDownList runat="server" CssClass="form-control Mid" ClientIDMode="Static" ID="drpParking">
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="6" Value="6" />
                    <asp:ListItem Text="7" Value="7" />
                    <asp:ListItem Text="8" Value="8" />
                    <asp:ListItem Text="9" Value="9" />
                    <asp:ListItem Text="10" Value="10" />
                </asp:DropDownList>
                        <%--<asp:TextBox ID="txtParking" CssClass="form-control Mid" runat="server" />--%>
                    </div>
                </div>
                                <div class="col-lg-6">
                    <div class="row" style="position: relative">
                        <asp:Label Text="AC" CssClass="label" runat="server"></asp:Label>
                        <asp:CheckBox Text="text"  CssClass="form-control Mid" ID="chkAc" runat="server" />
                       <%-- <asp:TextBox  ID="txtAc" CssClass="form-control Mid" runat="server" />--%>
                    </div>
                    <div class="row" style="position: relative">
                        <asp:Label Text="BOILER" CssClass="label" runat="server"></asp:Label>
                         <asp:CheckBox Text="text"  CssClass="form-control Mid" ID="chkBoiler" runat="server" />
                        <%--<asp:TextBox ID="txtBoiler" CssClass="form-control Mid" runat="server" />--%>
                    </div>
                    <div class="row" style="position: relative">
                        <asp:Label Text="FLOOR" CssClass="label" runat="server"></asp:Label>
                        <asp:TextBox ID="txtFloor" CssClass="form-control Mid" runat="server" />
                    </div>
                    <div class="row" style="position: relative">
                        <asp:Label Text="ADDITIONAL REQUIREMENTS" CssClass="label" runat="server"></asp:Label>
                        <asp:TextBox ID="txtRequirements" TextMode="MultiLine" style="width: 90%!important;margin-top: 20px!important;height: 138px!important;" CssClass="form-control Mid" runat="server" />
                    </div>
                  
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 20px">
            <div class="col-lg-6">
                <div class="row" style="position: relative">
                    <asp:Label Text="Full name*" Font-Size="21px" CssClass="label" runat="server"></asp:Label>
                    <asp:TextBox ID="txtFullName" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Required" CssClass="color-red" ControlToValidate="txtFullName" runat="server" />
                </div>
                <div class="row" style="position: relative">
                    <asp:Label Text="Email*" Font-Size="21px" CssClass="label" runat="server"></asp:Label>
                    <asp:TextBox  ID="txtEmail" TextMode="Email" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Required" CssClass="color-red" ControlToValidate="txtEmail" runat="server" />
                </div>
            </div>

            <div class="col-lg-6">
                <div class="row" style="position: relative">
                    <asp:Label Text="Address" Font-Size="21px" CssClass="label" runat="server"></asp:Label>
                    <asp:TextBox ID="txtPersonnalAddress" CssClass="form-control" runat="server" />
                </div>
                <div class="row" style="position: relative">
                    <asp:Label Text="Phone*" Font-Size="21px" CssClass="label" runat="server"></asp:Label>
                    <asp:TextBox ID="txtPhone" TextMode="Phone" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Required" CssClass="color-red" ControlToValidate="txtPhone" runat="server" />
                </div>
                <div class="row" style="position: relative">
                    <asp:LinkButton Style="float: right" Text="Submit" Width="100px" CssClass="btn" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
