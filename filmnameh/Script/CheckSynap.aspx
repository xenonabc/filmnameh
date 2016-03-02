<%@ Page Title="نظر دهی" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckSynap.aspx.cs" Inherits="filmnameh.Script.CheckSynap" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2>مدیریت سیناپس</h2>
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
                                            <dt>نوع</dt>
                                            <dd><%: GetScript["tType"]%></dd>
                                            <dt>عنوان</dt>
                                            <dd><%: GetScript["Title"]%></dd>
                                            <dt>نویسنده</dt>
                                            <dd><%: GetScript["Author"]%></dd>
                                            <dt>ارائه دهنده</dt>
                                            <dd><%: GetScript["Provider"]%></dd>
                                            <dt>زمان ایجاد</dt>
                                            <dd><%: ConvertDate(GetScript["CreateDate"].ToString()) %></dd>
                                            <dt>گونه</dt>
                                            <dd><%: GetScript["Genre"]%></dd>
                                            <dt>قالب</dt>
                                            <dd><%: GetScript["Form"]%></dd>
                                            <dt>موضوع</dt>
                                            <dd><%: GetScript["Subject"]%> / <%: GetScript["Side1"]%></dd>
                                            <dt>پیام(در یک جمله)</dt>
                                            <dd><%: GetScript["Side2"]%></dd>
                                            <dt>خلاصه</dt>
                                            <dd><%: GetScript["Summary"]%></dd>
                                            <dt><%: GetScript["tType"]%></dt>
                                            <dd><%: GetScript["Text"]%></dd>
                                            <dt>پیوست ها</dt>
                                            <dd><asp:ListView runat="server" id="upload_list" ItemType="System.String">
                                                 <ItemTemplate>
                                                     <li><a href="/upload/<%#Item.Split('_')[0] %>/<%#Item%>"><%#Item%></a></li>
                                                 </ItemTemplate>
                                            </asp:ListView></dd>
                                            <dt>مرتبط است به</dt>
                                            <dd><%: GetScript["ScriptGroup"]%></dd>
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
                                            <asp:Label runat="server" AssociatedControlID="Score1" CssClass="col-xs-3 control-label">راهبردهای محتوایی</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:DropDownList runat="server" ID="Score1" CssClass="form-control" ValidationGroup="g1">
                                                    <asp:ListItem Text="--" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="خوب"></asp:ListItem>
                                                    <asp:ListItem Text="متوسط"></asp:ListItem>
                                                    <asp:ListItem Text="ضعیف"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator InitialValue="-1" ID="Req_ID" Display="Dynamic"  ValidationGroup="g1" runat="server" ControlToValidate="Score1" Text="*" ErrorMessage="ErrorMessage">
                                                </asp:RequiredFieldValidator>


                                            </div>
                                            <div class="_padding-top text-medium">آیا محتوای اصلی در دل ساختار داستانی به بار نشسته است؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Score2" CssClass="col-xs-3 control-label">تشخیص عناصر عمده ساختار داستانی</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:DropDownList runat="server" ID="Score2" CssClass="form-control">
                                                    <asp:ListItem Text="--" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="خوب"></asp:ListItem>
                                                    <asp:ListItem Text="متوسط"></asp:ListItem>
                                                    <asp:ListItem Text="ضعیف"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Score2" CssClass="text-danger" ErrorMessage="پر کردن معیار دوم اجباری است" />
                                            </div>
                                            <div class="_padding-top text-medium">آیا می توان خطی سراسری که به اعتبار نیروهای درونی روایت، شروع را به میانه و سپس به پایان پیوند می دهد، تشخیص داد؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Score3" CssClass="col-xs-3 control-label">شخصیت ها</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:DropDownList runat="server" ID="Score3" CssClass="form-control">
                                                    <asp:ListItem Text="--" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="خوب"></asp:ListItem>
                                                    <asp:ListItem Text="متوسط"></asp:ListItem>
                                                    <asp:ListItem Text="ضعیف"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Score3" CssClass="text-danger" ErrorMessage="پر کردن معیار سوم اجباری است" />
                                            </div>
                                            <div class="_padding-top text-medium">آیا دیالوگ ها پیش برنده داستان، متناسب با ویژگی های شخصیت و دارای بار دراماتیک هستند؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Score4" CssClass="col-xs-3 control-label">ضربان رشد و بسط داستان یا روایت</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:DropDownList runat="server" ID="Score4" CssClass="form-control">
                                                    <asp:ListItem Text="--" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="خوب"></asp:ListItem>
                                                    <asp:ListItem Text="متوسط"></asp:ListItem>
                                                    <asp:ListItem Text="ضعیف"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Score4" CssClass="text-danger" ErrorMessage="پر کردن معیار چهارم اجباری است" />
                                            </div>
                                            <div class="_padding-top text-medium">آیا تصویری اولیه و حسی از شخصیت های فرعی اثرگذار به دست می آید؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Score5" CssClass="col-xs-3 control-label">شرایط مفروض</asp:Label>
                                            <div class="col-xs-2">
                                                <asp:DropDownList runat="server" ID="Score5" CssClass="form-control">
                                                    <asp:ListItem Text="--" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="خوب"></asp:ListItem>
                                                    <asp:ListItem Text="متوسط"></asp:ListItem>
                                                    <asp:ListItem Text="ضعیف"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Score4" CssClass="text-danger" ErrorMessage="پر کردن معیار چهارم اجباری است" />
                                            </div>
                                            <div class="_padding-top text-medium">آیا تصویری اولیه و حسی از شخصیت های فرعی اثرگذار به دست می آید؟</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="Opinion" CssClass="col-xs-2 control-label">مشروح نظر</asp:Label>
                                            <div class="col-md-10">
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
