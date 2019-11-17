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
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToShortDateString();
            }

        }

        protected void btnSubmit_ClickQR(object sender, EventArgs e)
        {

            using (var qrCode = new QrCodeGenerator())
            {
                var qrCodeString = GenerateQrCodeString();
                //Append URL to qrCode
                var dataURL = qrCode.CreateQrCode(qrCodeString, QrCodeGenerator.ECCLevel.Q);
                using(var code = new QrCode(dataURL))
                {
                    var imgBarCode = new System.Web.UI.WebControls.Image
                    {
                        Height = 400,
                        Width = 400
                    };
                    using (Bitmap bitMap = code.GetGraphic(20))
                    {
                        using (MemoryStream ms = new MemoryStream())
                        {
                            bitMap.Save(ms, BadImageFormatException.Png);
                            var vyteImage = ms.ToArray();
                            imgBarCode.ImageURL = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                        }
                        PlaceHolder1.Controls.Add(imgBarCode);

                        string GenerateQrCodeString()
                        {
                            var codeString = $"{Request.Url.GetLeftPart(UriPartial.Authority)}/Default?";
                            var parameters = new List<string>();
                            if (!string.IsNullOrWhiteSpace(txtStreetAddress.Text))
                                parameters.Add($"StreetAddress={txtStreetAddress.Text}");
                            if (!string.IsNullOrWhiteSpace(txtRoom.Text))
                                parameters.Add($"StreetAddress={txtRoom.Text}");
                            if (!string.IsNullOrWhiteSpace(txtFloor.Text))
                                parameters.Add($"StreetAddress={txtFloor.Text}");
                            if (!string.IsNullOrWhiteSpace(txtCity.Text))
                                parameters.Add($"StreetAddress={txtCity.Text}");
                            if (!string.IsNullOrWhiteSpace(txtState.Text))
                                parameters.Add($"StreetAddress={txtState.Text}");

                            codeString += string.Join("&", parameters);

                            return codeString;
                        }
                    }
                }
            }

            using (var db = new AzureNOLBContext())
            {
                var location = db.Locations
                    .Where(x => x.StreetAddress == txtStreetAdress.Text.Trim()
                    && x.City == txtCity.Text.Trim()
                    && x.State == txtState.Text.Trim()
                    && x.Floor == txtFloor.Text.Trim()
                    && x.RoomNumber == txtRoom.Text.Trim())
                    .SingleOrDefault();

                if (location == null)
                {
                    location = new location
                    {
                        City = txtCity.Text.Trim(),
                        Floor = txtFloor.Text.Trim(),
                        RoomNumber = txtRoom.Text.Trim(),
                        StreetAddress = txtStreetAddress.Text.Trim(),
                        Stste = txtState.Text.Trim()
                    };
                }
                var newLocation = new Location
                {
                    Location = location
                };

                db.Locations.Add(newLocation);
                db.SaveChanges();

                
            }
        }
    }
}