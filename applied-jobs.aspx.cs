using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ProjectJobPortal
{
    public partial class applied_jobs : System.Web.UI.Page
    {
        String q = "";
        String applieduser = "";
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"].ToString() != "applicant")
            {
                Response.Redirect("/WebForm1.aspx");
            }


            applieduser = Session["username"].ToString();
            try
            {
                q = "select * from appliedjobs,jobs where appliedjobs.applieduser=@applieduser and jobs.jobid = appliedjobs.jobid order by appliedjobs.jobid desc";
                con = new SqlConnection(s);
                con.Open();
                cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@applieduser", applieduser);
                sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    flashPanel2.Visible = false;
                }
                else
                {
                    flashPanel2.Visible = true;
                }
            }
            catch (Exception err)
            {
                Response.Write(err.Message);
            }
            finally
            {
                con.Close();
                dt.Clear();
            }

        }


        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HyperLink hyperLink3 = (HyperLink)e.Item.FindControl("HyperLink3");
            HyperLink hyperLink1 = (HyperLink)e.Item.FindControl("HyperLink1");
            String joblink = "/job.aspx?id=" + hyperLink3.NavigateUrl.ToString();
            String companylink = "/employer-profile.aspx?user=" + hyperLink1.NavigateUrl.ToString();
            hyperLink3.NavigateUrl = joblink;
            hyperLink1.NavigateUrl = companylink;
        }
    }
}