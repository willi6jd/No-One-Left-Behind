using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        public IQueryable<NooneLeftBehind.Models.Request> grdRequests_GetData()
        {
            var db = new AzureNOLBContext();
            var requests = db.Requests.Include(x => x.Location).OrderByDescending(x => x.TimeStamp);
            return requests;
        }
    }
}