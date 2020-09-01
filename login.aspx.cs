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
    public partial class login : System.Web.UI.Page
    {
        String applicantUsername, applicantPassword, employerUsername, employerPassword;
        String q = "";
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                Response.Redirect("/WebForm1.aspx");
            }
            if (Request.QueryString.HasKeys())
            {
                flashPanel.Visible = true;
            }
            else
            {
                flashPanel.Visible = false;
            }

            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //employer login
            employerUsername = employerUsernametxt.Text.ToString().Trim().Replace(" ", "").ToLower();
            employerPassword = employerPasswordtxt.Text.ToString().Trim();

            performEmployerLogin();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //aplicant login
            applicantUsername = applicantUsernametxt.Text.ToString().Trim().Replace(" ", "").ToLower();
            applicantPassword = applicantPasswordtxt.Text.ToString().Trim();

            performApplicantLogin();
        }

        public void performApplicantLogin()
        {
            applicantUsernameErr.Visible = false;
            applicantPasswordErr.Visible = false;

            if (!string.IsNullOrWhiteSpace(applicantUsername) && !string.IsNullOrWhiteSpace(applicantPassword))
            {
                try
                {
                    q = "select * from applicant where username=@username";
                    con = new SqlConnection(s);
                    con.Open();
                    cmd = new SqlCommand(q,con);
                    cmd.Parameters.AddWithValue("@username", applicantUsername);
                    dr = cmd.ExecuteReader();

                    dr.Read();

                    if (dr.HasRows)
                    {
                        byte[] applicantPasswordHash =  (byte[])dr["pass"];
                        PasswordHash hash = new PasswordHash(applicantPasswordHash);
                        if (hash.Verify(applicantPassword))
                        {
                            Session["username"] = applicantUsername;
                            Session["role"] = "applicant";
                            Session["firstname"] = dr["firstname"].ToString();
                            Response.Redirect("/webform1.aspx");
                            dr.Close();
                        }
                        else
                        {
                            dr.Close();
                            applicantPasswordErr.Visible = true;
                            applicantPasswordErr.Text = "incorrect password";
                        }
                       
                    }
                    else
                    {
                        applicantUsernameErr.Visible = true;
                        applicantUsernameErr.Text = "username does not exists";
                        dr.Close();
                    }

                }catch(Exception err)
                {
                    Response.Write(err.Message);
                }
                finally
                {
                    dr.Close();
                    con.Close();
                }
            }
            else
            {
                if (string.IsNullOrWhiteSpace(applicantUsername))
                {
                    applicantUsernameErr.Visible = true;
                    applicantUsernameErr.Text = "please enter username";
                }
                if (string.IsNullOrWhiteSpace(applicantPassword))
                {
                    applicantPasswordErr.Visible = true;
                    applicantPasswordErr.Text = "please enter password";
                }
            }
        }


        public void performEmployerLogin()
        {
            applicantPasswordErr.Visible = false;
            applicantUsernameErr.Visible = false;
            if (!string.IsNullOrWhiteSpace(employerUsername) && !string.IsNullOrWhiteSpace(employerPassword))
            {
                try
                {
                    q = "select * from employer where username=@username";
                    con = new SqlConnection(s);
                    con.Open();
                    cmd = new SqlCommand(q, con);
                    cmd.Parameters.AddWithValue("@username", employerUsername);
                    dr = cmd.ExecuteReader();

                    dr.Read();

                    if (dr.HasRows)
                    {
                        byte[] employerPasswordHash = (byte[])dr["companypassword"];
                        PasswordHash employerhash = new PasswordHash(employerPasswordHash);
                        if (employerhash.Verify(employerPassword))
                        {
                            Session["username"] = dr["username"];
                            Session["role"] = "employer";
                            Session["companyname"] = dr["companyname"];
                            Response.Redirect("/webform1.aspx");
                            
                        }
                        else
                        {
                            employerPasswordErr.Visible = true;
                            employerPasswordErr.Text = "incorrect password";
                         
                        }
                        
                    }
                    else
                    {
                        employerUsernameErr.Visible = true;
                        employerUsernameErr.Text = "username does not exists";
                        dr.Close();
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
            else
            {
                if (string.IsNullOrWhiteSpace(employerUsername))
                {
                    employerUsernameErr.Visible = true;
                    employerUsernameErr.Text = "please enter username";
                }
                if (string.IsNullOrWhiteSpace(employerPassword))
                {
                    employerPasswordErr.Visible = true;
                    employerPasswordErr.Text = "please enter password";
                }
            }
        }
    }
}