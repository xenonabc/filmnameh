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
    public partial class MyScript : System.Web.UI.Page
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
        protected Dictionary<string, object> GetMyScript
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
                var _script = Share.DB.ExecuteCommand("GetMyScript",
                    new SqlParameter("UserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())),
                    new SqlParameter("ScriptID", ScriptID));
                if (_script.Any())
                    GetMyScript = _script.First();
                string upfiles = GetMyScript["Attachments"].ToString();
                upload_list.DataSource = upfiles.Split(';').Reverse().Skip(1).Reverse().ToArray();
                upload_list.DataBind();
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