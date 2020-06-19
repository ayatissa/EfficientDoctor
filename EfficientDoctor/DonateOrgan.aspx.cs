using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EfficientDoctor
{
    public partial class DonateOrgan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            DataView dv = new DataView();
            DataTable dt = new DataTable();
            dv = DS_Organ.Select(DataSourceSelectArguments.Empty) as DataView;
            DS_Organ.InsertParameters["Name"].DefaultValue = txtName.Text;
            DS_Organ.InsertParameters["Mobile"].DefaultValue = txtMobile.Text;
            DS_Organ.InsertParameters["BloodGroup"].DefaultValue = txtBloodGroup.Text;
            DS_Organ.InsertParameters["OrganType"].DefaultValue =comboType.Value.ToString();


            DS_Organ.Insert();
            pop_del0.ShowOnPageLoad = true;
            txtName.Text = "";
            txtMobile.Text = "";
            txtBloodGroup.Text = "";
            comboType.Value = null;
        }
    }
}