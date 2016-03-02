<%@ Page Title="مدیریت فیلم نامه ها" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Final.aspx.cs" Inherits="filmnameh.Script.Final" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2>مدیریت طرح / سیناپس / فیلم نامه</h2>
                                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                                    <p class="text-success"><%: SuccessMessage %></p>
                                </asp:PlaceHolder>
                                <div>
                                    <section id="externalLoginsForm">
                                        <asp:ListView runat="server" ID="MyscriptsList" ItemType="System.Collections.Generic.Dictionary`2[System.String,System.Object]">
                                            <LayoutTemplate>
                                                <div class="page-header">
                                                    <h4>طرح / سیناپس / فیلم نامه (نهایی شده)</h4>
                                                </div>
                                                <table class="table table-bordered table-hover table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th class="col-xs-1">شناسه</th>
                                                            <th class="col-xs-4">عنوان</th>
                                                            <th class="col-xs-2">نوع</th>
                                                            <th class="col-xs-2">وضعیت</th>
                                                            <th class="col-xs-1">مشاهده</th>
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
                                                    <td><%#: Item["Type"] %></td>
                                                    <td><%#: Item["FinalState"] %></td>
                                                    <td><a href="<%# "/Script/FinalScr/" + Item["ScriptID"] %>">مشاهده</a></td>
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
