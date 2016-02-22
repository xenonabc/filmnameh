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
    public partial class RegisterUser : System.Web.UI.Page
    {
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
                IList<string> seg = Request.GetFriendlyUrlSegments();
                var UserID = 0;
                if (seg.Count == 1)
                    UserID = int.Parse(seg[0]);

                if (UserID != 0)
                {
                    var _script = Share.DB.ExecuteCommand("GetUser", new SqlParameter("UserID", UserID));
                    if (_script.Any())
                        GetMyScript = _script.First();

                    UserName.Text = GetMyScript["UID"].ToString();
                    Passwd.Text = GetMyScript["PWD"].ToString();
                    Name.Text = GetMyScript["Name"].ToString();
                    Surname.Text = GetMyScript["Surname"].ToString();
                    CodeMelli.Text = GetMyScript["CodeMelli"].ToString();
                    Telephone.Text = GetMyScript["Tel"].ToString();
                    Address.Text = GetMyScript["Address"].ToString();
                    History.Text = GetMyScript["History"].ToString();
                    Active.ClearSelection();
                    Active.Items.FindByValue(GetMyScript["Active"].ToString()).Selected = true;
                }
            }
        }

        protected void ScriptRegisterClick(object sender, EventArgs e)
        {
            var editFlag = false;
            IList<string> seg = Request.GetFriendlyUrlSegments();
            var UserIDE = 0;
            if (seg.Count == 1)
            {
                UserIDE = int.Parse(seg[0]);
                editFlag = true;
            }

            if (editFlag)
            {
                var login = Share.DB.ExecuteCommand("UserEdit",
                   new SqlParameter("UserID", UserIDE),
                   new SqlParameter("UID", UserName.Text),
                   new SqlParameter("PWD", Passwd.Text),
                   new SqlParameter("Name", Name.Text),
                   new SqlParameter("Surname", Surname.Text),
                   new SqlParameter("CodeMelli", CodeMelli.Text),
                   new SqlParameter("Tel", Telephone.Text),
                   new SqlParameter("Address", Address.Text),
                   new SqlParameter("History", History.Text),
                   new SqlParameter("Active", Active.SelectedItem.Value)); 
                if (login == null)
                {
                    ErrorMessage.Text = "An Error Has Occurred";
                }
                else
                {
                    Response.Redirect("~/Script/Experts");
                }
            }else{
                var login = Share.DB.ExecuteCommand("UserAdd",
                   new SqlParameter("UID", UserName.Text),
                   new SqlParameter("PWD", Passwd.Text),
                   new SqlParameter("Name", Name.Text),
                   new SqlParameter("Surname", Surname.Text),
                   new SqlParameter("CodeMelli", CodeMelli.Text),
                   new SqlParameter("Tel", Telephone.Text),
                   new SqlParameter("Address", Address.Text),
                   new SqlParameter("History", History.Text),
                   new SqlParameter("Active", Active.SelectedItem.Value));
                if (login == null)
                {
                    ErrorMessage.Text = "An Error Has Occurred";
                }
                else
                {
                    Response.Redirect("~/Script/Experts");
                }
            }
        }
    }
}