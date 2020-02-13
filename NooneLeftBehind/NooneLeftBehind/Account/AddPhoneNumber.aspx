<%@ Page Title="Phone Number" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPhoneNumber.aspx.cs" Inherits="NooneLeftBehind.Account.AddPhoneNumber" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <h2><%: Title %>.</h2>

    <div class="form-horizontal">
        <h4>Add a phone number</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>  
    </div>
    <div class="pad"></div>
    <section class="container-fluid">
        <section class="row justify-content-center">
            <section class="col-lg-4 col-sm-6">
                
                <div class="form-container justify-content-center">
                    <img src="../Images/nolbPH.png" class="bgNOLB" />
                    <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-2 control-label">Phone Number</asp:Label>
                    <asp:TextBox runat="server" ID="PhoneNumber" placeholder="Enter phone number" CssClass="form-control" TextMode="Phone" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                        CssClass="text-danger" ErrorMessage="The PhoneNumber field is required." />
                    <div class="form-group">
                        <asp:Button runat="server" OnClick="PhoneNumber_Click"
                            Text="Submit" CssClass="btn btn-primary btn-block" />
                    </div>
                </div>
            </section>
        </section>
    </section>
</asp:Content>
