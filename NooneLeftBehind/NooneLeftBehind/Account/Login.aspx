<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NooneLeftBehind.Account.Login" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder">
    <br/>
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                </div>
            </section>
        </div>
    </div>

    <div class="pad"></div>
    <section class="container-fluid">
        <section class="row justify-content-center">
            <section class="col-lg-4 col-sm-6">
                <img src="../Images/nolbPH.png" class="bgNOLB">
                <div class="form-container justify-content-center">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="control-label">Email</asp:Label>
                        <asp:TextBox runat="server" ID="Email" placeholder="Email" CssClass="form-control" TextMode="Email" />
                    </div>
                    <div class="form-group">
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="The email field is required." />
                    </div>
    
                        
                    
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">Password</asp:Label>
                        <asp:TextBox runat="server" ID="Password" placeholder="Password" TextMode="Password" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                    <div class="checkbox">
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me</asp:Label>
                        </div>
                    <div class="form-group">
                        <div class="row justify-content-between">
                            <div class="col-4">
                                <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
                            </div>
                            <div class="col-4">
                                <asp:Button runat="server" OnClick="LogIn" Text="Login" CssClass="btn btn-primary btn-block" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    </div>
                </div>
            </section>
        </section>
    </section>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="ResendConfirm" OnClick="SendEmailConfirmationToken" Text="Resend confirmation" Visible="false" CssClass="btn btn-default" />
</asp:Content>
