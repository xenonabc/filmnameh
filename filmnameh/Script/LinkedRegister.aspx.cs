using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;

namespace filmnameh.Script
{
    public partial class LinkedRegister : System.Web.UI.Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Share.Share.Sessions.user.ToString()] == null)
                Response.Redirect("~/Account/Login");
            //SuccessMessage = String.Empty;
            //successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            

            if (!Page.IsPostBack)
            {
                var scripts = (List<Dictionary<string, object>>)Share.DB.ExecuteCommand("GetMyLinkedScripts",
                    new SqlParameter("UserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())));

                var uu = new List<linkedScr>();
                foreach (var u in scripts) uu.Add(new linkedScr { Title = u["Title"].ToString(), ScrID = (decimal)u["ScriptID"] });

                DropDownOldScripts.DataSource = uu;
                DropDownOldScripts.DataTextField = "Title";
                DropDownOldScripts.DataValueField = "ScrID";
                DropDownOldScripts.DataBind();

                DropDownOldScripts.AppendDataBoundItems = true;
                DropDownOldScripts.Items.Insert(0, new ListItem("--", "Please select"));
                DropDownOldScripts.SelectedIndex = 0;

            }
        }

        protected void ScriptRegisterClick(object sender, EventArgs e)
        {

            var login = Share.DB.ExecuteCommand("LinkedScriptRegisterClick",
                new SqlParameter("CreateUserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())),
                new SqlParameter("Title", ScriptTitle.Text),
                new SqlParameter("ScriptGroup", int.Parse(DropDownOldScripts.SelectedItem.Value.ToString())),
                new SqlParameter("Genre", ScriptGenre.SelectedItem.Text),
                new SqlParameter("Form", ScriptForm.SelectedItem.Text),
                new SqlParameter("Subject", ScriptSubject.SelectedItem.Text),
                new SqlParameter("Side1", ScriptSide1.Text),
                new SqlParameter("Side2", ScriptSide2.Text),
                new SqlParameter("Summary", ScriptSummary.Text),
                new SqlParameter("Text", ScriptText.Text),
                new SqlParameter("SuggestedEpisodeNo", int.Parse(SuggestedEpisodeNo.Text)),
                new SqlParameter("SuggestedEpisodeDur", int.Parse(SuggestedEpisodeDur.Text)));
            if (login == null)
            {
                ErrorMessage.Text = "خطایی رخ داده است";
            }
            else
            {
                Response.Redirect("~/Script/MyScripts");
            }
        }
    }
}