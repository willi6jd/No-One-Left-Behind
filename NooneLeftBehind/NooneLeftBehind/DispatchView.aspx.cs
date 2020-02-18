using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using NooneLeftBehind.Models;

namespace NooneLeftBehind
{
    public partial class DispatchView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetRequestData();
            if (!IsPostBack)
            {
                Session["HasShownData"] = false;
            }
        }

        public void GetRequestData()
        {
            if (LoggedInPanel.CssClass.Contains("no-display"))
                return;

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            var user = manager.FindByName(Context.User.Identity.Name);
            if (user != null)
            {
                if (user.GrantedDispatchAccess)
                {
                    if (IsPostBack)
                    {
                        var topLimit = Convert.ToDecimal(hdnMapTopRightLat.Value);
                        var rightLimit = Convert.ToDecimal(hdnMapTopRightLong.Value);
                        var bottomLimit = Convert.ToDecimal(hdnMapBottomLeftLat.Value);
                        var leftLimit = Convert.ToDecimal(hdnMapBottomLeftLong.Value);
                        var db = new AzureNOLBContext();
                        var date = DateTime.Now.AddDays(-1);
                        var requests = db.Requests.Include(x => x.Location)
                            .Where(x => !x.Cleared && x.TimeStamp > date)
                            .Where(x => x.Latitude <= topLimit && x.Latitude >= bottomLimit &&
                                        x.Longitude >= leftLimit && x.Longitude <= rightLimit)
                            .OrderByDescending(x => x.TimeStamp).ToList();
                        //.GroupBy(x => x.LocationID)
                        //.Select(x => x.OrderByDescending(y => y.TimeStamp).FirstOrDefault()).OrderByDescending(x => x.TimeStamp);
                        var requestIds = requests.Select(x => x.RequestID)
                            .ToList();
                        var lastRequestIds = new List<int>();
                        if (this.Session["LastRequests"] != null)
                            lastRequestIds = ((List<Request>) this.Session["LastRequests"]).Select(x => x.RequestID)
                                .ToList();
                        var hasShownData = (bool)(Session["HasShownData"] ?? false);
                        if (!ScrambledEquals(lastRequestIds, requestIds) || lastRequestIds.Count == 0 || !hasShownData)
                        {
                            this.Session["LastRequests"] = requests;
                            RequestDataList.DataSource = requests;
                            RequestDataList.DataBind();
                            var coords = requests.Select(x => new
                            {
                                Lat = x.Latitude, Long = x.Longitude, description = x.GetDescription()
                            }).ToList();

                            hdnCoords.Value = Newtonsoft.Json.JsonConvert.SerializeObject(coords);
                            ScriptManager.RegisterStartupScript(this, GetType(), "showLocations", "showLocations();",
                                true);
                            Session["HasShownData"] = true;
                            if (!requests.Any())
                                lblMessage.Text = "No uncleared requests have been submitted in the last 24 hours.";
                        }
                    }

                    NoAccessPanel.CssClass = " no-display";
                    LoggedInPanel.CssClass = "";
                }
                else
                {
                    NoAccessPanel.CssClass = "";
                    LoggedInPanel.CssClass = "no-display";
                    lblNoAccess.Text = "You must request access to view this page. <a href=\"/Account/Manage\">Go to account management to request access.</a>";
                }
            }
            else
            {
                NoAccessPanel.CssClass = "";
                LoggedInPanel.CssClass = "no-display";
                lblNoAccess.Text = "You must be logged into to view this page.";
            }
        }

        public static bool ScrambledEquals<T>(IEnumerable<T> list1, IEnumerable<T> list2)
        {
            var cnt = new Dictionary<T, int>();
            foreach (T s in list1)
            {
                if (cnt.ContainsKey(s))
                {
                    cnt[s]++;
                }
                else
                {
                    cnt.Add(s, 1);
                }
            }
            foreach (T s in list2)
            {
                if (cnt.ContainsKey(s))
                {
                    cnt[s]--;
                }
                else
                {
                    return false;
                }
            }
            return cnt.Values.All(c => c == 0);
        }

        protected void RefreshTimer_OnTick(object sender, EventArgs e)
        {
            GetRequestData();
        }

        protected void RequestDataList_OnItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ClearRequest")
            {
                var id = int.Parse(e.CommandArgument.ToString());

                using (var db = new AzureNOLBContext())
                {
                    var item = db.Requests.SingleOrDefault(x => x.RequestID == id);

                    if (item == null)
                    {
                        return;
                    }
                    else
                    {
                        item.Cleared = true;
                        db.SaveChanges();
                    }
                }
            }
        }
    }
}