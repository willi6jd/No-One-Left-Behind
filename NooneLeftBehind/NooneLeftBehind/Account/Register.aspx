<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NooneLeftBehind.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="mainPlaceHolder">
    <h2><%: Title %>.</h2>
<p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <div class="pad"></div>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
        <section class="container-fluid">
            <section class="row justify-content-center">
                <section class="col-lg-4 col-sm-6">
                    <img src="../Images/nolbPH.png" / class="bgNOLB">
                    <div class="form-container justify-content-center">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="control-label text-center">Email</asp:Label>
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" placeholder="Enter email" TextMode="Email" />
                        </div>
                        <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label text-center">Password</asp:Label>
                        <asp:TextBox runat="server" ID="Password" placeholder="Password" TextMode="Password" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label text-center">Confirm password</asp:Label>
                        <asp:TextBox runat="server" ID="ConfirmPassword" placeholder="Confirm password" TextMode="Password" CssClass="form-control" />
                        </div>
                        <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary btn-block" />
                    </div>
                </section>
            </section>
        </section>

    </div>

</asp:Content>
