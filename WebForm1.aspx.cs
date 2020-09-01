using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectJobPortal
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"] != null)
            {
                if(Session["role"].ToString() == "applicant")
                {
                    Response.Redirect("/jobs.aspx");
                }
                else
                {
                    Response.Redirect("/post-job.aspx");
                }
            }
        }
    }
}