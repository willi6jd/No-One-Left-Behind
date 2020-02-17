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

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Request> grdRequests_GetData()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            var user = manager.FindByName(Context.User.Identity.Name);
            if (user != null)
            {
                if (user.GrantedDispatchAccess)
                {
                    var db = new AzureNOLBContext();
                    var date = DateTime.Now.AddDays(-1);
                    var requests = db.Requests.Include(x => x.Location)
                        .Where(x => !x.Cleared && x.TimeStamp > date)
                        .OrderByDescending(x => x.TimeStamp);
                    //.GroupBy(x => x.LocationID)
                    //.Select(x => x.OrderByDescending(y => y.TimeStamp).FirstOrDefault()).OrderByDescending(x => x.TimeStamp);

                    var coords = requests.ToList().Select(x => new {Lat = x.Latitude, Long = x.Longitude, description = GetDescription(x), type = x.TypeOfEmergency.Replace(" ", "") }).ToList();

                    hdnCoords.Value = Newtonsoft.Json.JsonConvert.SerializeObject(coords);

                    if (!requests.Any())
                        lblNoResults.Text = "No uncleared requests have been submitted in the last 24 hours.";

                    return requests;
                }
                else
                {
                    lblNoResults.Text = "You must request access to view this page. <a href=\"/Account/Manage\">Go to account management to request access.</a>";
                }
            }
            else
            {
                lblNoResults.Text = "You must be logged into to view this page.";
            }
            return null;
        }

        private static string GetDescription(Request x)
        {
            var description = string.Empty;
            description += x.TimeStamp.LocalDateTime.ToShortDateString() + "  " + x.TimeStamp.LocalDateTime.ToShortTimeString();
            var parameters = new List<string>();

            if (!string.IsNullOrWhiteSpace(x.Location.StreetAddress))
                parameters.Add($"{x.Location.StreetAddress}<br>");
            if (!string.IsNullOrWhiteSpace(x.Location.Floor))
                parameters.Add($"Floor {x.Location.Floor}{(string.IsNullOrWhiteSpace(x.Location.RoomNumber) ? "<br>" : ",")}");
            if (!string.IsNullOrWhiteSpace(x.Location.RoomNumber))
                parameters.Add($"Room {x.Location.RoomNumber}<br>");
            if (!string.IsNullOrWhiteSpace(x.Location.City))
                parameters.Add($"{x.Location.City},");
            if (!string.IsNullOrWhiteSpace(x.Location.State))
                parameters.Add($"{x.Location.State}");
            var address = string.Join(" ", parameters);

            description += $"<br><br>{address}";
            description += $"<br><br>Emergency Type: {x.TypeOfEmergency}";
            description += $"<br>Number of People: {x.NumberOfPeople}";
            description += $"<br>Number of Immobile People: {x.NumberOfImmobilePeople}";
            description += $"<br><br>Injuries/Info: {x.InjuriesOrOtherInfo}";
            description += $"<br>Name: {x.FirstName} {x.LastName}";
            description += $"<br>Phone Number: <a href=tel:{x.PhoneNumber}>{x.PhoneNumber}</a>";

            return description;
        }

        protected void grdRequests_RowCommand(object sender, GridViewCommandEventArgs e)
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
                        Response.Redirect("~/DispatchView");
                    }
                }
            }
        }
    }
}