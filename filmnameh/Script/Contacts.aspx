<%@ Page Title="مشاهده تماس ها" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="filmnameh.Script.Contacts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2>مشاهده تماس ها</h2>
                                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                                    <p class="text-success"><%: SuccessMessage %></p>
                                </asp:PlaceHolder>
                                <div> 
                                    <div class="clearfix"></div>
                                    <section id="externalLoginsForm">
                                        <asp:ListView runat="server" ID="ContactsList" ItemType="System.Collections.Generic.Dictionary`2[System.String,System.Object]">
                                            <LayoutTemplate>
                                                <h4>لیست پیام ها</h4>
                                                <table class="table table-bordered table-hover table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th class="col-xs-1">نام</th>
                                                            <th class="col-xs-1">ایمیل</th>
                                                            <th class="col-xs-1">موضوع</th>
                                                            <th class="col-xs-1">تاریخ</th>
                                                            <th class="col-xs-6">متن پیام</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder"></tr>
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#: Item["ContactName"] %></td>
                                                    <td><a href = "mailto:<%#: Item["ContactEmail"] %>"><%#: Item["ContactEmail"] %></a></td>
                                                    <td><%#: Item["ContactSubject"] %></td>
                                                    <td><%#: ConvertDate(Item["ContactDate"].ToString()) %></td>
                                                    <td><%#: Item["ContactText"] %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <div class="pagination" style="margin: 0 auto">
                                         <% 
                                                for (var i = 1; i <= totalPages; i++){
                                                     %><li><a href="/Script/Contacts/<%: i %>"><%: i %></a></li><%
                                                }   
                                            %>
                                        </div>
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
