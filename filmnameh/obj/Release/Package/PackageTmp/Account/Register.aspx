<%@ Page Title="ثبت نام" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="filmnameh.Account.Register" %>

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
                                        <p class="text-danger">
                                            <asp:Literal runat="server" ID="ErrorMessage" />
                                        </p>
                                        <div class="form-horizontal">
                                            <h4>ایجاد کاربر جدید</h4>
                                            <hr />
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">پست الکترونیک</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control ltr" TextMode="Email" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                                        CssClass="text-danger" ErrorMessage="پرکردن پست الکترونیک اجباری است" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">کلمه عبور</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control ltr" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                                        CssClass="text-danger" ErrorMessage="پرکردن کلمه عبور اجباری است" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">تکرار کلمه عبور</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control ltr" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="پرکردن تکرار کلمه عبور اجباری است" />
                                                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="کلمه عبور و تکرار آن مشابه نیستند" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">نام</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" CssClass="text-danger" Display="Dynamic" ErrorMessage="پرکردن نام اجباری است" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="Surname" CssClass="col-md-2 control-label">نام خانوادگی</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="Surname" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Surname" CssClass="text-danger" Display="Dynamic" ErrorMessage="پرکردن نام خانوادگی اجباری است" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="Tel" CssClass="col-md-2 control-label">تلفن</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="Tel" CssClass="form-control ltr" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Tel" CssClass="text-danger" Display="Dynamic" ErrorMessage="پرکردن تلفن اجباری است" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="History" CssClass="col-md-2 control-label">سوابق</asp:Label>
                                                <div class="col-md-10">
                                                    <asp:TextBox runat="server" ID="History" TextMode="MultiLine" CssClass="form-control" Rows="5" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="History" CssClass="text-danger" Display="Dynamic" ErrorMessage="پرکردن سوابق اجباری است" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-2 control-label">آدرس</asp:Label>
                                                <div class="col-md-10">
                                                    <asp:TextBox runat="server" ID="Address" TextMode="MultiLine" CssClass="form-control" Rows="2" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-offset-2 col-md-10">
                                                    <asp:Button runat="server" OnClick="CreateUserClick" Text="ثبت نام" CssClass="btn btn-default" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <section id="socialLoginForm">
                                            <div id="socialLoginList">
                                                <h4>راهنما</h4>
                                                <hr />
                                                <div>
                                                    <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیستری را برای طراحان رایانه ای و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.</p>
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
