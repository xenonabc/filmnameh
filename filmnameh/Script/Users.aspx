<%@ Page Title="مشاهده کاربران" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="filmnameh.Script.Users" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2>مشاهده کاربران</h2> <%#: totalP["num"].ToString() %>
                                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                                    <p class="text-success"><%: SuccessMessage %></p>
                                </asp:PlaceHolder>
                                <div> 
                                    <div class="clearfix"></div>
                                    <section id="externalLoginsForm">
                                        <asp:ListView runat="server" ID="UsersList" ItemType="System.Collections.Generic.Dictionary`2[System.String,System.Object]">
                                            <LayoutTemplate>
                                                <h4>لیست کاربران</h4>
                                                <table class="table table-bordered table-hover table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th class="col-xs-1">شناسه</th>
                                                            <th class="col-xs-2">نام</th>
                                                            <th class="col-xs-2">نام خانوادگی</th>
                                                            <th class="col-xs-2">پست الکترونیک</th>
                                                            <th class="col-xs-2">تلفن</th>
                                                            <th class="col-xs-2">سابقه</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder"></tr>
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#: Item["UserID"] %></td>
                                                    <td><%#: Item["Name"] %></td>
                                                    <td><%#: Item["Surname"] %></td>
                                                    <td><a href = "mailto:<%#: Item["UID"] %>"><%#: Item["UID"] %></a></td>
                                                    <td><%#: Item["Tel"] %></td>
                                                    <td><%#: Item["History"] %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <div class="pagination" style="margin: 0 auto">
                                         <% 
                                                for (var i = 1; i <= totalPages; i++){
                                                     %><li><a href="/Script/Users/<%: i %>"><%: i %></a></li><%
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
