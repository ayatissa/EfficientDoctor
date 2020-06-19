using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EfficientDoctor
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        #region Events
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataView dv = new DataView();
            DataTable dt = new DataTable();

            if (Convert.ToInt32(cmbGroup.Value) == 1) //Admin
            {

                dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
                if (dv != null && dv.Count != 0)
                {
                    dt = dv.ToTable();
                    Response.Cookies["UserNameA"].Value = txtUserName.Text;
                    Response.Cookies["UserNameA"].Expires = DateTime.Now.AddDays(1);
                    Response.Cookies["UserIdA"].Value = dt.Rows[0][0].ToString();
                    Response.Cookies["UserIdA"].Expires = DateTime.Now.AddDays(1);
                    Response.Redirect("Doctor.aspx");


                }
                else
                {
                    lblError.Visible = true;
                }
            }

            if (Convert.ToInt32(cmbGroup.Value) == 2)//patient
            {
                DataView dv2 = new DataView();
                DataTable dt2 = new DataTable();


                dv2 = SqlDataSource2.Select(DataSourceSelectArguments.Empty) as DataView;
                if (dv2 != null && dv2.Count != 0)
                {
                    dt2 = dv2.ToTable();
                    Response.Cookies["UserNameP"].Value = txtUserName.Text;
                    Response.Cookies["UserNameP"].Expires = DateTime.Now.AddDays(1);
                    Response.Cookies["UserIdP"].Value = dt2.Rows[0][0].ToString();
                    Response.Cookies["UserIdP"].Expires = DateTime.Now.AddDays(1);
                    Response.Redirect("homePage.aspx");
                }
                else
                {
                    lblError.Visible = true;
                }
            }

            if (Convert.ToInt32(cmbGroup.Value) == 3)//doctor
            {
                DataView dv3 = new DataView();
                DataTable dt3 = new DataTable();


                dv3 = SqlDataSource3.Select(DataSourceSelectArguments.Empty) as DataView;
                if (dv3 != null && dv3.Count != 0)
                {
                    dt3 = dv3.ToTable();
                    Response.Cookies["UserNameD"].Value = txtUserName.Text;
                    Response.Cookies["UserNameD"].Expires = DateTime.Now.AddDays(1);
                    Response.Cookies["UserIdD"].Value = dt3.Rows[0][0].ToString();
                    Response.Cookies["UserIdD"].Expires = DateTime.Now.AddDays(1);
                    Response.Redirect("MyDetailsD.aspx");

                }
                else
                {
                    lblError.Visible = true;
                }
            }
        }
        #endregion

        
    }
}