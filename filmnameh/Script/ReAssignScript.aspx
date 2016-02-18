<%@ Page Title="تخصیص فیلم نامه" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReAssignScript.aspx.cs" Inherits="filmnameh.Script.ReAssignScript" %>

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
                                            <dd><%: GetScript.First()["Subject"]%> / <%: GetScript.First()["Side1"]%> / <%: GetScript.First()["Side2"]%></dd>
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
                                        </dl>
                                        <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="CheckerUsers" CssClass="col-md-2 control-label">تخصیص به کارشناسان</asp:Label>
                                            <div class="col-md-4 cht">
                                                <asp:CheckBoxList runat="server" ID="CheckerUsers" CssClass="form-control" >
                                                </asp:CheckBoxList>
                                            </div>
                                        </div>
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
                                                    <div class="col-xs-12">
                                                        <div class="text-center">
                                                            <asp:Button runat="server" OnClick="RegisterClick1" Text="ثبت" CssClass="btn btn-success" />
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
