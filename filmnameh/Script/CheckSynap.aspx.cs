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
    public partial class CheckSynap : System.Web.UI.Page
    {
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
        protected Dictionary<string, object> GetScript
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
                var _script = Share.DB.ExecuteCommand("GetCheckScript",
                    new SqlParameter("ScriptID", ScriptID));
                if (_script.Any())
                    GetScript = _script.First();
                string upfiles = GetScript["Attachments"].ToString();
                upload_list.DataSource = upfiles.Split(';').Reverse().Skip(1).Reverse().ToArray();
                upload_list.DataBind();
            }
        }
        protected void RegisterClick(object sender, EventArgs e)
        {
            IList<string> seg = Request.GetFriendlyUrlSegments();
            var ScriptID = 0;
            if (seg.Count == 1)
                ScriptID = int.Parse(seg[0]);

            if (ScriptID != 0)
            {
                var login = Share.DB.ExecuteCommand("SetCheckScript",
                    new SqlParameter("ScriptID", ScriptID),
                    new SqlParameter("CheckerUserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())),
                    new SqlParameter("Score1", Score1.SelectedItem.Text),
                    new SqlParameter("Score2", Score2.Text),
                    new SqlParameter("Score3", Score3.Text),
                    new SqlParameter("Score4", Score4.Text),
                    new SqlParameter("Score5", Score5.Text),
                    new SqlParameter("Opinion", Opinion.Text));
                if (login.Count() > 0)
                {
                    Response.Redirect("~/Script/CheckSynapsis");
                }
                else
                {
                    
                }
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
                return ("");
            }
        }
    }
}