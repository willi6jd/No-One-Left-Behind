<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QrCodeGenerator.aspx.cs" Inherits="NooneLeftBehind.QrCodeGenerator" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">  
    <div class="container" style="padding-top: 10px;">
        <h1>QR Code Generator</h1>
        <div class="row">
            <div class="col-md ">
                <h3>Location Information</h3>
                <div class="form-group">
                    <label class="col control-label">Street Address</label>
                    <div class="row col">
                        <div class="col-lg-8 col-sm-10 col">
                            <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" ControlToValidate="txtStreetAddress" CssClass="no-display text-danger col-0" Text="*" ErrorMessage="Street Address is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Room Number</label>
                    <div class="row col">
                        <div class="col-lg-8 col-sm-10 col">
                            <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-0 hidden no-display " style="visibility: hidden;">*</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">Floor</label>
                    <div class="row col">
                        <div class="col-lg-8 col-sm-10 col">
                            <asp:TextBox ID="txtFloor" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-0 hidden no-display " style="visibility: hidden;">*</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">City</label>
                    <div class="row col">
                        <div class="col-lg-8 col-sm-10 col">
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="no-display text-danger col-0" Text="*" ErrorMessage="City is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col control-label">State</label>
                    <div class="row col">
                        <div class="col-lg-8 col-sm-10 col">
                            <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" CssClass="no-display text-danger col-0" Text="*" ErrorMessage="State is Required."></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-md">             
                <div class="align-middle">
                    <div id="nolbBorder">
                        <h2 class ="nolbStyle">No One Left Behind</h2>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    </div>
                        <div class="qrLabel">
                        <asp:Label ID="labelQrAddress" runat="server" CssClass="control-label" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>        
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
    </div>
</asp:Content>
      

<asp:Content runat="server" ContentPlaceHolderID="footerPlaceHolder">
    <div class="container form-buttons">
    <%-- Submit and Clear buttons --%>
        <div class="form-group">
            <div class="col-offset col">
                <asp:Button ID="btnSubmitQR" runat="server" Text="Submit"
                        CssClass="btn btn-primary" OnClick="btnSubmit_ClickQR"   />
                <asp:Button ID="btnClear" runat="server" Text="Clear"
                        CssClass="btn btn-primary" CausesValidation="false" OnClick="btnClear_Click"  />
                <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
            </div>
        </div> 
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="printPlaceHolder">
<div class="print">   
       <div class ="nolbPrintBorder">
           <h1 class ="nolbStylePrint">No One Left Behind</h1>
        <div class="align-middle center">
            <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
            <div class="qrLabel">
                <asp:Label ID="labelQrAddressPrint" runat="server" CssClass="control-label" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
         
