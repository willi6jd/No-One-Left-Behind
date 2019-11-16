<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmsView.aspx.cs" Inherits="NooneLeftBehind.EmsView" MasterPageFile="Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="container" style="padding-top: 10px;">
        <asp:GridView ID="grdRequests" runat="server" CssClass="table table-condensed table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="LocationID,RequestID" DataSourceID="sqlRequests" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="LocationID" HeaderText="LocationID" InsertVisible="False" ReadOnly="True" SortExpression="LocationID" Visible="False" />
                <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
                <asp:BoundField DataField="RoomNumber" HeaderText="Room" SortExpression="RoomNumber" />
                <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="RequestID" HeaderText="RequestID" InsertVisible="False" ReadOnly="True" SortExpression="RequestID" Visible="False"/>
                <asp:BoundField DataField="TimeStamp" HeaderText="TimeStamp" SortExpression="TimeStamp" />
                <asp:BoundField DataField="TypeOfEmergency" HeaderText="Emergency" SortExpression="TypeOfEmergency" />
                <asp:BoundField DataField="NumberOfPeople" HeaderText="# of People" SortExpression="NumberOfPeople" />
                <asp:BoundField DataField="NumberOfImmobilePeople" HeaderText="# of Immobil" SortExpression="NumberOfImmobilePeople" />
                <asp:BoundField DataField="InjuriesOrOtherInfo" HeaderText="Injuries/Info" SortExpression="InjuriesOrOtherInfo" />
                <asp:CheckBoxField DataField="AccessibleOutsideWindow" HeaderText="Outside Window" SortExpression="AccessibleOutsideWindow" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:HyperLinkField DataTextField="PhoneNumber" HeaderText="Phone" DataTextFormatString="&lt;a href=tel:{0}&gt;{0}&lt;/a&gt;" />
                
                <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude" Visible="False" />
                <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" Visible="False"/>
                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlRequests" runat="server" ConnectionString="<%$ ConnectionStrings:AzureNOLBContext %>" SelectCommand="SELECT Locations.LocationID, Locations.StreetAddress, Locations.RoomNumber, Locations.Floor, Locations.City, Locations.State, Requests.RequestID, Requests.TimeStamp, Requests.TypeOfEmergency, Requests.NumberOfPeople, Requests.NumberOfImmobilePeople, Requests.InjuriesOrOtherInfo, Requests.AccessibleOutsideWindow, Requests.LocationID AS Expr1, Requests.FirstName, Requests.LastName, Requests.PhoneNumber, Requests.Longitude, Requests.Latitude FROM Requests INNER JOIN Locations ON Requests.LocationID = Locations.LocationID ORDER BY Requests.TimeStamp DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
