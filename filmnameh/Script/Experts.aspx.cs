using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace filmnameh.Script
{
    public partial class Experts : System.Web.UI.Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Share.Share.Sessions.user.ToString()] == null)
                Response.Redirect("~/Account/Login");
            SuccessMessage = String.Empty;
            successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);

            UsersList.DataSource = GetUsers();
            UsersList.DataBind();
        }
        public IEnumerable<Dictionary<string, object>> GetUsers()
        {
            var myScripts = Share.DB.ExecuteCommand("GetExperts");
            return myScripts;
        }
    }
}