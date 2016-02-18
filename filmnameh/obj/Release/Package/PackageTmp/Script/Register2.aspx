<%@ Page Title="ایجاد فیلم‌نامه‌ی جدید" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register2.aspx.cs" Inherits="filmnameh.Script.Register2" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <style>
                                    #divMain {
                                        width: 980px;
                                        height: 757px;
                                        margin: auto;
                                        background: url(http://93.190.24.121/plot/plotdiagram2.jpg);
                                        position: relative;
                                    }

                                    textarea, input {
                                        background-color: transparent;
                                        border: none;
                                    }
                                </style>
                                <h2><%: Title %></h2>
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="ErrorMessage" />
                                </p>
                                <div class="row bs-wizard" style="border-bottom: 0;">
                                    <div class="col-xs-4 bs-wizard-step complete">
                                        <div class="text-center bs-wizard-stepnum">گام نخست</div>
                                        <div class="progress">
                                            <div class="progress-bar"></div>
                                        </div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                    </div>
                                    <div class="col-xs-4 bs-wizard-step complete">
                                        <div class="text-center bs-wizard-stepnum">گام دوم</div>
                                        <div class="progress">
                                            <div class="progress-bar"></div>
                                        </div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                    </div>
                                    <div class="col-xs-4 bs-wizard-step active">
                                        <div class="text-center bs-wizard-stepnum">گام سوم</div>
                                        <div class="progress">
                                            <div class="progress-bar"></div>
                                        </div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                    </div>
                                </div>
                                <div class="form-horizontal">
                                    <div class="page-header">
                                        <h4>گام سوم</h4>
                                    </div>
                                    <div class="form-group">
                                        <div id="divMain">
                                            <textarea id="characters" name="characters" style="position: absolute; left: 44px; top: 648px; height: 76px; width: 270px;"></textarea>
                                            <textarea id="theme" name="theme" style="position: absolute; left: 441px; top: 655px; height: 70px; width: 496px;"></textarea>
                                            <textarea id="resolution" name="resolution" style="position: absolute; left: 676px; top: 515px; height: 100px; width: 262px;"></textarea>
                                            <textarea id="fallingaction" name="fallingaction" style="position: absolute; left: 653px; top: 239px; height: 129px; width: 285px;"></textarea>
                                            <textarea id="action3" name="action3" style="position: absolute; left: 32px; top: 332px; height: 51px; width: 317px;"></textarea>
                                            <textarea id="action1" name="action1" style="position: absolute; left: 28px; top: 196px; height: 51px; width: 380px;"></textarea>
                                            <textarea id="action2" name="action2" style="position: absolute; left: 31px; top: 265px; height: 50px; width: 341px;"></textarea>
                                            <textarea id="climax" name="climax" style="position: absolute; left: 339px; top: 63px; height: 87px; width: 311px;"></textarea>
                                            <input id="protagonist" name="protagonist" style="position: absolute; top: 565px; left: 354px; width: 128px;" />
                                            <input id="antagonist" name="antagonist" style="position: absolute; top: 566px; left: 524px; width: 125px;" />
                                            <input id="plotauthor" name="plotauthor" style="position: absolute; top: 127px; left: 774px; width: 164px;" />
                                            <input id="plottitle" name="plottitle" style="position: absolute; top: 95px; left: 746px; width: 194px;" />
                                            <input id="situation" name="situation" style="position: absolute; top: 595px; left: 175px; width: 141px;" />
                                            <input id="setting" name="setting" style="position: absolute; top: 560px; left: 111px; width: 208px;" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="center-block text-center">
                                                <asp:Button runat="server" OnClick="ScriptRegister2Click" Text="ثبت" CssClass="btn btn-success" />
                                            </div>
                                        </div>
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
