using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EfficientDoctor
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["M_Name"] = "";
            Response.Cookies["M_Username"].Value = "";
            Response.Cookies["M_Username"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["M_UsernameEmp"].Value = "";
            Response.Cookies["M_UsernameEmp"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["M_TeacherID"].Value = "";
            Response.Cookies["M_TeacherID"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("login.aspx");
        }
    }
}