<%@ Page Title="ایجاد سیناپس جدید" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterS.aspx.cs" Inherits="filmnameh.Script.RegisterS" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section id="main">
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-container _margin-bottom">
                            <div class="content">
                                <h2><%: Title %></h2>
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="ErrorMessage" />
                                </p>
                                <div class="row">
                                <div class="form-horizontal col-md-8">
                                    <div class="page-header">
                                        <h4></h4>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptTitle" CssClass="col-md-2 control-label">عنوان</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ScriptTitle" CssClass="form-control"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ScriptTitle" CssClass="text-danger" ErrorMessage="پرکردن عنوان اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="Author" CssClass="col-md-2 control-label">نویسنده</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Author" CssClass="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="Provider" CssClass="col-md-2 control-label">ارائه دهنده</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Provider" CssClass="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptForm" CssClass="col-md-2 control-label">قالب</asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList runat="server" ID="ScriptForm" CssClass="form-control">
                                                <asp:ListItem Text="--"></asp:ListItem>
                                                <asp:ListItem Text="سینمایی"></asp:ListItem>
                                                <asp:ListItem Text="سریال"></asp:ListItem>
                                                <asp:ListItem Text="فیلم تلویزیونی (تله فیلم)"></asp:ListItem>
                                                <asp:ListItem Text="نمایش تلویزیونی (تله تئاتر)"></asp:ListItem>
                                                <asp:ListItem Text="پویانمایی (سینمایی)"></asp:ListItem>
                                                <asp:ListItem Text="پویانمایی (سریال)"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptGenre" CssClass="col-md-2 control-label">گونه</asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList runat="server" ID="ScriptGenre" CssClass="form-control">
                                                <asp:ListItem Text="--"></asp:ListItem>
                                                <asp:ListItem Text="کمدی"></asp:ListItem>
                                                <asp:ListItem Text="درام"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptGenre" CssClass="col-md-2 control-label">موضوع</asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList runat="server" ID="ScriptSubject" CssClass="form-control">
                                                <asp:ListItem Text="--"></asp:ListItem>
                                                <asp:ListItem Text="خانوادگی"></asp:ListItem>
                                                <asp:ListItem Text="پلیسی"></asp:ListItem>
                                                <asp:ListItem Text="دینی"></asp:ListItem>
                                                <asp:ListItem Text="تاریخی"></asp:ListItem>
                                                <asp:ListItem Text="دفاع مقدس"></asp:ListItem>
                                                <asp:ListItem Text="انقلاب اسلامی"></asp:ListItem>
                                                <asp:ListItem Text="اجتماعی"></asp:ListItem>
                                                <asp:ListItem Text="کودک و نوجوان"></asp:ListItem>
                                                <asp:ListItem Text="سیاسی"></asp:ListItem>
                                                <asp:ListItem Text="قضایی"></asp:ListItem>
                                                <asp:ListItem Text="اخلاقی"></asp:ListItem>
                                                <asp:ListItem Text="سایر"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptSide1" CssClass="col-md-2 control-label">موضوعات فرعی</asp:Label>
                                        <div class="col-md-3">
                                            <asp:TextBox runat="server" ID="ScriptSide1" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptSide2" CssClass="col-md-2 control-label">پیام(در یک جمله)</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ScriptSide2" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptSummary" CssClass="col-md-2 control-label">خلاصه</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ScriptSummary" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ScriptSummary" CssClass="text-danger" ErrorMessage="پرکردن خلاصه اجباری است" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="ScriptText" CssClass="col-md-2 control-label">سیناپس (300~600)</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="ScriptText" CssClass="form-control" TextMode="MultiLine" Rows="15" MaxLength="600"/>
                                            <div class="col-md-1 pull-left hh">
                                                <asp:TextBox runat="server" ID="labelCo" ReadOnly="true" Text="300~600"/>
                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ScriptText" CssClass="text-danger" ErrorMessage="پرکردن سیناپس اجباری است" />
                                            <asp:ListView runat="server" id="upload_list">
                                                 <ItemTemplate>
                                                     <li><%#Container.DataItem %><i class="icon-doc"></i></li>
                                                 </ItemTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="" CssClass="col-md-2 control-label">آپلود فایل سیناپس</asp:Label>
                                        <div id="divFileUploader" class="col-md-10">
	                                        <div class="fup-uploader">
		                                        <div class="fup-upload-drop-area" style="display: none;">
			                                        <span>Drop files here to upload</span>
		                                        </div>
		                                        <div class="fup-upload-button">فایل را انتخاب کنید
			                                        <input type="file" name="file">
		                                        </div>
		                                        
	                                        </div>
                                        </div>
                                        <asp:TextBox runat="server" id='txtFiles' type='hidden' />
                                        <input id='txtFailed' type='hidden' />
                                        <script type="text/javascript">
                                            function createUploader() {
                                                var uploader = new fup.FileUploader({
                                                    element: document.getElementById('divFileUploader')
                                                });
                                            };
                                            window.onload = createUploader;  
                                        </script>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="SuggestedEpisodeNo" CssClass="col-md-2 control-label">تعداد پیشنهادی</asp:Label>
                                        <div class="col-md-2">
                                            <asp:TextBox runat="server" ID="SuggestedEpisodeNo" CssClass="form-control" Text="0" TextMode="Number" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="SuggestedEpisodeDur" CssClass="col-md-2 control-label">زمان پیشنهادی هر قسمت</asp:Label>
                                        <div class="col-md-2">
                                            <asp:TextBox runat="server" ID="SuggestedEpisodeDur" CssClass="form-control" Text="0" TextMode="Number" />   
                                        </div>
                                        <div class="pull-right _padding-top">دقیقه</div>
                                    </div>
                                    <div class="form-group">
                                        <div class="center-block text-center">
                                            <asp:Button runat="server" OnClick="ScriptRegisterClick" Text="ذخیره" CssClass="btn btn-success" ID="RegisterButton"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <section id="socialLoginForm">
                                        <div id="socialLoginList">
                                            <h4>راهنما</h4>
                                            <hr />
                                            <div>
                                                <ol>
                                                    <li>خلاصه تفصیلی (سیناپس):  خلاصه ای مفصل از داستان است شامل (( چکیده ی گام گام روایت )) که در آن دارایی ها و امکانات محتوایی و ساختار روایی قابل تشخیص و قابل ارزیابی است و گام به گام پیش می رود، بنابراین نیازمند پارگراف بندی و شماره گذاری دقیق است. سیناپس متنی است حداقل در 15 صفحه ( با فونت 14 و فاصله خطوط 1.5) برای هر قسمت مجموعه.</li>
                                                    <li>پیام (دریک جمله ) : پیام ، چکیده ی معنایی و ایده ی ناظر متن است که باید صرفا در یک جمله (مطابق با تعریف دستوری زبان) درج شود. بنابراین ، شبه جمله ، عبارات فاقد فعل و ادغام چند جمله ، فاقد وجاهت است. برای نمونه:
احترام به والدین ، پیام جمله ای نیست و باید برای نمونه بشود ،احترام به والدین باعث گشایش کارها می شود.
</li>
                                                </ol>
                                            </div>
                                        </div>
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
