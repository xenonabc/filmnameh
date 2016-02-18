using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace filmnameh
{
    public partial class SiteMaster : MasterPage
    {
        protected Dictionary<string, object> LoggedinUser
        {
            get;
            private set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Share.Share.Sessions.user.ToString()] == null)
                LoggedinUser = null;
            else
                LoggedinUser = (Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()];
        }
    }
}