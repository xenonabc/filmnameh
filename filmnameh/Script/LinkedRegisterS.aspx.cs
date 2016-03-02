using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;
using System.Globalization;

namespace filmnameh.Script
{
    public partial class LinkedRegisterS : System.Web.UI.Page
    {
        public class linkedScr
        {
            public string Title { get; set; }
            public decimal ScrID { get; set; }
        }
        protected bool editFlag
        {
            get;
            private set;
        }
        protected Dictionary<string, object> GetMyScript
        {
            get;
            private set;
        }
        protected Dictionary<string, object> GetScriptID
        {
            get;
            private set;
        }
        int ScriptGroupID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Share.Share.Sessions.user.ToString()] == null)
                Response.Redirect("~/Account/Login");
            //SuccessMessage = String.Empty;
            //successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            

            //if (!Page.IsPostBack)
            //{
                IList<string> seg = Request.GetFriendlyUrlSegments();
                if (seg.Count == 1)
                    ScriptGroupID = int.Parse(seg[0]);
                if (ScriptGroupID != 0)
                {
                    var _script = Share.DB.ExecuteCommand("GetMyScript",
                        new SqlParameter("UserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())),
                        new SqlParameter("ScriptID", ScriptGroupID));
                    if (_script.Any())
                        GetMyScript = _script.First();

                    ScriptTitle.Text = GetMyScript["Title"].ToString();
                    Author.Text = GetMyScript["Author"].ToString();
                    Provider.Text = GetMyScript["Provider"].ToString();
                    ScriptGenre.Text = GetMyScript["Genre"].ToString();
                    ScriptForm.Text = GetMyScript["Form"].ToString();
                    ScriptSubject.Text = GetMyScript["Subject"].ToString();
                    ScriptSide1.Text = GetMyScript["Side1"].ToString();
                    ScriptSide2.Text = GetMyScript["Side2"].ToString();
                    ScriptSummary.Text = GetMyScript["Summary"].ToString();
                    ScriptText.Text = GetMyScript["Text"].ToString();
                    SuggestedEpisodeNo.Text = GetMyScript["SuggestedEpisodeNo"].ToString();
                    SuggestedEpisodeDur.Text = GetMyScript["SuggestedEpisodeDur"].ToString();
                }

            //}
        }

        protected void ScriptRegisterClick(object sender, EventArgs e)
        {

            var ScriptID = Share.DB.ExecuteCommand("GetScriptID");
            GetScriptID = ScriptID.First();

            var nyear = ConvertDate(DateTime.Now.ToString()).ToString().Substring(2, 2);
            var oyear = "00000";
            if (GetScriptID["ID"].ToString().Length > 0)
            {
                oyear = GetScriptID["ID"].ToString().Substring(0, 2);
            }
            int newID;
            if (oyear == nyear)
            {
                newID = int.Parse(GetScriptID["ID"].ToString()) + 1;
            }
            else
            {
                newID = int.Parse(nyear + "00001");
            }

            var login = Share.DB.ExecuteCommand("LinkedScriptRegisterClickS",
                new SqlParameter("CreateUserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())),
                new SqlParameter("Title", ScriptTitle.Text),
                new SqlParameter("Author", Author.Text),
                new SqlParameter("Provider", Provider.Text),
                new SqlParameter("ScriptGroup", ScriptGroupID),
                new SqlParameter("Genre", ScriptGenre.SelectedItem.Text),
                new SqlParameter("Form", ScriptForm.SelectedItem.Text),
                new SqlParameter("Subject", ScriptSubject.SelectedItem.Text),
                new SqlParameter("Side1", ScriptSide1.Text),
                new SqlParameter("Side2", ScriptSide2.Text),
                new SqlParameter("Summary", ScriptSummary.Text),
                new SqlParameter("Text", ScriptText.Text),
                new SqlParameter("SuggestedEpisodeNo", int.Parse(SuggestedEpisodeNo.Text)),
                new SqlParameter("SuggestedEpisodeDur", int.Parse(SuggestedEpisodeDur.Text)),
                new SqlParameter("ID", newID.ToString()),
                new SqlParameter("Attachments", txtFiles.Text),
                new SqlParameter("Type", 3));
            if (login == null)
            {
                ErrorMessage.Text = "خطایی رخ داده است";
            }
            else
            {
                Response.Redirect("~/Script/MySynapsis");
            }
        }
        protected string ConvertDate(string strGerDate)
        {
            PersianCalendar pc = new PersianCalendar();
            if (strGerDate != "")
            {
                var gerdate = Convert.ToDateTime(strGerDate);
                return (pc.GetYear(gerdate).ToString());
            }
            else
            {
                return ("");
            }
        }
    }
}