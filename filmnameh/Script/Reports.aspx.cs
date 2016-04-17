using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;
using System.IO;
using System.Globalization;

namespace filmnameh.Script
{
    public partial class Reports : System.Web.UI.Page
    {
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Share.Share.Sessions.user.ToString()] == null)
                Response.Redirect("~/Account/Login");
        }

        protected void ScriptRegisterClick(object sender, EventArgs e)
        {
            IList<string> seg = Request.GetFriendlyUrlSegments();
            var ScriptIDE = 0;
            if (seg.Count == 1)
            {
                ScriptIDE = int.Parse(seg[0]);
            }

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

            var login = Share.DB.ExecuteCommand("ScriptRegisterClick",
                new SqlParameter("CreateUserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())),
                new SqlParameter("Title", ScriptTitle.Text),
                new SqlParameter("Author", Author.Text),
                new SqlParameter("Provider", Provider.Text),
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
                new SqlParameter("Type", 1)); 

            if (login == null)
            {
                ErrorMessage.Text = "خطایی رخ داده است";
            }
            else
            {
                Response.Redirect("~/Script/MyScripts");
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