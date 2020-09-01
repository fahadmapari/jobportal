using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text;
namespace ProjectJobPortal
{
    public partial class jobs : System.Web.UI.Page
    {
        String q = "";
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlDataReader dr;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                fillStates();


                q = "select * from jobs order by jobid desc";
                con = new SqlConnection(s);
                con.Open();
                da = new SqlDataAdapter(q, con);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    flashPanel2.Visible = false;
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    q = "";
                    dt.Clear();
                }
                else
                {
                    flashPanel2.Visible = true;
                    q = "";
                    dt.Clear();
                }
            }


        }

        protected void viewbtn_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            String id = (item.FindControl("Label1") as Label).Text;

            Response.Redirect("/job.aspx?id=" + id);
        }

        protected void viewbtntwo_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;

            String id = (item.FindControl("Label1") as Label).Text;

            Response.Redirect("/job.aspx?id=" + id);

        }



        public void fillStates()
        {
            
                
                try
                {
                    q = "select * from States order by StateName asc";
                    con = new SqlConnection(s);
                    con.Open();
                    cmd = new SqlCommand(q, con);
                    dr = cmd.ExecuteReader();


                    while (dr.Read())
                    {
                        locationList.Items.Add(dr["StateName"].ToString());
                    }
                }
                catch (Exception err)
                {
                    Response.Write(err.Message);
                }
                finally
                {
                    /*dr.Close();*/
                    con.Close();
                    q = "";
                }
            
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            String jobLocation = "", jobIndustry= "";
            double jobExperience = 0, jobSalary = 0;
            
            if(locationList.SelectedIndex == 0 
                && industryList.SelectedIndex == 0
                && experienceList.SelectedIndex == 0
                && salaryTxt.Text == "")
            {
                Response.Redirect("/jobs.aspx");
            }
            else
            {
               
                jobExperience = Convert.ToDouble(experienceList.SelectedValue.ToString());
                jobLocation = locationList.SelectedValue.ToString();
                jobIndustry = industryList.SelectedValue.ToString();
                StringBuilder sbcmd = new StringBuilder("select * from jobs where 1 = 1");
                con = new SqlConnection(s);
                cmd = new SqlCommand();
                cmd.Connection = con;
                if (salaryTxt.Text != "")
                {
                    jobSalary = Convert.ToDouble(salaryTxt.Text.ToString());
                    sbcmd.Append(" and salaryfrom >= @jobSalary");
                    SqlParameter param = new SqlParameter("@jobSalary", jobSalary);
                    cmd.Parameters.Add(param);
                }

                if (locationList.SelectedIndex != 0)
                {
                    sbcmd.Append(" and joblocation = @jobLocation");
                    SqlParameter param = new SqlParameter("@jobLocation", jobLocation);
                    cmd.Parameters.Add(param);
                }

                if (industryList.SelectedIndex != 0)
                {
                    sbcmd.Append(" and industry = @jobIndustry");
                    SqlParameter param = new SqlParameter("@jobIndustry", jobIndustry);
                    cmd.Parameters.Add(param);
                }

                if (experienceList.SelectedIndex != 0)
                {
                    sbcmd.Append(" and experience = @jobExperience");
                    SqlParameter param = new SqlParameter("@jobExperience", jobExperience);
                    cmd.Parameters.Add(param);
                }

                sbcmd.Append(" order by jobid desc");
                try
                {
                    cmd.CommandText = sbcmd.ToString();
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    
                    if (dt.Rows.Count > 0)
                    {
                        flashPanel2.Visible = false;
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                        q = "";
                        dt.Clear();
                    }
                    else
                    {
                        flashPanel2.Visible = true;
                        q = "";
                        dt.Clear();
                        Repeater1.DataSource = null;
                        Repeater1.DataBind();
                    }
                }catch(Exception err)
                {
                    Response.Write(err.Message);
                }
            }


        }
    }
}