using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace filmnameh.Script
{
    public partial class FinalScript : System.Web.UI.Page
    {
        public string ddd = "";
        protected string SuccessMessage
        {
            get;
            private set;
        }
        protected bool CanRemoveExternalLogins
        {
            get;
            private set;
        }
        protected IEnumerable<Dictionary<string, object>> GetScript
        {
            get;
            private set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session[Share.Share.Sessions.user.ToString()] == null)
                Response.Redirect("~/Account/Login");
            SuccessMessage = String.Empty;
            successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);

            IList<string> seg = Request.GetFriendlyUrlSegments();
            var ScriptID = 0;
            if (seg.Count == 1)
                ScriptID = int.Parse(seg[0]);

            if (ScriptID != 0)
            {
                var _script = Share.DB.ExecuteCommand("GetFinalScript",
                    new SqlParameter("ScriptID", ScriptID));
                if (_script.Any())
                    GetScript = _script;

                string upfiles = GetScript.First()["Attachments"].ToString();
                upload_list.DataSource = upfiles.Split(';').Reverse().Skip(1).Reverse().ToArray();
                upload_list.DataBind();

                MyscriptsList.DataSource = GetScript;
                MyscriptsList.DataBind();

                FinalOpinion.Text = GetScript.First()["FinalOpinion"].ToString();
                FinalState.Text = GetScript.First()["FinalState"].ToString();
                
                string dd = GetScript.First()["Type"].ToString();
                if(dd == "1") ddd = "فیلم نامه";
                if(dd == "2") ddd = "طرح";
                if (dd == "3") ddd = "سیناپس";

            }
        }
        protected void RegisterClick(object sender, EventArgs e)
        {
            IList<string> seg = Request.GetFriendlyUrlSegments();
            var ScriptDetailID = 0;
            if (seg.Count == 1)
                ScriptDetailID = int.Parse(seg[0]);
            
            if (ScriptDetailID != 0)
            {
                var login = Share.DB.ExecuteCommand("SetFinalScript",
                    new SqlParameter("FinalUserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())),
                    new SqlParameter("ScriptID", ScriptDetailID),
                    new SqlParameter("FinalState", FinalState.SelectedItem.Text),
                    new SqlParameter("FinalOpinion", FinalOpinion.Text));
                Response.Redirect("~/Script/FInalScripts");
            }
        }
        protected string ConvertDate(string strGerDate)
        {
            PersianCalendar pc = new PersianCalendar();
            if (strGerDate != "")
            {
                var gerdate = Convert.ToDateTime(strGerDate);
                return (pc.GetYear(gerdate).ToString() + "/" + pc.GetMonth(gerdate).ToString() + "/" + pc.GetDayOfMonth(gerdate).ToString());
            }
            else
            {
                return("");
            }
        }
    }
}