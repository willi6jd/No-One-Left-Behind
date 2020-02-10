<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NooneLeftBehind.Default" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true"%>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="container" style="padding-top: 10px;">
        <div class="row">
            <div class="col-sm">
                <h3>Request Information</h3>
                <div class="form-group no-display">
                    <label class="col control-label">Date</label>
                    <div class="col">
                        <asp:HiddenField ID="hdnDateTime" ClientIDMode="Static" runat="server" 
                                Value="" />
                        <asp:HiddenField ID="hdnTimeOffset" ClientIDMode="Static" runat="server" 
                                Value="" />
                    </div>

                </div>
                <div class="form-group">
                    <label class="col control-label">Type of Emergency</label>
                    <div class="col">
                        <asp:ImageButton ID="ibtnFire" runat="server" AlternateText="Fire" CssClass="type-of-emergency" ImageUrl="images/fire.png" Width="42" Height="65" onClientClick="OnTypeOfEmergencyClick(this);return false;"/>
                        <asp:ImageButton ID="ibtnGun" runat="server" AlternateText="Active Shooter" CssClass="type-of-emergency" ImageUrl="images/gun.png" Width="42" Height="65" onClientClick="OnTypeOfEmergencyClick(this);return false;"/>
                        <asp:ImageButton ID="ibtnTornado" runat="server" AlternateText="Tornado" CssClass="type-of-emergency" ImageUrl="images/tornado.png" Width="42" Height="65" onClientClick="OnTypeOfEmergencyClick(this);return false;"/>
                        <asp:ImageButton ID="ibtnFlood" runat="server" AlternateText="Flood" CssClass="type-of-emergency" ImageUrl="images/flood.png" Width="42" Height="65" onClientClick="OnTypeOfEmergencyClick(this);return false;"/>
                        <asp:ImageButton ID="ibtnAmbulance" runat="server" AlternateText="Medical Emergency" CssClass="type-of-emergency" ImageUrl="images/ambulance.png" Width="42" Height="65" onClientClick="OnTypeOfEmergencyClick(this);return false;"/>
                        <asp:ImageButton ID="ibtnQuestion" runat="server" AlternateText="Unknown" CssClass="type-of-emergency selected" ImageUrl="images/question-mark.png" Width="42" Height="65" onClientClick="OnTypeOfEmergencyClick(this);return false;"/>
                        <asp:HiddenField ID="hdnTypeOfEmergency" runat="server" Value="Unknown"/>
                    </div>
                </div>
        
                <div class="form-group">
                    <div class="col">                        
                        <label class="control-label">Number of People</label>
                        <asp:HiddenField ID="hdnNumOfPeople" ClientIDMode="Static" runat="server" 
                                Value="" />
                    </div>
                    <div class="col-xl-11">
                        <input id="slider-num-of-people" data-slider-id='slider-num-of-people-slider' 
                            type="text" data-slider-min="0" data-slider-max="50" data-slider-step="1" data-slider-value="0" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col">                        
                        <label class="control-label">Number of Immobile People</label>
                        <asp:HiddenField ID="hdnNumOfImmobilePeople" ClientIDMode="Static" runat="server" 
                                Value="" />
                    </div>
                    <div class="col-xl-11">
                        <input id="slider-num-of-immobile-people" data-slider-id='slider-num-of-immobile-people-slider' 
                            type="text" data-slider-min="0" data-slider-max="50" data-slider-step="1" data-slider-value="0"/>
                    </div>
                </div>

                <div class="form-group">            
                    <label class="col control-label">Injuries or Other Info</label>
                    <div class="col">
                        <asp:TextBox ID="txtInjuriesOrSpecialInfo" runat="server" TextMode="Multiline"
                                Rows="4" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
        
                <div class="form-group no-display">
                    <label class="col control-label">Accessible Outside Window?</label>
                    <div class="col">
                        <asp:CheckBox ID="cbOutsideWindow" runat="server" CssClass="form-check"/>
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
            </div>
            <div class="col-sm">
                <h3>Location Information</h3>
                <div class="form-group">
                    <label class="col control-label">Street Address</label>
                    <div class="col">
                        <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" ControlToValidate="txtStreetAddress" CssClass=" no-display text-danger col-0" Text="*" ErrorMessage="Street Address is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Room Number</label>
                    <div class="col">
                        <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="col-0 hidden no-display " style="visibility: hidden;">*</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Floor</label>
                    <div class="col">
                        <asp:TextBox ID="txtFloor" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="col-0 hidden no-display " style="visibility: hidden;">*</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">City</label>
                    <div class="col">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="no-display text-danger col-0" Text="*" ErrorMessage="City is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">State</label>
                    <div class="col">
                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" CssClass="no-display text-danger col-0" Text="*" ErrorMessage="State is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col">
                        <asp:Button ID="btnGetLocation" runat="server" Text="Reset Location"
                            CssClass="btn btn-secondary form-control " OnClientClick="getLocation();return false;"   />
                    </div>
                </div>
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
            </div>
        </div>
        <div class="align-middle">
            <div class="center">
                <label class="control-label center-text">Drag Red Marker to Update Location</label>
            </div>
            <div id="mapholder"></div>
        </div>
        <script>
            function OnTypeOfEmergencyClick(imageButton) {
                var x = document.getElementsByClassName("type-of-emergency");
                for (var i = 0; i < x.length; i++) {
                    $('#' + x[i].id).removeClass('selected');
                }

                $('#' + imageButton.id).addClass('selected');
                var x = document.getElementById('<%= hdnTypeOfEmergency.ClientID %>');
                x.value = imageButton.alt;
                console.log(x.value);
            }
        </script>
        <script>
            function UpgradeASPNETValidation() {
                if (typeof (Page_ClientValidate) != "undefined") {
                    AspValidatorUpdateDisplay = ValidatorUpdateDisplay;
                    ValidatorUpdateDisplay = NicerValidatorUpdateDisplay;
                }
            }

            function NicerValidatorUpdateDisplay(val) {
                AspValidatorUpdateDisplay(val);

                // Add our custom display of validation errors
                if (val.isvalid) {
                    $('#' + val.controltovalidate).closest('.form-control').removeClass('error');
                } else {
                    $('#' + val.controltovalidate).closest('.form-control').addClass('error');
                }
            }

            $(document).ready(UpgradeASPNETValidation);
        </script>
        <script>
            $('#slider-num-of-people').ionRangeSlider({
                skin: "big",
                min: 0,
                max: 50,
                max_postfix: "+",
                onChange: function (data) {
                    document.getElementById('<%= hdnNumOfPeople.ClientID %>').value = data.from;
                }
            });
            $('#slider-num-of-immobile-people').ionRangeSlider({
                skin: "big",
                min: 0,
                max: 50,
                max_postfix: "+",
                onChange: function (data) {
                    document.getElementById('<%= hdnNumOfImmobilePeople.ClientID %>').value = data.from;
                }
            });
        </script>
        <script>
            var hdnOffset = document.getElementById('<%= hdnTimeOffset.ClientID %>');
            var x = document.getElementById('<%= hdnDateTime.ClientID %>');

            var offset = (new Date().getTimezoneOffset() / 60) * (-1);
            hdnOffset.value = offset;
            var am = x.value.search("AM");
            var pm = x.value.search("PM");
            if (am != -1)
                x.value = x.value.substring(0, am + 3) + offset;
            else if (pm != -1)
                x.value = x.value.substring(0, pm + 3) + offset;
        </script>
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
                var current = { lat: position.coords.latitude, lng: position.coords.longitude };
                var map = new google.maps.Map(
                    document.getElementById('mapholder'), { zoom: 12, center: current });
                var marker = new google.maps.Marker({ position: current, map: map, draggable: true });
                map.hidden = false;

                function hasUrlVars() {
                    var url = window.location.href;
                    if (url.indexOf('?') != -1)
                        return true;
                    return false
                }

                if (!hasUrlVars()) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            var json = JSON.parse(this.responseText)

                            var addressComponents = json.results[0].address_components;
                            var length = addressComponents.length;

                            function getAttribute(components, componentName, numComponents) {
                                for (var i = 0; i < numComponents; i++) {
                                    if (components[i].types[0] == componentName) {
                                        return components[i].long_name;
                                    }
                                }
                                return '';
                            }

                            document.getElementById('<%= txtStreetAddress.ClientID %>').value = getAttribute(addressComponents, 'street_number', length) + ' ' + getAttribute(addressComponents, 'route', length);
                            document.getElementById('<%= txtFloor.ClientID %>').value = '';
                            document.getElementById('<%= txtRoom.ClientID %>').value = '';
                            document.getElementById('<%= txtCity.ClientID %>').value = getAttribute(addressComponents, 'locality', length);
                            document.getElementById('<%= txtState.ClientID %>').value = getAttribute(addressComponents, 'administrative_area_level_1', length);
                            Page_ClientValidate();
                        }
                    };
                    xhttp.open("GET", "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + current.lat + "," + current.lng + "&key=AIzaSyDJMGSnCwy_bUIRknvh2mUxhynP30nC468", true);
                    xhttp.send();
                }

                google.maps.event.addListener(marker, 'dragend', function (evt) {
                    document.getElementById('<%= txtLatitude.ClientID %>').value = evt.latLng.lat().toFixed(8);
                    document.getElementById('<%= txtLongitude.ClientID %>').value = evt.latLng.lng().toFixed(8);
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            var json = JSON.parse(this.responseText)

                            if (confirm("Update location from map?")) {
                                var addressComponents = json.results[0].address_components;
                                var length = addressComponents.length;

                                function getAttribute(components, componentName, numComponents) {
                                    for (var i = 0; i < numComponents; i++) {
                                        if (components[i].types[0] == componentName) {
                                            return components[i].long_name;
                                        }
                                    }
                                    return '';
                                }

                                document.getElementById('<%= txtStreetAddress.ClientID %>').value = getAttribute(addressComponents, 'street_number', length) + ' ' + getAttribute(addressComponents, 'route', length);
                                document.getElementById('<%= txtFloor.ClientID %>').value = '';
                                document.getElementById('<%= txtRoom.ClientID %>').value = '';
                                document.getElementById('<%= txtCity.ClientID %>').value = getAttribute(addressComponents, 'locality', length);
                                document.getElementById('<%= txtState.ClientID %>').value = getAttribute(addressComponents, 'administrative_area_level_1', length);
                                Page_ClientValidate();
                            }
                        }
                    };
                    xhttp.open("GET", "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + evt.latLng.lat() + "," + evt.latLng.lng() + "&key=AIzaSyDJMGSnCwy_bUIRknvh2mUxhynP30nC468", true);
                    xhttp.send();
                });
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

        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCu4Kt_LuqphKL8bVqQwMOyRVff7gLAXi4&callback=getLocation">
        </script>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="footerPlaceHolder">
    <div class="container form-buttons">
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