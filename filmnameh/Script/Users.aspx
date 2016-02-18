<%@ Page Title="مدیریت کاربری کارشناسان" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="filmnameh.Script.Users" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2>مدیریت کارشناسان</h2>
                                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                                    <p class="text-success"><%: SuccessMessage %></p>
                                </asp:PlaceHolder>
                                <div>
                                    <div class="col-xs-5 pull-left">
                                        <a href="/Script/RegisterUser" class="btn btn-info pull-left">ایجاد کاربر جدید</a>
                                    </div>  
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
                                                            <th class="col-xs-2">ویرایش</th>
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
                                                    <td>
                                                        <a href="<%# "/Script/RegisterUser/" + Item["UserID"] %>">ویرایش</a>
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
