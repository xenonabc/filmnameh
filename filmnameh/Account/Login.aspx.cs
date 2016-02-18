using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace filmnameh.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected Dictionary<string, object> Getlogin
        {
            get;
            private set;
        }

        protected void LoginClick(object sender, EventArgs e)
        {
            var login = Share.DB.ExecuteCommand("LoginClick", new SqlParameter("UID", Email.Text), new SqlParameter("PWD", Password.Text));
            if(login.Count() > 0)
            {
                Getlogin = login.First();
                if (Getlogin["Active"].ToString() == "1")
                {
                    Session[Share.Share.Sessions.user.ToString()] = login.First();
                    Response.Redirect("~");
                }
                else
                {
                    FailureText.Text = "Your account has been disabled";
                    ErrorMessage.Visible = true;
                }
            }
            else
            {
                FailureText.Text = "Invalid login attempt";
                ErrorMessage.Visible = true;
            }
        }
    }
}