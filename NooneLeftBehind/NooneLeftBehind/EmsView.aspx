<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmsView.aspx.cs" Inherits="NooneLeftBehind.EmsView" MasterPageFile="Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="container" style="padding-top: 10px;">
        <asp:GridView ID="grdRequests" runat="server" CssClass="table table-condensed table-striped table-bordered" 
            AutoGenerateColumns="False" AllowPaging="True"
            ItemType="NooneLeftBehind.Models.Request"
            SelectMethod="grdRequests_GetData">
            <Columns>            
                <asp:DynamicField DataField="TimeStamp" />
                <asp:TemplateField HeaderText="Street Address">
                  <ItemTemplate>
                    <asp:Label Text="<%# Item.Location.StreetAddress %>" 
                        runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Room">
                  <ItemTemplate>
                    <asp:Label Text="<%# Item.Location.RoomNumber %>" 
                        runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Floor" >
                  <ItemTemplate>
                    <asp:Label Text="<%# Item.Location.Floor %>" 
                        runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                  <ItemTemplate>
                    <asp:Label Text="<%# Item.Location.City %>" 
                        runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">
                  <ItemTemplate>
                    <asp:Label Text="<%# Item.Location.State %>" 
                        runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:DynamicField DataField="TypeOfEmergency" HeaderText="Emergency Type" />
                <asp:DynamicField DataField="NumberOfPeople" HeaderText="# of People" />
                <asp:DynamicField DataField="NumberOfImmobilePeople" HeaderText="# of Immobile" />
                <asp:DynamicField DataField="InjuriesOrOtherInfo" HeaderText="Injuries/Info" />
                <asp:DynamicField DataField="AccessibleOutsideWindow" HeaderText="Outside Window" />
                <asp:DynamicField DataField="FirstName" HeaderText="First Name" />
                <asp:DynamicField DataField="LastName" HeaderText="Last Name" />
                <asp:HyperLinkField DataTextField="PhoneNumber" HeaderText="Phone" DataTextFormatString="&lt;a href=tel:{0}&gt;{0}&lt;/a&gt;" />
                
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>
