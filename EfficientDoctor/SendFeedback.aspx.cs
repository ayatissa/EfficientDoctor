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
    public partial class SendFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            DataView dv = new DataView();
            DataTable dt = new DataTable();


            dv = DS_Feedback.Select(DataSourceSelectArguments.Empty) as DataView;
            //DS_Feedback.InsertParameters["CusID"].DefaultValue = Response.Cookies["UserId"].Value;
            DS_Feedback.InsertParameters["Feed"].DefaultValue = ASPxMemo1.Text;
            DS_Feedback.InsertParameters["Date"].DefaultValue = DateTime.Now.ToString();

            DS_Feedback.Insert();
            pop_del0.ShowOnPageLoad=true;
            ASPxMemo1.Text = "";
        }
    }
}