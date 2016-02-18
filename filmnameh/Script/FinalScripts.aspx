<%@ Page Title="مدیریت فیلم نامه ها" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FinalScripts.aspx.cs" Inherits="filmnameh.Script.FinalScripts" %>

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
                                        <asp:ListView runat="server" ID="MyscriptsList" ItemType="System.Collections.Generic.Dictionary`2[System.String,System.Object]">
                                            <LayoutTemplate>
                                                <div class="page-header">
                                                    <h4>فیلم‌نامه‌های آماده رای</h4>
                                                </div>
                                                <table class="table table-bordered table-hover table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th class="col-xs-1">شناسه</th>
                                                            <th class="col-xs-8">عنوان</th>
                                                            <th class="col-xs-1">مشاهده</th>
                                                            <th class="col-xs-1">ویرایش تخصیص ها</th>
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
                                                    <td><%#: Item["Title"] %></td>
                                                    <td><a href="<%# "/Script/FinalScript/" + Item["ScriptID"] %>">مشاهده</a></td>
                                                    <td><a href="<%# "/Script/ReAssignScript/" + Item["ScriptID"] %>">ویرایش</a></td>
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
