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
    public partial class post_job : System.Web.UI.Page
    {
        String jobtitle, aboutjob, industry, location,postOwner,postdate,companyname;
        int? experience, salarayFrom, salaryTo;
        String q = "";
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
       
            
            if (Session["role"] != null)
            {
                if(Session["role"].ToString() != "employer")
                {
                    Response.Redirect("/WebForm1.aspx");
                }
                
            }

            if(Session["role"] == null)
            {
                Response.Redirect("/WebForm1.aspx");
            }

            postOwner = Session["username"].ToString();
            postdate = DateTime.Now.ToString("MM/dd/yyyy");

            if (!Page.IsPostBack)
            {
                titleJob.Focus();
                try
                {
                    q = "select * from States order by StateName asc";
                    con = new SqlConnection(s);
                    con.Open();
                    cmd = new SqlCommand(q, con);
                    dr = cmd.ExecuteReader();


                    while (dr.Read())
                    {
                        jobLocation.Items.Add(dr["StateName"].ToString());
                    }
                }
                catch (Exception err)
                {
                    Response.Write(err.Message);
                }
                finally
                {
                    dr.Close();
                    con.Close();
                }
            }
        }

        protected void aboutJob_TextChanged(object sender, EventArgs e)
        {

        }

        protected void postJobBtn_Click(object sender, EventArgs e)
        {
            jobTitleErr.Visible = false;
            jobAboutErr.Visible = false;
            jobSalaryErr.Visible = false;

            try
            {
                jobtitle = titleJob.Text.ToString();
                aboutjob = jobAbout.Text.ToString();
                experience = Convert.ToInt32(experienceYears.SelectedValue.ToString());
                salarayFrom = Convert.ToInt32(salaryOne.Text.ToString());
                salaryTo = Convert.ToInt32(salaryTwo.Text.ToString());
                location = jobLocation.SelectedValue.ToString();
                companyname = Session["companyname"].ToString();
            }catch(Exception err)
            {
                
            }

            postjob();
        }

        public void postjob()
        {

            if (!string.IsNullOrWhiteSpace(jobtitle) 
                && !string.IsNullOrWhiteSpace(aboutjob)
               
                && !(salarayFrom < 0)
                && !(salaryTo < 0)
                && !(salarayFrom > salaryTo)
                && salarayFrom.HasValue
                && salaryTo.HasValue
                )
            {

                            
                if (jobIndustry.SelectedIndex == 0)
                {
                    industry = "others";
                }
                else
                {
                    industry = jobIndustry.SelectedValue.ToString();
                }

                try
                {
                    q = "insert into jobs values(@jobtitle,@salaryFrom,@salaryTo,@experience, @industry, @joblocation, @aboutjob, @postdate, @postedby,@companyname)";
                    con = new SqlConnection(s);
                    con.Open();
                    cmd = new SqlCommand(q, con);
                    cmd.Parameters.AddWithValue("@jobtitle", jobtitle);
                    cmd.Parameters.AddWithValue("@salaryFrom", salarayFrom);
                    cmd.Parameters.AddWithValue("@salaryTo", salaryTo);
                    cmd.Parameters.AddWithValue("@experience", experience);
                    cmd.Parameters.AddWithValue("@industry", industry);
                    cmd.Parameters.AddWithValue("@joblocation", location);
                    cmd.Parameters.AddWithValue("@aboutjob", aboutjob);
                    cmd.Parameters.AddWithValue("@postdate", postdate);
                    cmd.Parameters.AddWithValue("@postedby", postOwner);
                    cmd.Parameters.AddWithValue("@companyname", companyname);
                    cmd.ExecuteNonQuery();

                    flashPanel.Visible = true;
                    titleJob.Focus();
                    titleJob.Text = "";
                    salaryOne.Text = "";
                    salaryTwo.Text = "";
                    jobAbout.Text = "";
                    experienceYears.SelectedIndex = 0;
                    jobIndustry.SelectedIndex = 0;
                    jobLocation.SelectedIndex = 0;
                }
                catch (Exception err)
                {
                    Response.Write(err.Message);
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
               
                if (string.IsNullOrWhiteSpace(jobtitle))
                {
                    jobTitleErr.Visible = true;
                    jobTitleErr.Text = "job title is required";
                }
                if (string.IsNullOrWhiteSpace(aboutjob))
                {
                    jobAboutErr.Visible = true;
                    jobAboutErr.Text = "job description is required";
                }
                if (string.IsNullOrWhiteSpace(industry))
                {
                    jobIndustry.Visible = true;
                    jobIndustry.Text = "industry is required";
                }
                if (salarayFrom > salaryTo)
                {
                    jobSalaryErr.Visible = true;
                    jobSalaryErr.Text = "starting salary can't be higher than ending";
                }
                if (salarayFrom.HasValue == false || salaryTo.HasValue == false)
                {
                    jobSalaryErr.Visible = true;
                    jobSalaryErr.Text = "salary is required";
                }

            }
        }
    }
}