using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectJobPortal
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            if (Session["role"] == null)
            {
                guestNavPanel.Visible = true;
                employerNavPanel.Visible = false;

            }
            else
            {
                guestNavPanel.Visible = false;
                if(Session["role"].ToString() == "employer")
                {
                    employerNavPanel.Visible = true;
                    navEmployerProfile.Text = "Hi, " + Session["companyname"].ToString();
                    navEmployerProfile.NavigateUrl = "/employer-profile.aspx?user=" + Session["username"].ToString();
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                }
                if (Session["role"].ToString() == "applicant")
                {
                    navApplicantPanel.Visible = true;
                    navApplicantProfile.Text = "Hi, " + Session["firstname"].ToString();
                    navApplicantProfile.NavigateUrl = "/profile.aspx?user=" + Session["username"].ToString();
                    Panel1.Visible = true;
                    Panel2.Visible = false;
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/WebForm1.aspx");
        }

       
    }
}