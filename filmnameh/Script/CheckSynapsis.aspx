<%@ Page Title="فیلمنامه‌های آماده بررسی" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckSynapsis.aspx.cs" Inherits="filmnameh.Script.CheckSynapsis" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2>مدیریت سیناپس‌ها</h2>
                                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                                    <p class="text-success"><%: SuccessMessage %></p>
                                </asp:PlaceHolder>
                                <div>
                                    <section id="externalLoginsForm">
                                        <asp:ListView runat="server" ID="MyscriptsList" ItemType="System.Collections.Generic.Dictionary`2[System.String,System.Object]">
                                            <LayoutTemplate>
                                                <div class="page-header">
                                                    <h4>سیناپس‌های جاری</h4>
                                                </div>
                                                <table class="table table-bordered table-hover table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th class="col-xs-1">شناسه</th>
                                                            <th class="col-xs-2">تاریخ ثبت</th>
                                                            <th class="col-xs-6">عنوان</th>
                                                            <th class="col-xs-2">وضعیت</th>
                                                            <th class="col-xs-1">اقدام</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder"></tr>
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#: Item["ScriptID"] %></td>
                                                    <td><%#: ConvertDate(Item["CreateDate"].ToString()) %></td>
                                                    <td><%#: Item["Title"] %></td>
                                                    <td>
                                                        <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() == "0" %>'>
                                                            در حال بررسی
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() != "0" %>'>
                                                            <%# Item["FinalState"] %>
                                                        </asp:PlaceHolder>
                                                    </td>
                                                    <td>
                                                        <asp:PlaceHolder runat="server" visible='<%# Item["CouncilID"].ToString() == "" %>'>
                                                            <a href="<%# "/Script/CheckSynap/" + Item["ScriptID"] %>">امتیازدهی</a>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder runat="server" visible='<%# Item["CouncilID"].ToString() != "" %>'>
                                                            <a href="<%# "/Script/ViewScript/" + Item["ScriptID"] %>">مشاهده</a>
                                                        </asp:PlaceHolder>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
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
