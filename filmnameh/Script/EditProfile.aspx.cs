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
    public partial class EditProfile : System.Web.UI.Page
    {
        protected Dictionary<string, object> GetMyScript
        {
            get;
            private set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Share.Share.Sessions.user.ToString()] == null)
                Response.Redirect("~/Account/Login");

            if (!Page.IsPostBack)
            {

                var _script = Share.DB.ExecuteCommand("GetUser", new SqlParameter("UserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())));
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

            }
        }

        protected void ScriptRegisterClick(object sender, EventArgs e)
        {

            var login = Share.DB.ExecuteCommand("UserEdit",
                new SqlParameter("UserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())),
                new SqlParameter("UID", UserName.Text),
                new SqlParameter("PWD", Passwd.Text),
                new SqlParameter("Name", Name.Text),
                new SqlParameter("Surname", Surname.Text),
                new SqlParameter("CodeMelli", CodeMelli.Text),
                new SqlParameter("Tel", Telephone.Text),
                new SqlParameter("Address", Address.Text),
                new SqlParameter("History", History.Text)); 
            if (login == null)
            {
                ErrorMessage.Text = "خطایی رخ داده است";
            }
            else
            {
                Response.Redirect("~");
            }

        }
    }
}