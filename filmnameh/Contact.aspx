<%@ Page Title="تماس" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="filmnameh.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2><%: Title %></h2>
                                <h3>مرکز گسترش فیلم‌نامه</h3>
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="ErrorMessage" />
                                </p>
                                <div class="form-horizontal">
                                    <div class="page-header">
                                        <h4>تماس با ما</h4>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ContactName" CssClass="col-md-2 control-label">نام</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ContactName" CssClass="form-control"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ContactName" CssClass="text-danger" ErrorMessage="پرکردن عنوان اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ContactEmail" CssClass="col-md-2 control-label">ایمیل</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ContactEmail" CssClass="form-control" TextMode="Email"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ContactSubject" CssClass="col-md-2 control-label">عنوان</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ContactSubject" CssClass="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ContactText" CssClass="col-md-2 control-label">متن پیام</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ContactText" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ContactText" CssClass="text-danger" ErrorMessage="پرکردن متن اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="center-block text-center">
                                            <asp:Button runat="server" OnClick="ContactRegisterClick" Text="ارسال" CssClass="btn btn-success" ID="RegisterButton"/>
                                        </div>
                                    </div>
                                <address style="display:none;">
                                    One Microsoft Way<br />
                                    Redmond, WA 98052-6399<br />
                                    <abbr title="Phone">P:</abbr>
                                    425.555.0100
                                </address>
                                <address style="display:none;">
                                    <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
                                    <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
                                </address>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
