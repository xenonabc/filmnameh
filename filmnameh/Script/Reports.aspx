<%@ Page Title="گزارش گیری" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="filmnameh.Script.Reports" %>

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
                                <div class="row">
                                    <div class=" col-md-12">
                                    <div class="page-header">
                                        <h4></h4>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-1">
                                            <asp:Label runat="server" AssociatedControlID="FromDate" CssClass="control-label">از تاریخ:</asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:TextBox runat="server" ID="FromDate" CssClass="form-control"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="FromDate" CssClass="text-danger" ErrorMessage="پرکردن عنوان اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-1">
                                            <asp:Label runat="server" AssociatedControlID="ToDate" CssClass="control-label">تا تاریخ:</asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:TextBox runat="server" ID="ToDate" CssClass="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <asp:Button runat="server" OnClick="DoReportButtonClick" Text="اجرا" CssClass="btn btn-success" ID="DoReportButton"/>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="clearfix"></div>
                                        <section id="externalLoginsForm">
                                            <asp:ListView runat="server" ID="ReportList" ItemType="System.Collections.Generic.Dictionary`2[System.String,System.Object]">
                                                <LayoutTemplate>
                                                    <table class="table table-bordered table-hover table-striped table-centered">
                                                        <thead>
                                                            <tr>
                                                                <th class="col-xs-1">ردیف</th>
                                                                <th class="col-xs-1">شناسه</th>
                                                                <th class="col-xs-1">تاریخ ثبت</th>
                                                                <th class="col-xs-1">عنوان</th>
                                                                <th class="col-xs-1">نوع</th>
                                                                <th class="col-xs-2">پیام در یک جمله</th>
                                                                <th class="col-xs-1">موضوع</th>
                                                                <th class="col-xs-1">گونه</th>
                                                                <th class="col-xs-2">ارائه دهنده</th>
                                                                <th class="col-xs-1">ساختار</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr runat="server" id="itemPlaceholder"></tr>
                                                        </tbody>
                                                    </table>
                                                </LayoutTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%#: Item["rank"] %></td>
                                                        <td><%#: Item["ScriptID"] %></td>
                                                        <td><%#: ConvertDate(Item["CreateDate"].ToString()) %></td>
                                                        <td><%#: Item["Title"] %></td>
                                                        <td><%#: Item["ty"] %></td>
                                                        <td><%#: Item["Summary"] %></td>
                                                        <td><%#: Item["Subject"] %></td>
                                                        <td><%#: Item["Genre"] %></td>
                                                        <td><%#: Item["Provider"] %></td>
                                                        <td><%#: Item["Form"] %></td>
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
        </div>
    </section>
</asp:Content>
