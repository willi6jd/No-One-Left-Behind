<%@ Page Title="Verify Phone Number" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyPhoneNumber.aspx.cs" Inherits="NooneLeftBehind.Account.VerifyPhoneNumber" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <h4>Enter verification code</h4>
        <hr />
        <asp:HiddenField runat="server" ID="PhoneNumber" />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
    </div>
    <div class="pad"></div>
    <section class="container-fluid">
        <section class="row justify-content-center">
            <section class="col-lg-4 col-sm-6">
                <img src="../Images/nolbPH.png" class="bgNOLB">
                <div class="form-container justify-content-center">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Code" CssClass="control-label">Code</asp:Label>
                        <div class="form-control">
                            <asp:TextBox runat="server" ID="Code" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Code"
                                CssClass="text-danger" ErrorMessage="The Code field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" OnClick="Code_Click"
                            Text="Submit" CssClass="btn btn-primary btn-block" />
                    </div>
                </div>
            </section>
        </section>
    </section>
</asp:Content>
