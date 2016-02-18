<%@ Page Title="تماس" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="filmnameh.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2><%: Title %></h2>
                                <h3>مرکز گسترش فیلم‌نامه</h3>
                                <address>
                                    One Microsoft Way<br />
                                    Redmond, WA 98052-6399<br />
                                    <abbr title="Phone">P:</abbr>
                                    425.555.0100
                                </address>
                                <address>
                                    <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
                                    <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
                                </address>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
