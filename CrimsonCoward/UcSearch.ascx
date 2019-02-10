<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcSearch.ascx.cs" Inherits="CrimsonCoward.UcSearch" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<style>
    @media (min-width: 100px) and (max-width: 1200px) {
        #MainRow {
            position: unset;
            bottom: unset;
        }
    }

    .form-control {
        border-radius: 5px;
        color: black;
        font-weight: bold;
    }
    @media (min-width: 1200px) {
        #MainRow {
            position: absolute;
            bottom: 30px;
            z-index: 9999 !important;
        }
       
    }
</style>
   <asp:UpdatePanel runat="server">
            <ContentTemplate>
<section>
    <div class="container">
        <div class="row" id="MainRow">
            <div class="col-lg-12">
                                           
                                 

                    <div class="panel" style="background: rgba(16, 15, 15, 0.7);">
                        <div class="panel-body">
                            <div class="form-inline text-center">
                                <div class="form-group">
                                    <asp:DropDownList Width="200px"  EnableViewState="true" AutoPostBack="true" OnSelectedIndexChanged="ddlFor_SelectedIndexChanged" runat="server" CssClass="form-control" ID="ddlFor">
                                        <asp:ListItem Text="Buy/Rent" Value="" />
                                        <asp:ListItem Text="BUY" style="color:black" Value="Sale" />
                                        <asp:ListItem Text="RENT" style="color:black"  Value="Rent" />
                                    </asp:DropDownList>
                                </div>

                              
                                <div class="form-group">
                                    <asp:DropDownList Width="200px" runat="server" CssClass="form-control" ID="ddlType">
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group">
                                     <asp:DropDownList runat="server"  Width="200px"  id="drpMinArea" CssClass="form-control">
                                    </asp:DropDownList>        
                                </div>
                                   <div class="form-group">
                                       <asp:DropDownList runat="server"  Width="200px"  id="drpMaxArea" CssClass="form-control">
                                    </asp:DropDownList>        
                                </div>
                                  <div class="form-group" id="btnSearchDesc">
                                    <asp:Button Text="SEARCH" Width="200px" runat="server" Height="34px" Style="margin-top:10px; border-radius: 0px;z-index:99999" ID="btnSearch" CssClass="btn btn-success btn-lg btn-block" OnClick="btnSearch_Click" />
                                </div>
                                <div class="form-group">

                                   <asp:DropDownList runat="server"  Width="200px"  id="drpMinPrice" CssClass="form-control">
                                    </asp:DropDownList>        
                                </div>
                             
                                <div class="form-group">
                                       <asp:DropDownList runat="server"  Width="200px"  id="drpMaxPrice"  CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                                                 
                                <div class="form-group">
                                    <div id="the-basics">
                                     <input class="typeahead form-control" runat="server" id="ddlRegion" style="width:405px" type="text"  placeholder="Area or City">
                                        </div>

                                      <%--<asp:TextBox  Height="60px" CssClass="form-control" runat="server"
                                        ID="txtRegion" />--%>

                                      <%-- <ajaxToolkit:AutoCompleteExtender ID="txtRegion_AutoCompleteExtender" runat="server" BehaviorID="txtRegion_AutoCompleteExtender" DelimiterCharacters="" ServicePath="" TargetControlID="txtRegion">
                                      </ajaxToolkit:AutoCompleteExtender>--%>

                                    <%--   <asp:LinkButton Text="Reload" Visible="false"  CausesValidation="false" runat="server"
                                        ID="lnkReloadDataForThisRegion" OnClick="lnkReloadDataForThisRegion_Click" />--%>

                                            

                                      <%--<select visible="false" ID="ddlRegion" runat="server" multiple="true" Style="width: 405px;" class="testselect2 SumoUnder" data-placeholder="Select Region"  tabindex="1"></select>--%>
<%--                                    <asp:TextBox ID="txtRegion" Width="405px" runat="server" Text="Region:" CssClass="form-control" onfocus="if(this.value=='Region:'){this.value=''}"
                                        onblur="if(this.value==''){this.value='Region:'}" />--%>
                                </div>
                              
                                 <div class="form-group">
                                    <asp:TextBox ID="txtRef" style="color:#acacac" Width="200px" runat="server" Text="Keyword" CssClass="form-control" onfocus="if(this.value=='Keyword'){this.value=''};this.style.color='black';"
                                        onblur="if(this.value==''){this.value='Keyword';this.style.color='#acacac';};" />
                                </div>
                                  <div class="form-group" id="btnSearchMob">
                                                                          <asp:Button Text="SEARCH" Width="200px" runat="server" Height="34px" Style="margin-top:10px; border-radius: 0px;z-index:99999" ID="Button1" CssClass="btn btn-success btn-lg btn-block" OnClick="btnSearch_Click" />
                                      <%--<asp:Button runat="server" Text="SEARCH"  Width="200px" Height="34px" Style="margin-top:10px; border-radius: 0px;z-index:99999" ID="Button1" OnClientClick="__doPostBack('<%=btnSearch.UniqueID%>','OnClick')" Class="btn btn-success btn-lg btn-block" />--%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
             
        </div>
    </div>
</section>
                </ContentTemplate>
       </asp:UpdatePanel>
<script>
    var substringMatcher = function (strs) {
        return function findMatches(q, cb) {
            var matches, substringRegex;

            // an array that will be populated with substring matches
            matches = [];

            // regex used to determine if a string contains the substring `q`
            substrRegex = new RegExp(q, 'i');

            // iterate through the pool of strings and for any string that
            // contains the substring `q`, add it to the `matches` array
            $.each(strs, function (i, str) {
                if (substrRegex.test(str)) {
                    matches.push(str);
                }
            });

            cb(matches);
        };
    };

    var states = [<%=Regions%>];

    $('#the-basics .typeahead').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
    },
    {
        name: 'states',
        source: substringMatcher(states)
    });
</script>


<%--<ajaxToolkit:AutoCompleteExtender runat="server" id="AutoCompleteExtender3" targetcontrolid="txtRegion"
    servicemethod="GetRegions" servicepath="~/Templates/AutoComplete.asmx"
    minimumprefixlength="2" completioninterval="300" enablecaching="true" completionsetcount="500"
    onclienthiding="OnClientCompleted" onclientitemselected="OnClientItemSelectedRegion"
    onclientpopulated="OnClientCompleted" onclientpopulating="OnClientPopulating">
    </ajaxToolkit:AutoCompleteExtender>--%>

  