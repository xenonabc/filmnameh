<%@ Page Title="ایجاد فیلم‌نامه‌ی جدید" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="filmnameh.Script.Register" %>

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
                                <div class="row bs-wizard" style="border-bottom: 0;">
                                    <div class="col-xs-4 bs-wizard-step active">
                                        <div class="text-center bs-wizard-stepnum">گام نخست</div>
                                        <div class="progress">
                                            <div class="progress-bar"></div>
                                        </div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                    </div>
                                    <div class="col-xs-4 bs-wizard-step disabled">
                                        <!-- complete -->
                                        <div class="text-center bs-wizard-stepnum">گام دوم</div>
                                        <div class="progress">
                                            <div class="progress-bar"></div>
                                        </div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                    </div>
                                    <div class="col-xs-4 bs-wizard-step disabled">
                                        <!-- complete -->
                                        <div class="text-center bs-wizard-stepnum">گام سوم</div>
                                        <div class="progress">
                                            <div class="progress-bar"></div>
                                        </div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                    </div>
                                </div>
                                <div class="form-horizontal">
                                    <div class="page-header">
                                        <h4>گام نخست</h4>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptTitle" CssClass="col-md-2 control-label">عنوان</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ScriptTitle" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ScriptTitle" CssClass="text-danger" ErrorMessage="پرکردن عنوان اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptForm" CssClass="col-md-2 control-label">قالب</asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList runat="server" ID="ScriptForm" CssClass="form-control">
                                                <asp:ListItem Text="--"></asp:ListItem>
                                                <asp:ListItem Text="سینمایی"></asp:ListItem>
                                                <asp:ListItem Text="سریال"></asp:ListItem>
                                                <asp:ListItem Text="تله فیلم"></asp:ListItem>
                                                <asp:ListItem Text="تله تئاتر"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptGenre" CssClass="col-md-2 control-label">گونه</asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList runat="server" ID="ScriptGenre" CssClass="form-control">
                                                <asp:ListItem Text="--"></asp:ListItem>
                                                <asp:ListItem Text="کمدی"></asp:ListItem>
                                                <asp:ListItem Text="درام"></asp:ListItem>
                                                <asp:ListItem Text="پلیسی"></asp:ListItem>
                                                <asp:ListItem Text="جنگی"></asp:ListItem>
                                                <asp:ListItem Text="تاریخی"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptSummary" CssClass="col-md-2 control-label">خلاصه</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ScriptSummary" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ScriptSummary" CssClass="text-danger" ErrorMessage="پرکردن خلاصه اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="center-block text-center">
                                            <asp:Button runat="server" OnClick="ScriptRegisterClick" Text="گام بعدی" CssClass="btn btn-success" />
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
