<%@ Page Title="مشاهده جزئیات فیلم نامه" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyScript.aspx.cs" Inherits="filmnameh.Script.MyScript" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2>مشاهده طرح / سیناپس / فیلم نامه</h2>
                                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                                    <p class="text-success"><%: SuccessMessage %></p>
                                </asp:PlaceHolder>
                                <div>
                                    <section id="externalLoginsForm">
                                        <% if(GetMyScript != null) { %>
                                        <dl class="dl-horizontal">
                                            <dt>شناسه</dt>
                                            <dd><%: GetMyScript["ScriptID"]%></dd>
                                            <dt>نوع</dt>
                                            <dd><%: GetMyScript["tType"]%></dd>
                                            <dt>عنوان</dt>
                                            <dd><%: GetMyScript["Title"]%></dd>
                                            <dt>زمان ایجاد</dt>
                                            <dd><%: ConvertDate(GetMyScript["CreateDate"].ToString()) %></dd>
                                            <dt>گونه</dt>
                                            <dd><%: GetMyScript["Genre"]%></dd>
                                            <dt>قالب</dt>
                                            <dd><%: GetMyScript["Form"]%></dd>
                                            <dt>موضوع</dt>
                                            <dd><%: GetMyScript["Subject"]%> / <%: GetMyScript["Side1"]%></dd>
                                            <dt>پیام(در یک جمله)</dt>
                                            <dd><%: GetMyScript["Side2"]%></dd>
                                            <dt>خلاصه</dt>
                                            <dd><%: GetMyScript["Summary"]%></dd>
                                            <dt><%: GetMyScript["tType"]%></dt>
                                            <dd><%: GetMyScript["Text"]%></dd>
                                            <dt>پیوست ها</dt>
                                            <dd><asp:ListView runat="server" id="upload_list" ItemType="System.String">
                                                 <ItemTemplate>
                                                     <li><a href="/upload/<%#Item.Split('_')[0] %>/<%#Item%>"><%#Item%></a></li>
                                                 </ItemTemplate>
                                            </asp:ListView></dd>
                                            <dt>آخرین وضعیت</dt>
                                            <dd>
                                                <%
                                                    if (GetMyScript["FinalState"].ToString() != "0")
                                                    {%>

                                                    <%: GetMyScript["FinalState"] %>

                                                    <% } 
                                                    else 
                                                    {
                                                    %>
                                                    در حال بررسی
                                                    <% } %>

                                            </dd>
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
