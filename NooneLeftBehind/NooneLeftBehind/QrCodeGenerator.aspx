<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QrCodeGenerator.aspx.cs" Inherits="NooneLeftBehind.QrCodeGenerator" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div>
         <h1>QR Code Generator</h1>
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

      
        </div>

      

        <%-- Submit and Clear buttons --%>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <asp:Button ID="btnSubmitQR" runat="server" Text="Submit"
                        CssClass="btn btn-primary" OnClick="btnSubmit_ClickQR"   />
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
         <div class="form-group">
             
             <div class="align-middle">
                 
                 <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                     
             </div>
    </div>
</asp:Content>
