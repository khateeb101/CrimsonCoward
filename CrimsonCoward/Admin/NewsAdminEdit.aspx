<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="NewsAdminEdit.aspx.cs" Inherits="CrimsonCoward.Admin.NewsAdminEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default">
        <div class="panel-heading">
            <asp:Literal runat="server" ID="Notifications"></asp:Literal>
        </div>
        <div class="panel-body">
            <h1 class="Title">News Edit</h1>
            <div class="row" style="margin-top:20px;">
                <div class="col-lg-6">
                    <asp:Label Text="" ID="lblID" runat="server" Visible="false"/>
                    <div class="form-group">
                        <label>Title</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtTitle" />
                    </div>
                    <div class="form-group">
                        <label>Subtitle</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtSubtitle" />
                    </div>
                    <div class="form-group">
                        <label>International</label>
                        <asp:CheckBox Text="" ID="chkInternational" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Link</label>
                         <asp:TextBox runat="server" CssClass="form-control" ID="txtLink" />
                    </div>
                    <div class="form-group">
                        <label>Date</label>
                        <asp:Calendar runat="server" ID="cldDate" class='input-group date'></asp:Calendar>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <asp:FileUpload runat="server"  CssClass="form-control" ID="uplImage" />
                        <asp:Label Text="" ID="lblImage" CssClass="label-danger" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Text</label>
                        <asp:TextBox runat="server"  CssClass="form-control" ID="Editor1" TextMode="MultiLine" />
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
