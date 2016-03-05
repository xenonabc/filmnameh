using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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
            {
                LoggedinUser = (Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()];

                /****************** HAMID /******************/
                IList<string> seg = Request.Url.Segments;
                var curPage = "";
                int curUserAL = 0;
                bool has = true;
                if (seg.Count >= 3)
                {
                    if (seg[1].ToString() == "Script/")
                        curPage = seg[2].ToString();


                    Dictionary<int, string[]> access = new Dictionary<int, string[]>();
                    string[] Ousers = { "LinkedRegister", "LinkedRegisterP", "LinkedRegisterS", "MyPlans", "MyScript", "MyScripts", "MySynapsis", "Register", "RegisterP", "RegisterS" };
                    string[] Eusers = { "CheckPlan", "CheckPlans", "CheckScript", "CheckScripts", "CheckSynap", "CheckSynapsis", "ViewScript" };
                    access.Add(0, Ousers);
                    access.Add(1, Eusers);

                    //string uuu = ((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString();
                    var _userAL = Share.DB.ExecuteCommand("GetUserAccessLevel",
                                new SqlParameter("UserID", int.Parse(((Dictionary<string, object>)Session[Share.Share.Sessions.user.ToString()])["UserID"].ToString())));
                    if (_userAL != null)
                    {
                        curUserAL = int.Parse(_userAL.First()["UserType"].ToString());
                    }
                    if (curUserAL == 0)
                    {
                        has = Ousers.Contains(curPage.Split('/')[0]);
                    }else if(curUserAL == 1){
                        has = Eusers.Contains(curPage.Split('/')[0]);
                    }
                    if (!has)
                    {
                        Response.Redirect("~");
                    }
                }
            }
        }
    }
}