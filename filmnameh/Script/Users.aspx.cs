using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;
using System.Web.Configuration;

namespace filmnameh.Script
{
    public partial class Users : System.Web.UI.Page
    {
        public int totalPages = 0;
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
        protected Dictionary<string, object> totalP
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
            /******************* <PAGINATION>  *******************/
            var pageSize = int.Parse(WebConfigurationManager.AppSettings["RowNumber"].ToString());
            var count = 0;
            var page = 1;
            IList<string> seg = Request.GetFriendlyUrlSegments();
            if (seg.Count == 1)
                page = int.Parse(seg[0]);
            var offset = (page - 1) * pageSize;
            var TP = Share.DB.ExecuteCommand("GetTotalRowsNum", new SqlParameter("TableName", "Users"), new SqlParameter("WhereClause", " WHERE Users.UserType = 0"));
            totalP = TP.First();
            count = int.Parse(totalP["num"].ToString());
            totalPages = (int)Math.Ceiling((double)count / pageSize);
            /******************* </PAGINATION> *******************/
            var GetUsers = Share.DB.ExecuteCommand("GetUsers", new SqlParameter("offset", offset), new SqlParameter("pageSize", pageSize));
            UsersList.DataSource = GetUsers;
            UsersList.DataBind();
        }
    }
}