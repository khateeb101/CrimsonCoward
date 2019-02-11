﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="BlogCatAdminEdit.aspx.cs" Inherits="CrimsonCoward.Admin.BlogCatAdminEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default">
        <div class="panel-heading">
            <asp:Literal runat="server" ID="Notifications"></asp:Literal>
        </div>
        <div class="panel-body">
            <h1 class="Title">Blog Category Edit</h1>
            <div class="row" style="margin-top:20px;">
                <div class="col-lg-6">
                    <asp:Label Text="" ID="lblID" runat="server" Visible="false"/>
                    <div class="form-group">
                        <label>Title</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtTitle" />
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <asp:FileUpload runat="server"  CssClass="form-control" ID="uplImage" />
                        <asp:Label Text="" ID="lblImage" CssClass="label-danger" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Button Text="Save"  CssClass="form-control" ID="btnSave" runat="server" onclick="btnSave_Click" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <asp:Image runat="server" Width="100%" ID="imgview" Visible="false"/>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>