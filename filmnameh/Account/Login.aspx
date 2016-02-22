<%@ Page Title="ورود کاربر" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="filmnameh.Account.Login" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2><%: Title %></h2>
                                <div class="row">
                                    <div class="col-md-8">
                                        <section id="loginForm">
                                            <div class="form-horizontal">
                                                <h4>ورود کاربر</h4>
                                                <hr />
                                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                                    <p class="text-danger">
                                                        <asp:Literal runat="server" ID="FailureText" />
                                                    </p>
                                                </asp:PlaceHolder>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">پست الکترونیک</asp:Label>
                                                    <div class="col-md-6">
                                                        <asp:TextBox runat="server" ID="Email" CssClass="form-control ltr" TextMode="Email" />
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                                            CssClass="text-danger" ErrorMessage="فیلد پست الکترونیک نمی تواند خالی باشد" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">کلمه عبور</asp:Label>
                                                    <div class="col-md-6">
                                                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control ltr" />
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="فیلد کلمه عبور نمی تواند خالی باشد" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-10">
                                                        <div class="checkbox">
                                                            <asp:CheckBox runat="server" ID="RememberMe" />
                                                            <asp:Label runat="server" AssociatedControlID="RememberMe">به‌خاطر سپاری</asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-10">
                                                        <asp:Button runat="server" OnClick="LoginClick" Text="ورود" CssClass="btn btn-default" />
                                                    </div>
                                                </div>
                                            </div>
                                            <p>
                                                <a runat="server" href="~/Account/Register">ایجاد کاربر جدید</a>
                                            </p>
                                            <p>
                                                <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                                                --%>
                                            </p>
                                        </section>
                                    </div>
                                    <div class="col-md-4">
                                        <section id="socialLoginForm">
                                            <div id="socialLoginList">
                                                <h4>راهنما</h4>
                                                <hr />
                                                <div>
                                                    <p>برای ورود به صفحه شخصی، اطلاعات خود را وارد کنید</p>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
