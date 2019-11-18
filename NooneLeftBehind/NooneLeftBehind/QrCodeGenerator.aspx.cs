using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using NooneLeftBehind.Models;

namespace NooneLeftBehind
{
    public partial class QrCodeGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_ClickQR(object sender, EventArgs e)
        {
            //Creates New Instance of a QR
            using (var qrCode = new QRCodeGenerator())
            {
                var qrCodeString = GenerateQrCodeString();
                //Append URL to qrCode
                var dataURL = qrCode.CreateQrCode(qrCodeString, QRCodeGenerator.ECCLevel.Q);
                using (var code = new QRCode(dataURL))
                {
                    //Images qrCode and determines dimmensions
                    var imgBarCode = new System.Web.UI.WebControls.Image
                    {
                        Height = 400,
                        Width = 400
                    };
                    using (Bitmap bitMap = code.GetGraphic(20))
                    {
                        using (MemoryStream ms = new MemoryStream())
                        {
                            bitMap.Save(ms, ImageFormat.Png);
                            var byteImage = ms.ToArray();
                            imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                        }
                        PlaceHolder1.Controls.Add(imgBarCode);
                    }
                }
            }

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

                    db.Locations.Add(location);
                    db.SaveChanges();
                }
                                              
            }
        }

        private string GenerateQrCodeString()
        {
            var codeString = $"{Request.Url.GetLeftPart(UriPartial.Authority)}/Default?";
            var parameters = new List<string>();
            if (!string.IsNullOrWhiteSpace(txtStreetAddress.Text))
                parameters.Add($"StreetAddress={txtStreetAddress.Text}");
            if (!string.IsNullOrWhiteSpace(txtRoom.Text))
                parameters.Add($"Room={txtRoom.Text}");
            if (!string.IsNullOrWhiteSpace(txtFloor.Text))
                parameters.Add($"Floor={txtFloor.Text}");
            if (!string.IsNullOrWhiteSpace(txtCity.Text))
                parameters.Add($"City={txtCity.Text}");
            if (!string.IsNullOrWhiteSpace(txtState.Text))
                parameters.Add($"State={txtState.Text}");
            codeString += string.Join("&", parameters);
            return codeString;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            var requestControls = Form.Controls.OfType<ContentPlaceHolder>().Where(x => x.ID == "mainPlaceHolder").Single().Controls.OfType<TextBox>().Where(x => !x.ReadOnly).ToList();

            foreach (var control in requestControls)
            {
                control.Text = string.Empty;
            }
            lblMessage.Text = String.Empty;
        }
    }
}