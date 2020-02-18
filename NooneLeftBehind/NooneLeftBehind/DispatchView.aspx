<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DispatchView.aspx.cs" Inherits="NooneLeftBehind.DispatchView" MasterPageFile="Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="tablePlaceHolder">
    <div style="padding-top: 10px;" class="container">
        
        <asp:Panel ID="LoggedInPanel" runat="server">
            <div class="row">
                <div class="col-7">
                    <div class="align-middle">
                        <div id="mapHolderDispatch"></div>
                    </div>
                </div>
                <div class="col">
                    <div style=" overflow:auto; height:600px;">
                        <asp:UpdatePanel ID="UpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:DataList ID="RequestDataList" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" OnItemCommand="RequestDataList_OnItemCommand">
                                    <ItemTemplate>
                                        <div class="RequestItem">
                                            <%# DataBinder.Eval(Container.DataItem, "Description") %> 
                                            <asp:Button ID="btnClearRequest" Text="Clear" runat="server" 
                                                        CommandName="ClearRequest" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RequestID") %>'
                                                        CssClass="form-control btn-primary" OnClientClick="return confirm('Are you sure you want to clear the request?')" />
                                        </div>
                                    </ItemTemplate>
                                    
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:DataList>
                                <asp:HiddenField ID="hdnCoords" runat="server" />
                            
                            
                                <asp:Timer ID="RefreshTimer" Interval="1000" runat="server" OnTick="RefreshTimer_OnTick"></asp:Timer>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:HiddenField ID="hdnMapTopRightLat" runat="server" />
                        <asp:HiddenField ID="hdnMapTopRightLong" runat="server" />
                        <asp:HiddenField ID="hdnMapBottomLeftLat" runat="server" />
                        <asp:HiddenField ID="hdnMapBottomLeftLong" runat="server" />
                
                    </div>
                </div>
            </div>
        </asp:Panel>
        <script>
            var map;
            var markers = [];
            var x = document.getElementById('<%= lblMessage.ClientID %>');

            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition, showError);
                } else {
                    x.innerHTML = "Geolocation is not supported by this browser.";
                }
            }

            function showPosition(position) {
                var current = { lat: position.coords.latitude, lng: position.coords.longitude };
                map = new google.maps.Map(
                    document.getElementById('mapHolderDispatch'), { zoom: 11, center: current });
                map.hidden = false;

                google.maps.event.addListener(map, 'idle', function () {
                    updateBounds();
                });
            }

            function updateBounds() {
                document.getElementById('<%=hdnMapTopRightLat.ClientID %>').value = map.getBounds().getNorthEast().lat();
                document.getElementById('<%=hdnMapTopRightLong.ClientID %>').value = map.getBounds().getNorthEast().lng();
                document.getElementById('<%=hdnMapBottomLeftLat.ClientID %>').value = map.getBounds().getSouthWest().lat();
                document.getElementById('<%=hdnMapBottomLeftLong.ClientID %>').value = map.getBounds().getSouthWest().lng();
                document.getElementById('<%=hdnCoords.ClientID %>').value = '';
            }

            function showError(error) {
                switch (error.code) {
                case error.PERMISSION_DENIED:
                    x.innerHTML = "User denied the request for Geolocation.";
                    break;
                case error.POSITION_UNAVAILABLE:
                    x.innerHTML = "Location information is unavailable.";
                    break;
                case error.TIMEOUT:
                    x.innerHTML = "The request to get user location timed out.";
                    break;
                case error.UNKNOWN_ERROR:
                    x.innerHTML = "An unknown error occurred.";
                    break;
                }
            }

            function setMapOnAll(map) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setMap(map);
                }
            }

            function clearMarkers() {
                setMapOnAll(null);
            }

            function deleteMarkers() {
                clearMarkers();
                markers = [];
            }

            function showLocations() {
                deleteMarkers();
                console.log("test");
                console.log(document.getElementById('<%=hdnCoords.ClientID %>').value);
                var coords = JSON.parse(document.getElementById('<%=hdnCoords.ClientID %>').value);
                console.log(coords);
                var infoWindow = new google.maps.InfoWindow();
                var labelNum = 1;

                for (var i = 0; i < coords.length; i++) {
                    var current = { lat: coords[i].Lat, lng: coords[i].Long };
                    if (current.lat == null) {
                        continue;
                    }
                    var marker = new google.maps.Marker({ position: current, map: map, label: (labelNum++).toString() });
                    markers.push(marker);
                    (function (marker, data) {
                        google.maps.event.addListener(marker, "click", function (e) {
                            infoWindow.setContent(data.description);
                            infoWindow.open(map, marker);
                        });
                    })(marker, coords[i]);
                }
                document.getElementById('<%=hdnCoords.ClientID %>').value = '';
            }
        </script>

        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCu4Kt_LuqphKL8bVqQwMOyRVff7gLAXi4&callback=getLocation">
        </script>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <asp:Panel ID="NoAccessPanel" runat="server">
        <div class="container" style="padding-top: 10px;">
            <asp:Label ID="lblNoAccess" runat="server" Text="" CssClass="text-center"></asp:Label>
        </div>
    </asp:Panel>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="footerPlaceHolder">
    <div class="container form-buttons">
        <div class="form-group">
            <div class="col-offset col" style="height: 38px;">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
            </div>
        </div> 
    </div>
</asp:Content>