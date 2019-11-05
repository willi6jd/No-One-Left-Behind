<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NooneLeftBehind.Default" MasterPageFile="~/Site.Master"%>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div>
        <h1>Request</h1>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that the field is required" CssClass="text-danger" />

        <h3>Request data</h3>
        <div class="form-group">
            <label class="col-sm-3 control-label">Date</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtDate" runat="server" TextMode="DateTime" ReadOnly="true"
                        CssClass="form-control"></asp:TextBox>
            </div>
            <!--<div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvDate" runat="server" 
                    ControlToValidate="txtDate" text="*" CssClass="text-danger" Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvDate" runat="server" Text="Must be a valid date" CssClass="text-danger"
                    Display="Dynamic" ControlToValidate="txtDate" Type="Date" Operator="DataTypeCheck">
                </asp:CompareValidator>
            </div>-->

        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Type of Emergency</label>
            <div class="col-sm-4">
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
            <label class="col-sm-3 control-label">Number of People</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtNumOfPeople" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Number of Immobile People</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtNumOfImmobile" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">            
            <label class="col-sm-3 control-label">Injuries or Other Info</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtInjuriesOrSpecialInfo" runat="server" TextMode="Multiline"
                        Rows="4" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-3 control-label">Accessible Outside Window?</label>
            <div class="col-sm-4">
                <asp:CheckBox ID="cbOutsideWindow" runat="server" CssClass="form-check"/>
            </div>
        </div>

        <h3>Location Information</h3>
        <div class="form-group">
            <label class="col-sm-3 control-label">Street Address</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Room Number</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Floor</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtFloor" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">City</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">State</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <h3>Contact Information</h3>
        <div class="form-group">
            <label class="col-sm-3 control-label">First Name</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <!--<div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                    ControlToValidate="txtFirstName" text="*" CssClass="text-danger" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>-->
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Last Name</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <!--<div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                    ControlToValidate="txtLastName" text="*" CssClass="text-danger" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>-->
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Phone number</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" 
                    CssClass="form-control"></asp:TextBox>
            </div>
            <!--<div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                    ControlToValidate="txtPhone" text="*" CssClass="text-danger" Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                    ControlToValidate="txtPhone" Text="Use this format: 999-999-9999"
                    Display="Dynamic" CssClass="text-danger" 
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
                </asp:RegularExpressionValidator>    
            </div>-->
        </div>

        <%-- Submit and Clear buttons --%>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                        CssClass="btn btn-primary"   />
                <asp:Button ID="btnClear" runat="server" Text="Clear"
                        CssClass="btn btn-primary" CausesValidation="false"  />
            </div>
        </div> 
            
        <%-- message label --%>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-11">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
