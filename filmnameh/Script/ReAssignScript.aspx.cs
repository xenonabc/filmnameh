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
    public partial class ReAssignScript : System.Web.UI.Page
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
                var _script = Share.DB.ExecuteCommand("GetAssignScript", new SqlParameter("ScriptID", ScriptID));
                if (_script.Any())
                    GetScript = _script;
                string upfiles = GetScript.First()["Attachments"].ToString();
                upload_list.DataSource = upfiles.Split(';').Reverse().Skip(1).Reverse().ToArray();
                upload_list.DataBind();
            }

            if (!IsPostBack)
            {
                var users = (List<Dictionary<string, object>>)Share.DB.ExecuteCommand("GetReCheckerUsers", new SqlParameter("ScriptID", ScriptID));

                List<ListItem> result = new List<ListItem>();
                foreach (var u in users)
                {
                    string text = u["Name"].ToString() + " " + u["Surname"].ToString();
                    string value = u["UserID"].ToString();
                    bool selected = false;
                    if (u["ScriptID"].ToString() != "")
                        selected = true;
                    ListItem newListItem = new ListItem();
                    
                    newListItem.Text = text;
                    newListItem.Value = value;
                    newListItem.Selected = selected;
                    result.Add(newListItem);
                    
                }
                CheckerUsers.Items.AddRange(result.ToArray());
            }     
        }
        protected void RegisterClick1(object sender, EventArgs e)
        {
            IList<string> seg = Request.GetFriendlyUrlSegments();
            var ScriptID = 0;
            if (seg.Count == 1)
                ScriptID = int.Parse(seg[0]);

            if (ScriptID != 0)
            {
                List<String> YrStrList = new List<string>();
                foreach (ListItem item in CheckerUsers.Items)
                {
                    if (item.Selected)
                    {
                        YrStrList.Add(item.Value.ToString());
                    }
                    else
                    {
                        
                    }
                }
                String gg = String.Join(";", YrStrList.ToArray());
                //gg = ";" + gg + ";";

                var login = Share.DB.ExecuteCommand("SetReAssignScript",
                    new SqlParameter("CheckerID", gg),
                    new SqlParameter("ScriptID", ScriptID));
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
                return ("");
            }
        }
    }
}