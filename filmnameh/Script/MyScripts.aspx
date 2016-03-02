<%@ Page Title="فیلمنامه‌های من" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyScripts.aspx.cs" Inherits="filmnameh.Script.MyScripts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <div class="col-xs-5 pull-left">
                                    <div class="col-xs-3 pull-left">
                                        <a href="/Script/MyPlans" class="btn btn-success pull-left">طرح ها</a>
                                    </div>
                                    <div class="col-xs-3 pull-left">
                                        <a href="/Script/MySynapsis" class="btn btn-success pull-left">سیناپس ها</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <h2>مدیریت فیلم نامه ها :</h2>
                                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                                    <p class="text-success"><%: SuccessMessage %></p>
                                </asp:PlaceHolder>
                                <div>
                                    <p> </p>
                                    <div class="col-xs-5 pull-left">
                                        <div class="col-xs-5 pull-left" style="display:none;">
                                            <a href="/Script/LinkedRegister" class="btn btn-info pull-left">ایجاد فیلم‌نامه‌ی مرتبط</a>
                                        </div>
                                        <div class="col-xs-5 pull-left">
                                            <a href="/Script/Register" class="btn btn-info pull-left">ایجاد فیلم‌نامه‌ی جدید</a>
                                        </div>
                                    </div>  
                                    <div class="clearfix"></div>
                                    <section id="externalLoginsForm">
                                        <asp:ListView runat="server" ID="MyscriptsList" ItemType="System.Collections.Generic.Dictionary`2[System.String,System.Object]">
                                            <LayoutTemplate>
                                                <h4>فیلم‌نامه‌های جاری</h4>
                                                <table class="table table-bordered table-hover table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th class="col-xs-1">شناسه</th>
                                                            <th class="col-xs-2">تاریخ ثبت</th>
                                                            <th class="col-xs-5">عنوان</th>
                                                            <th class="col-xs-2">وضعیت</th>
                                                            <th class="col-xs-1">مشاهده</th>
                                                            <th class="col-xs-1">ویرایش</th>
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
                                                        <asp:PlaceHolder runat="server" visible='<%# Item["Council"].ToString() == "0" %>'>
                                                            <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() != "0" %>'>
                                                                <a data-toggle="tooltip" href="#" title="<%# Item["FinalOpinion"] %>"><%# Item["FinalState"] %></a>
                                                            </asp:PlaceHolder>
                                                            <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() == "0" %>'>
                                                            ارسال شده
                                                            </asp:PlaceHolder>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder runat="server" visible='<%# Item["Council"].ToString() != "0" %>'>
                                                            <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() != "0" %>'>
                                                            <%# Item["FinalState"] %>
                                                            </asp:PlaceHolder>
                                                            <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() == "0" %>'>
                                                                در حال بررسی
                                                            </asp:PlaceHolder>
                                                        </asp:PlaceHolder>
                                                        
                                                    </td>
                                                    <td>
                                                        <a href="<%# "/Script/MyScript/" + Item["ScriptID"] %>">مشاهده</a>
                                                    </td>
                                                    <td>
                                                        <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() == "0" %>'>
                                                            <asp:PlaceHolder runat="server" visible='<%# Item["Council"].ToString() == "0" %>'>
                                                                <a href="<%# "/Script/Register/" + Item["ScriptID"] %>">ویرایش</a>
                                                            </asp:PlaceHolder>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() != "0"  %>'>
                                                            <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() == "مشروط"  %>'>
                                                                <a href="/Script/LinkedRegister/<%#: Item["ScriptID"] %>" class="btn btn-info pull-left">ایجاد فیلم‌نامه‌ی مرتبط</a>
                                                            </asp:PlaceHolder>
                                                            <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() == "مسکوت"  %>'>
                                                                <a href="/Script/LinkedRegister/<%#: Item["ScriptID"] %>" class="btn btn-info pull-left">ایجاد فیلم‌نامه‌ی مرتبط</a>
                                                            </asp:PlaceHolder>
                                                            <asp:PlaceHolder runat="server" visible='<%# Item["FinalState"].ToString() == "بررسی مجدد"  %>'>
                                                                <a href="/Script/LinkedRegister/<%#: Item["ScriptID"] %>" class="btn btn-info pull-left">ایجاد فیلم‌نامه‌ی مرتبط</a>
                                                            </asp:PlaceHolder>
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
