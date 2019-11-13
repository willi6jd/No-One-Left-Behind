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



            //Creates New Instance of a QR
            QRCodeGenerator qrCode = new QRCodeGenerator();

            //Append URL to qrCode
            QRCodeData dataURL = qrCode.CreateQrCode("http://localhost:52014/QrCodeGenerator?StreetAddress=" + txtStreetAddress + "&Floor=" + txtFloor.Text + "&City=" + txtCity.Text + "&State=" + txtState.Text, QRCodeGenerator.ECCLevel.Q);
            QRCode code = new QRCode(dataURL);

            //Images qrCode and determines dimmensions
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            imgBarCode.Height = 400;
            imgBarCode.Width = 400;
            using (Bitmap bitMap = code.GetGraphic(20))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                }
                PlaceHolder1.Controls.Add(imgBarCode);

            }

            //ignore for now Response.Redirect("QrCode.aspx");


        }
    }
}