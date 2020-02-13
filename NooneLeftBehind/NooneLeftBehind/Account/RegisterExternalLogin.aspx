<%@ Page Title="Register an external login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="NooneLeftBehind.Account.RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder">
    <h3>Register with your <%: ProviderName %> account</h3>

    <asp:PlaceHolder runat="server">
        <div class="form-horizontal">
            <h4>Association Form</h4>
            <hr />
            <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
            <p class="text-info">
                You've authenticated with <strong><%: ProviderName %></strong>. Please enter an email below for the current site
                and click the Log in button.
            </p>
    </asp:PlaceHolder>

    <div class="pad"></div>
    <section class="container-fluid">
        <section class="row justify-content-center">
            <section class="col-lg-4 col-sm-6">
                <img src="../Images/nolbPH.png" class="bgNOLB">
                <div class="form-container justify-content-center">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="email" CssClass="control-label">Email</asp:Label>
                        <asp:TextBox runat="server" ID="email" placeholder="Enter email" CssClass="form-control" TextMode="Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                            Display="Dynamic" CssClass="text-danger" ErrorMessage="Email is required" />
                        <asp:ModelErrorMessage runat="server" ModelStateKey="email" CssClass="text-error" />
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" Text="Log in" CssClass="btn btn-primary btn-block" OnClick="LogIn_Click" />
                    </div>
                </div>
            </section>
        </section>
    </section>
</asp:Content>
