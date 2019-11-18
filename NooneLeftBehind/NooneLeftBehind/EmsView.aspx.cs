using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NooneLeftBehind.Models;

namespace NooneLeftBehind
{
    public partial class EmsView : System.Web.UI.Page
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
            var db = new AzureNOLBContext();
            var date = DateTime.Now.AddDays(-1);
            var requests = db.Requests.Include(x => x.Location)
                .Where(x => !x.Cleared && x.TimeStamp > date)
                .GroupBy(x => x.LocationID)
                .Select(x => x.OrderByDescending(y => y.TimeStamp).FirstOrDefault()).OrderByDescending(x => x.TimeStamp);
            return requests;
        }

        protected void grdRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ClearRequest")
            {
                var id = int.Parse(e.CommandArgument.ToString());

                Request item = null;
                using (var db = new AzureNOLBContext())
                {
                    item = db.Requests.Where(x => x.RequestID == id).SingleOrDefault();

                    if (item == null)
                    {                        
                        return;
                    }
                    else
                    {
                        item.Cleared = true;
                        db.SaveChanges();
                        Response.Redirect("~/EMSView");
                    }
                }
            }
        }
    }
}