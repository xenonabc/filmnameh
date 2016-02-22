<%@ Page Title="ایجاد کاربر جدید" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="filmnameh.Script.RegisterUser" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2><%: Title %></h2>
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="ErrorMessage" />
                                </p>
                                <div class="form-horizontal">
                                    <div class="page-header">
                                        <h4></h4>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">نام کاربری</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="text-danger" ErrorMessage="پرکردن نام کاربری اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="Passwd" CssClass="col-md-2 control-label">کلمه عبور</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Passwd" CssClass="form-control" TextMode="Password"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Passwd" CssClass="text-danger" ErrorMessage="پرکردن کلمه عبور اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">نام</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Name" CssClass="form-control"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" CssClass="text-danger" ErrorMessage="پرکردن نام اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="Surname" CssClass="col-md-2 control-label">نام خانوادگی</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Surname" CssClass="form-control"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Surname" CssClass="text-danger" ErrorMessage="پرکردن نام خانوادگی اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="CodeMelli" CssClass="col-md-2 control-label">کد ملی</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="CodeMelli" CssClass="form-control ltr" MaxLength="10"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CodeMelli" CssClass="text-danger" Display="Dynamic" ErrorMessage="پرکردن کدملی اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="Telephone" CssClass="col-md-2 control-label">تلفن</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Telephone" CssClass="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-2 control-label">آدرس</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Address" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="History" CssClass="col-md-2 control-label">سابقه</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="History" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="Active" CssClass="col-md-2 control-label">کاربر فعال باشد</asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList runat="server" ID="Active" CssClass="form-control">
                                                <asp:ListItem Text="--"></asp:ListItem>
                                                <asp:ListItem Text="بله" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="خیر" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="center-block text-center">
                                            <asp:Button runat="server" OnClick="ScriptRegisterClick" Text="ذخیره" CssClass="btn btn-success" />
                                        </div>
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
