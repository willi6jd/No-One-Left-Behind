using NooneLeftBehind.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NooneLeftBehind
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
                Page.MaintainScrollPositionOnPostBack = true;

            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString();
            }

            if (Request.QueryString["StreetAddress"] != null)
                txtStreetAddress.Text = Request.QueryString["StreetAddress"];
            if (Request.QueryString["Room"] != null)
                txtRoom.Text = Request.QueryString["Room"];
            if (Request.QueryString["Floor"] != null)
                txtFloor.Text = Request.QueryString["Floor"];
            if (Request.QueryString["City"] != null)
                txtCity.Text = Request.QueryString["City"];
            if (Request.QueryString["State"] != null)
                txtState.Text = Request.QueryString["State"];
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            using (var db = new AzureNOLBContext())
            {
                var location = db.Locations
                    .Where(x => x.StreetAddress == txtStreetAddress.Text.Trim()
                    && x.City == txtCity.Text.Trim()
                    && x.State == txtState.Text.Trim()
                    && x.Floor == txtFloor.Text.Trim()
                    && x.RoomNumber == txtRoom.Text.Trim())
                    .SingleOrDefault();

                if (location == null)
                {
                    location = new Location
                    {
                        City = txtCity.Text.Trim(),
                        Floor = txtFloor.Text.Trim(),
                        RoomNumber = txtRoom.Text.Trim(),
                        StreetAddress = txtStreetAddress.Text.Trim(),
                        State = txtState.Text.Trim()
                    };
                }

                var newRequest = new Request
                {
                    TimeStamp = Convert.ToDateTime(txtDate.Text),
                    TypeOfEmergency = ddlTypeOfEmergency.SelectedValue,
                    NumberOfPeople = int.TryParse(txtNumOfPeople.Text, out int numOfPeople) ? numOfPeople : 0,
                    NumberOfImmobilePeople = int.TryParse(txtNumOfImmobile.Text, out int numOfImmobile) ? numOfImmobile : 0,
                    InjuriesOrOtherInfo = txtInjuriesOrSpecialInfo.Text,
                    AccessibleOutsideWindow = cbOutsideWindow.Checked,
                    FirstName = txtFirstName.Text,
                    LastName = txtLastName.Text,
                    PhoneNumber = txtPhone.Text,
                    Latitude = decimal.TryParse(txtLatitude.Text, out decimal latitude) ? latitude : 0.0M,
                    Longitude = decimal.TryParse(txtLongitude.Text, out decimal longitude) ? longitude : 0.0M,
                    Location = location
                };

                db.Requests.Add(newRequest);
                db.SaveChanges();

                lblMessage.Text = "Request Successfully Submitted.";
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            var requestControls = Form.Controls.OfType<ContentPlaceHolder>().Where(x => x.ID == "mainPlaceHolder").Single().Controls.OfType<TextBox>().Where(x => !x.ReadOnly).ToList();
            
            foreach (var control in requestControls)
            {
                control.Text = string.Empty;
            }
            ddlTypeOfEmergency.SelectedIndex = 0;
            txtDate.Text = DateTime.Now.ToString();
            lblMessage.Text = String.Empty;
        }
    }
}