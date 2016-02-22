using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace filmnameh.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserClick(object sender, EventArgs e)
        {
            var login = Share.DB.ExecuteCommand("RegisterClick", 
                new SqlParameter("UID", Email.Text), 
                new SqlParameter("PWD", Password.Text),
                new SqlParameter("UserType", int.Parse("0")), 
                new SqlParameter("UserAccess", string.Empty),
                new SqlParameter("Name", Name.Text),
                new SqlParameter("Surname", Surname.Text),
                new SqlParameter("CodeMelli", CodeMelli.Text),
                new SqlParameter("History", History.Text),
                new SqlParameter("Tel", Tel.Text),
                new SqlParameter("Address", Address.Text));
            if (login == null)
            {
                ErrorMessage.Text = "مشکلی پیش آمده است.";
            }
            else if (login.Count() > 0)
            {
                Response.Redirect("~/Account/Login");
            }
        }
    }
}