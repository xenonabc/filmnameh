using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;
using System.IO;
using System.Globalization;

namespace filmnameh
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IList<string> seg = Request.GetFriendlyUrlSegments();
                if (seg.Count == 1)
                {
                    if(seg[0].ToString() == "success")
                        ErrorMessage.Text = "پیام شما با موفقیت ثبت گردید.";
                }
        }
        protected void ContactRegisterClick(object sender, EventArgs e)
        {
            var login = Share.DB.ExecuteCommand("RegisterContact",
                    new SqlParameter("ContactName", ContactName.Text),
                    new SqlParameter("ContactEmail", ContactEmail.Text),
                    new SqlParameter("ContactSubject", ContactSubject.Text),
                    new SqlParameter("ContactText", ContactText.Text));

            if (login == null)
            {
                ErrorMessage.Text = "An Error Has Occurred";
            }
            else
            {
                Response.Redirect("~/Contact/success");
            }
        }
    }
}