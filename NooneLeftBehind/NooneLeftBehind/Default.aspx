<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NooneLeftBehind.Default" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true"%>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="container" style="padding-top: 10px;">
        <div class="row">
            <div class="col-sm">
                <h3>Request Information</h3>
                <div class="form-group">
                    <label class="col control-label">Date</label>
                    <div class="col">
                        <asp:TextBox ID="txtDate" runat="server" TextMode="DateTime" ReadOnly="true"
                                CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col control-label">Type of Emergency</label>
                    <div class="col">
                        <asp:DropDownList ID="ddlTypeOfEmergency" runat="server" CssClass="form-control">
                            <asp:ListItem>Fire</asp:ListItem>
                            <asp:ListItem>Active Shooter</asp:ListItem>
                            <asp:ListItem>Tornado</asp:ListItem>
                            <asp:ListItem>Flood</asp:ListItem>
                            <asp:ListItem>Medical Emergency</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
        
                <div class="form-group">
                    <label class="col control-label">Number of People</label>
                    <div class="col">
                        <asp:TextBox ID="txtNumOfPeople" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Number of Immobile People</label>
                    <div class="col">
                        <asp:TextBox ID="txtNumOfImmobile" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">            
                    <label class="col control-label">Injuries or Other Info</label>
                    <div class="col">
                        <asp:TextBox ID="txtInjuriesOrSpecialInfo" runat="server" TextMode="Multiline"
                                Rows="4" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
        
                <div class="form-group">
                    <label class="col control-label">Accessible Outside Window?</label>
                    <div class="col">
                        <asp:CheckBox ID="cbOutsideWindow" runat="server" CssClass="form-check"/>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <h3>Location Information</h3>
                <div class="form-group">
                    <label class="col control-label">Street Address</label>
                    <div class="row col">
                        <div class="col">
                            <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" ControlToValidate="txtStreetAddress" CssClass="text-danger col-0" Text="*" ErrorMessage="Street Address is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Room Number</label>
                    <div class="row col">
                        <div class="col">
                            <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-0 hidden" style="visibility: hidden;">*</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Floor</label>
                    <div class="row col">
                        <div class="col">
                            <asp:TextBox ID="txtFloor" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-0 hidden" style="visibility: hidden;">*</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">City</label>
                    <div class="row col">
                        <div class="col">
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="text-danger col-0" Text="*" ErrorMessage="City is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">State</label>
                    <div class="row col">
                        <div class="col">
                            <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" CssClass="text-danger col-0" Text="*" ErrorMessage="State is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <h3>Contact Information</h3>
                <div class="form-group">
                    <label class="col control-label">First Name</label>
                    <div class="col">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Last Name</label>
                    <div class="col">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Phone number</label>
                    <div class="col">
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <asp:Button ID="btnGetLocation" runat="server" Text="Get Cooridinates"
                    CssClass="btn btn-secondary" OnClientClick="getLocation();return false;"   />
                <div id="coords" hidden="hidden">
                    <div class="form-group">
                        <label class="col control-label">Latitude</label>
                        <div class="col">
                            <asp:TextBox ID="txtLatitude" runat="server" TextMode="DateTime" 
                                    CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col control-label">Longitude</label>
                        <div class="col">
                            <asp:TextBox ID="txtLongitude" runat="server" TextMode="DateTime" 
                                    CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <script>
                    var x = document.getElementById('<%= lblMessage.ClientID %>');

                    function getLocation() {
                        if (navigator.geolocation) {
                            navigator.geolocation.getCurrentPosition(showPosition, showError);
                        } else {
                            x.innerHTML = "Geolocation is not supported by this browser.";
                        }
                    }

                    function showPosition(position) {

                        document.getElementById('<%= txtLatitude.ClientID %>').value = position.coords.latitude;
                    $('#<%= txtLatitude.ClientID%>').prop('readonly', true);
                    document.getElementById('<%= txtLongitude.ClientID %>').value = position.coords.longitude;
                    $('#<%= txtLongitude.ClientID%>').prop('readonly', true);
                        document.getElementById('coords').hidden = false;
                    }

                    function showError(error) {
                        switch (error.code) {
                            case error.PERMISSION_DENIED:
                                x.innerHTML = "User denied the request for Geolocation."
                                break;
                            case error.POSITION_UNAVAILABLE:
                                x.innerHTML = "Location information is unavailable."
                                break;
                            case error.TIMEOUT:
                                x.innerHTML = "The request to get user location timed out."
                                break;
                            case error.UNKNOWN_ERROR:
                                x.innerHTML = "An unknown error occurred."
                                break;
                        }
                    }
                </script>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="footerPlaceHolder">
    <div class="container">
    <%-- Submit and Clear buttons --%>
        <div class="form-group">
            <div class="col-offset col">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                        CssClass="btn btn-primary" OnClick="Submit_Click"   />
                <asp:Button ID="btnClear" runat="server" Text="Clear"
                        CssClass="btn btn-primary" CausesValidation="false" OnClick="Clear_Click"  />
                <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
            </div>
        </div> 
    </div>
</asp:Content>