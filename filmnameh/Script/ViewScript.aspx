<%@ Page Title="مشاهده جزئیات فیلم نامه" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewScript.aspx.cs" Inherits="filmnameh.Script.ViewScript" %>

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
                                        <% if(GetMyScript != null) { %>
                                        <dl class="dl-horizontal">
                                            <dt>شناسه</dt>
                                            <dd><%: GetMyScript["ScriptID"]%></dd>
                                            <dt>عنوان</dt>
                                            <dd><%: GetMyScript["Title"]%></dd>
                                             <dt>نویسنده</dt>
                                            <dd><%: GetMyScript["Author"]%></dd>
                                             <dt>ارائه دهنده</dt>
                                            <dd><%: GetMyScript["Provider"]%></dd>
                                            <dt>زمان ایجاد</dt>
                                            <dd><%: ConvertDate(GetMyScript["CreateDate"].ToString()) %></dd>
                                            <dt>گونه</dt>
                                            <dd><%: GetMyScript["Genre"]%></dd>
                                            <dt>قالب</dt>
                                            <dd><%: GetMyScript["Form"]%></dd>
                                            <dt>موضوع</dt>
                                            <dd><%: GetMyScript["Subject"]%> / <%: GetMyScript["Side1"]%> / <%: GetMyScript["Side2"]%></dd>
                                            <dt>خلاصه</dt>
                                            <dd><%: GetMyScript["Summary"]%></dd>
                                            <dt>آخرین طرح</dt>
                                            <dd><%: GetMyScript["Text"]%></dd>
                                            <dt>پیوست ها</dt>
                                            <dd><asp:ListView runat="server" id="upload_list" ItemType="System.String">
                                                 <ItemTemplate>
                                                     <li><a href="/upload/<%#Item.Split('_')[0] %>/<%#Item%>"><%#Item%></a></li>
                                                 </ItemTemplate>
                                            </asp:ListView></dd>
                                            <dt>تاریخ کارشناسی</dt>
                                            <dd><%: ConvertDate(GetMyScript["CheckDate"].ToString()) %></dd>
                                            <dt>محتوا</dt>
                                            <dd><%: GetMyScript["Score1"]%></dd>
                                            <dt>کنش یا خط داستانی</dt>
                                            <dd><%: GetMyScript["Score2"]%></dd>
                                            <dt>پیوند های علت و معلولی</dt>
                                            <dd><%: GetMyScript["Score3"]%></dd>
                                            <dt>شخصیت ها</dt>
                                            <dd><%: GetMyScript["Score4"]%></dd>
                                            <dt>مشروح نظر</dt>
                                            <dd><%: GetMyScript["Opinion"]%></dd>
                                        </dl>
                                        <% } else { %>
                                        <p class="text-danger">صفحه ای بازگردانیده نشد</p>
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
