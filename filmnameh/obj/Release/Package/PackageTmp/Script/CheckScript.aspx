<%@ Page Title="فیلمنامه‌های من" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckScript.aspx.cs" Inherits="filmnameh.Script.CheckScript" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2>مدیریت فیلم‌نامه‌ها</h2>
                                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                                    <p class="text-success"><%: SuccessMessage %></p>
                                </asp:PlaceHolder>
                                <div>
                                    <section id="externalLoginsForm">
                                        <% if (GetScript != null)
                                           { %>
                                        <dl class="dl-horizontal">
                                            <dt>شناسه</dt>
                                            <dd><%: GetScript["ScriptID"]%></dd>
                                            <dt>عنوان</dt>
                                            <dd><%: GetScript["Title"]%></dd>
                                            <dt>زمان ایجاد</dt>
                                            <dd><%: GetScript["CreateDate"]%></dd>
                                            <dt>گونه</dt>
                                            <dd><%: GetScript["Genre"]%></dd>
                                            <dt>قالب</dt>
                                            <dd><%: GetScript["Form"]%></dd>
                                            <dt>خلاصه</dt>
                                            <dd><%: GetScript["Summary"]%></dd>
                                            <dt>آخرین وضعیت</dt>
                                            <dd><%: GetScript["State"]%></dd>
                                            <dt>آخرین طرح</dt>
                                            <dd><%: GetScript["Text"]%></dd>
                                        </dl>
                                        <% }
                                           else
                                           { %>
                                        <p class="text-success">صفحه ای بازگردانیده نشد</p>
                                        <% } %>
                                    </section>
                                </div>
                                <section id="loginForm">
                                    <div class="form-horizontal">
                                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                            <p class="text-danger">
                                                <asp:Literal runat="server" ID="FailureText" />
                                            </p>
                                        </asp:PlaceHolder>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Score1" CssClass="col-xs-3 control-label">محتوا</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:TextBox runat="server" ID="Score1" CssClass="form-control" TextMode="Number" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Score1" CssClass="text-danger" ErrorMessage="پر کردن معیار نخست اجباری است" />
                                            </div>
                                            <div class="_padding-top text-medium">آیا محتوای اصلی در دل ساختار داستانی به بار نشسته است؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Score2" CssClass="col-xs-3 control-label">کنش یا خط داستانی</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:TextBox runat="server" ID="Score2" CssClass="form-control" TextMode="Number" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Score2" CssClass="text-danger" ErrorMessage="پر کردن معیار دوم اجباری است" />
                                            </div>
                                            <div class="_padding-top text-medium">آیا می توان خطی سراسری که به اعتبار نیروهای درونی روایت، شروع را به میانه و سپس به پایان پیوند می دهد، تشخیص داد؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Score3" CssClass="col-xs-3 control-label">پیوند های علت و معلولی یا پیوندهای مبتنی بر احتمال و ضرورت</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:TextBox runat="server" ID="Score3" CssClass="form-control" TextMode="Number" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Score3" CssClass="text-danger" ErrorMessage="پر کردن معیار سوم اجباری است" />
                                            </div>
                                            <div class="_padding-top text-medium">آیا رویدادها از پیوندی درونی و محکم برخوردارند با نه؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Score4" CssClass="col-xs-3 control-label">شخصیت ها</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:TextBox runat="server" ID="Score4" CssClass="form-control" TextMode="Number" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Score4" CssClass="text-danger" ErrorMessage="پر کردن معیار چهارم اجباری است" />
                                            </div>
                                            <div class="_padding-top text-medium">آیا تصویری اولیه و حسی از شخصیت های فرعی اثرگذار به دست می آید؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Opinion" CssClass="col-xs-3 control-label">مشروح نظر</asp:Label>
                                            <div class="col-md-9">
                                                <asp:TextBox runat="server" ID="Opinion" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Opinion" CssClass="text-danger" ErrorMessage="پر کردن نظر اجباری است" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="text-center">
                                                    <asp:Button runat="server" OnClick="RegisterClick" Text="ثبت" CssClass="btn btn-success" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
