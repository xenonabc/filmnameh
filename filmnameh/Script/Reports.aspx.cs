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

namespace filmnameh.Script
{
    public partial class Reports : System.Web.UI.Page
    {
        protected Dictionary<string, object> GetMyScript
        {
            get;
            private set;
        }
        protected Dictionary<string, object> GetScriptID
        {
            get;
            private set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Share.Share.Sessions.user.ToString()] == null)
                Response.Redirect("~/Account/Login");
            IList<string> seg = Request.GetFriendlyUrlSegments();
            var par = "";
            if (seg.Count == 1)
            {
                par = seg[0];
            }
            
            string[] dates = par.Split('_');

            if (!Page.IsPostBack)
            {
                if (par != "")
                {
                    FromDate.Text = dates[0];
                    ToDate.Text = dates[1];
                    var aaa = ConvertJalDate2Ger(dates[0]);
                    var GetReport = Share.DB.ExecuteCommand("GetReport", new SqlParameter("FromDate", ConvertJalDate2Ger(dates[0])), new SqlParameter("ToDate", ConvertJalDate2Ger(dates[1])));
                    ReportList.DataSource = GetReport;
                    ReportList.DataBind();
                }
                
            }
        }

        protected void DoReportButtonClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Script/Reports/" + FromDate.Text + "_" + ToDate.Text);
        }
        protected string ConvertDate(string strGerDate)
        {
            PersianCalendar pc = new PersianCalendar();
            if (strGerDate != "")
            {
                var gerdate = Convert.ToDateTime(strGerDate);
                return (pc.GetYear(gerdate).ToString() + "/" + pc.GetMonth(gerdate).ToString() + "/" + pc.GetDayOfMonth(gerdate).ToString());
            }
            else
            {
                return ("");
            }
        }
        protected string ConvertJalDate2Ger(string strJalDate)
        {
            PersianCalendar pc = new PersianCalendar();
            if (strJalDate != "")
            {
                var Jaldate = Convert.ToDateTime(strJalDate);
                return (pc.ToDateTime(Jaldate.Year, Jaldate.Month, Jaldate.Day, 0, 0, 0, 0 ).ToString());
            }
            else
            {
                return ("");
            }
        }
    }
}