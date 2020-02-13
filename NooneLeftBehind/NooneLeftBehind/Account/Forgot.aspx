<%@ Page Title="Forgot password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="NooneLeftBehind.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <asp:PlaceHolder id="loginForm" runat="server">
                <div class="form-horizontal">
                    <h4>Forgot your password?</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                </div>
            </asp:PlaceHolder>           
        </div>
    </div>
    <section class="container-fluid">
        <section class="row justify-content-center">
            <section class="col-lg-4 col-sm-6">
                <div class="pad"></div>
                <img src="../Images/nolbPH.png" class ="bgNOLB"/>
                <div class="form-container justify-content-center">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="control-label">Email</asp:Label>
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" placeholder="Enter email" TextMode="Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="The email field is required." />
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" OnClick="Forgot" Text="Email Link" CssClass="btn btn-primary btn-block" />
                    </div>
                </div>
            </section>
        </section>
    </section>
    <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
        <p class="text-info">
            Please check your email to reset your password.               
        </p>
    </asp:PlaceHolder>
</asp:Content>
