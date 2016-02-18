<%@ Page Title="فیلمنامه‌های من" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyScript.aspx.cs" Inherits="filmnameh.Script.MyScript" %>

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
                                            <dt>زمان ایجاد</dt>
                                            <dd><%: GetMyScript["CreateDate"]%></dd>
                                            <dt>گونه</dt>
                                            <dd><%: GetMyScript["Genre"]%></dd>
                                            <dt>قالب</dt>
                                            <dd><%: GetMyScript["Form"]%></dd>
                                            <dt>خلاصه</dt>
                                            <dd><%: GetMyScript["Summary"]%></dd>
                                            <dt>آخرین وضعیت</dt>
                                            <dd><%: GetMyScript["FinalState"]%></dd>
                                            <dt>آخرین طرح</dt>
                                            <dd><%: GetMyScript["Text"]%></dd>
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
