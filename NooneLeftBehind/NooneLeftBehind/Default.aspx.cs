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
                txtDate.Text = DateTime.Now.ToShortDateString();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {

        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            var requestControls = Form.Controls.OfType<ContentPlaceHolder>().Where(x => x.ID == "mainPlaceHolder").Single().Controls.OfType<TextBox>().Where(x => !x.ReadOnly).ToList();
            
            foreach (var control in requestControls)
            {
                control.Text = string.Empty;
            }
            ddlTypeOfEmergency.SelectedIndex = 0;
            txtDate.Text = DateTime.Now.ToShortDateString();
        }
    }
}