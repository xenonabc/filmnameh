<%@ Page Title="ایجاد فیلم‌نامه‌ی جدید" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register1.aspx.cs" Inherits="filmnameh.Script.Register1" %>

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
                                    <div class="col-xs-4 bs-wizard-step complete">
                                        <div class="text-center bs-wizard-stepnum">گام نخست</div>
                                        <div class="progress">
                                            <div class="progress-bar"></div>
                                        </div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                    </div>
                                    <div class="col-xs-4 bs-wizard-step active">
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
                                        <h4>گام دوم</h4>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptText" CssClass="col-md-2 control-label">طرح</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ScriptText" CssClass="form-control" TextMode="MultiLine" Rows="15" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ScriptText" CssClass="text-danger" ErrorMessage="پرکردن طرح اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="SuggestedEpisodeNo" CssClass="col-md-2 control-label">تعداد پیشنهادی</asp:Label>
                                        <div class="col-md-2">
                                            <asp:TextBox runat="server" ID="SuggestedEpisodeNo" CssClass="form-control" Text="0" TextMode="Number" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="SuggestedEpisodeDur" CssClass="col-md-2 control-label">زمان پیشنهادی</asp:Label>
                                        <div class="col-md-2">
                                            <asp:TextBox runat="server" ID="SuggestedEpisodeDur" CssClass="form-control" Text="0" TextMode="Number" />   
                                        </div>
                                        <div class="pull-right _padding-top">دقیقه</div>
                                    </div>
                                    <div class="form-group">
                                        <div class="center-block text-center">
                                            <asp:Button runat="server" OnClick="ScriptRegister1Click" Text="گام بعدی" CssClass="btn btn-success" />
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
