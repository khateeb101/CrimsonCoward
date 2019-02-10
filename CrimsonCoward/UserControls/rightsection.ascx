<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="rightsection.ascx.cs"
    Inherits="CrimsonCoward.UserControls.rightsection" %>
<div style="line-height: 13px; margin-top:50px" id="winner">
    <span>WINNER</span><br />
    <div style="margin-top:5px;">
    REAL ESTATE AGENCY<br />
    LEBANON 2012-2013<br />
    INTERNATIONAL PROPERTY <br />
    AWARDS ARABIA<br />
    </div>
</div>
<asp:HyperLink NavigateUrl="~/home.aspx" runat="server">
    <asp:Image ImageUrl="~/images/search_property.png" AlternateText="Search Property" ID="btnSearch" runat="server"
        Style="margin-top: 60px;" onmouseover="this.src='/images/search_property_on.png';"
        onmouseout="this.src='/images/search_property.png';" /></asp:HyperLink>
<asp:HyperLink NavigateUrl="~/post-property.aspx" runat="server">
    <asp:Image ImageUrl="~/images/post_property.png" AlternateText="Post Property" ID="btnPostProperty" ClientIDMode="Static"
        runat="server" Style="margin-top: 60px;" onmouseover="this.src='/images/post_property_on.png';"
        onmouseout="this.src='/images/post_property.png';" /></asp:HyperLink>
<asp:HyperLink NavigateUrl="~/post-request.aspx" runat="server">
    <asp:Image ImageUrl="~/images/post_request.png" AlternateText="Post Request" runat="server" Style="margin-top: 10px;"
        onmouseover="this.src='/images/post_request_on.png';" onmouseout="this.src='/images/post_request.png';"
        ID="btnPostRequest" ClientIDMode="Static"/></asp:HyperLink>