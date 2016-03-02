<%@ Page Title="ثبت نظر نهایی" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FinalScript.aspx.cs" Inherits="filmnameh.Script.FinalScript" %>

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
                                        <% if(GetScript != null) { %>
                                        <dl class="dl-horizontal">
                                            <dt>شناسه</dt>
                                            <dd><%: GetScript.First()["ScriptID"]%></dd>
                                            <dt>نوع</dt>
                                            <dd><%: GetScript.First()["tType"]%></dd>
                                            <dt>عنوان</dt>
                                            <dd><%: GetScript.First()["Title"]%></dd>
                                            <dt>نویسنده</dt>
                                            <dd><%: GetScript.First()["Author"]%></dd>
                                            <dt>ارائه دهنده</dt>
                                            <dd><%: GetScript.First()["Provider"]%></dd>
                                            <dt>زمان ایجاد</dt>
                                            <dd><%: ConvertDate(GetScript.First()["CreateDate"].ToString()) %></dd>
                                            <dt>گونه</dt>
                                            <dd><%: GetScript.First()["Genre"]%></dd>
                                            <dt>قالب</dt>
                                            <dd><%: GetScript.First()["Form"]%></dd>
                                            <dt>موضوع</dt>
                                            <dd><%: GetScript.First()["Subject"]%> / <%: GetScript.First()["Side1"]%></dd>
                                            <dt>پیام(در یک جمله)</dt>
                                            <dd><%: GetScript.First()["Side2"]%></dd>
                                            <dt>خلاصه</dt>
                                            <dd><%: GetScript.First()["Summary"]%></dd>
                                            <dt>آخرین طرح</dt>
                                            <dd><%: GetScript.First()["Text"]%></dd>
                                            <dt>پیوست ها</dt>
                                            <dd><asp:ListView runat="server" id="upload_list" ItemType="System.String">
                                                 <ItemTemplate>
                                                     <li><a href="/upload/<%#Item.Split('_')[0] %>/<%#Item%>"><%#Item%></a></li>
                                                 </ItemTemplate>
                                            </asp:ListView></dd>
                                            <dt>مرتبط است به</dt>
                                            <dd><%: GetScript.First()["ScriptGroup"]%></dd>
                                        </dl>
                                        <asp:ListView runat="server" ID="MyscriptsList" ItemType="System.Collections.Generic.Dictionary`2[System.String,System.Object]">
                                            <LayoutTemplate>
                                                <h4>آراء شورا</h4>
                                                <table class="table table-bordered table-hover table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th class="">نام کارشناس</th>
                                                            <th class="">تاریخ ارجاع</th>
                                                            <th class="">تاریخ کارشناسی</th>
                                                            <th class="">معیار نخست</th>
                                                            <th class="">معیار دوم</th>
                                                            <th class="">معیار سوم</th>
                                                            <th class="">معیار چهارم</th>
                                                            <th class="">معیار پنجم</th>
                                                            <th class="col-xs-6">نظر</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder"></tr>
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#: Item["Name"]+" "+Item["Surname"] %></td>
                                                    <td><%#: ConvertDate(Item["SXUDate"].ToString()) %></td>
                                                    <td><%#: ConvertDate(Item["CheckDate"].ToString()) %></td>
                                                    <td><%#: Item["Score1"] %></td>
                                                    <td><%#: Item["Score2"] %></td>
                                                    <td><%#: Item["Score3"] %></td>
                                                    <td><%#: Item["Score4"] %></td>
                                                    <td><%#: Item["Score5"] %></td>
                                                    <td><%#: Item["Opinion"] %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>

                                        <section id="loginForm">
                                            <div class="form-horizontal">
                                                <h4></h4>
                                                <hr />
                                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                                    <p class="text-danger">
                                                        <asp:Literal runat="server" ID="FailureText" />
                                                    </p>
                                                </asp:PlaceHolder>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="FinalOpinion" CssClass="col-md-2 control-label">نظر نهایی</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:TextBox runat="server" ID="FinalOpinion" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="FinalOpinion" CssClass="text-danger" ErrorMessage="پر کردن نظر نهایی اجباری است" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="FinalState" CssClass="col-md-2 control-label">وضعیت نهایی</asp:Label>
                                                    <div class="col-xs-2">
                                                        <asp:DropDownList runat="server" ID="FinalState" CssClass="form-control">
                                                            <asp:ListItem Text="--"></asp:ListItem>
                                                            <asp:ListItem Text="بررسی مجدد"></asp:ListItem>
                                                            <asp:ListItem Text="تصویب"></asp:ListItem>
                                                            <asp:ListItem Text="مشروط"></asp:ListItem>
                                                            <asp:ListItem Text="مسکوت"></asp:ListItem>
                                                            <asp:ListItem Text="مردود"></asp:ListItem>
                                                        </asp:DropDownList>
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

                                        <% } else { %>
                                        <p class="text-success">صفحه ای بازگردانیده نشد</p>    
                                        <% } %>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
