<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="NooneLeftBehind.Account.ResetPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Enter your new password</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

         <div class="pad"></div>
    <section class="container-fluid">
        <section class="row justify-content-center">
            <section class="col-lg-4 col-sm-6">
                <img src="../Images/nolbPH.png" class="bgNOLB">
                <div class="form-container justify-content-center">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="control-label">Email</asp:Label>
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="The email field is required." />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label">Confirm password</asp:Label>
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">Password</asp:Label>

                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                            CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" OnClick="Reset_Click" Text="Reset" CssClass="btn btn-primary btn-block" />
                    </div>
                </div>
            </section>
        </section>
    </section>
    </div>
</asp:Content>
