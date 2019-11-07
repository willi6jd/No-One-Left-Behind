<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NooneLeftBehind.Default" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true"%>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="container" style="padding-top: 10px;">
        <div class="row">
            <div class="col-sm">
                <h3>Request data</h3>
                <div class="form-group">
                    <label class="col-sm control-label">Date</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtDate" runat="server" TextMode="DateTime" ReadOnly="true"
                                CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-sm control-label">Type of Emergency</label>
                    <div class="col-sm">
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
                    <label class="col-sm control-label">Number of People</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtNumOfPeople" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm control-label">Number of Immobile People</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtNumOfImmobile" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">            
                    <label class="col-sm control-label">Injuries or Other Info</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtInjuriesOrSpecialInfo" runat="server" TextMode="Multiline"
                                Rows="4" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
        
                <div class="form-group">
                    <label class="col-sm control-label">Accessible Outside Window?</label>
                    <div class="col-sm">
                        <asp:CheckBox ID="cbOutsideWindow" runat="server" CssClass="form-check"/>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <h3>Location Information</h3>
                <div class="form-group">
                    <label class="col-sm control-label">Street Address</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm control-label">Room Number</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm control-label">Floor</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtFloor" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm control-label">City</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm control-label">State</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <h3>Contact Information</h3>
                <div class="form-group">
                    <label class="col-sm control-label">First Name</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm control-label">Last Name</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm control-label">Phone number</label>
                    <div class="col-sm">
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="footerPlaceHolder">
    <%-- Submit and Clear buttons --%>
    <div class="form-group">
        <div class="col-sm-offset col-sm">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                    CssClass="btn btn-primary" OnClick="Submit_Click"   />
            <asp:Button ID="btnClear" runat="server" Text="Clear"
                    CssClass="btn btn-primary" CausesValidation="false" OnClick="Clear_Click"  />
        </div>
    </div> 
            
    <%-- message label --%>
    <div class="form-group">
        <div class="col-sm-offset col-sm">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="mapPlaceHolder">

    <asp:Button ID="btnGetLocation" runat="server" Text="Get Location"
                    CssClass="btn btn-secondary" OnClientClick="getLocation();return false;"   />
    <div class="form-group">
        <label class="col-sm control-label">Latitude</label>
        <div class="col-sm">
            <asp:TextBox ID="txtLatitude" runat="server" TextMode="DateTime" ReadOnly="true"
                    CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm control-label">Longitude</label>
        <div class="col-sm">
            <asp:TextBox ID="txtLongitude" runat="server" TextMode="DateTime" ReadOnly="true"
                    CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <script>
    var x = document.getElementById("demo");

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        } else {
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }

    function showPosition(position) {

        document.getElementById("mapPlaceHolder_txtLatitude").value = position.coords.latitude;

        document.getElementById("mapPlaceHolder_txtLongitude").value = position.coords.longitude;
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
</asp:Content>
