using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ProjectJobPortal
{
    public partial class applicant_join : System.Web.UI.Page
    {
        String username, firstName, lastName, password, email, gender;
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
            if (!Page.IsPostBack)
            {
                usernameSignup.Focus();
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {

            // storing data from fields to data members
            username = usernameSignup.Text.ToString().Trim().Replace(" ", "").ToLower();
            firstName = firstNameSignup.Text.ToString().Trim();
            lastName = lastNameSignup.Text.ToString().Trim();
            password = passwordSignup.Text.ToString().Trim();
            email = emailSignup.Text.ToString().Trim();
            gender = genderSignup.SelectedValue.ToString();

            usernameErr.Visible = false;
            passwordErr.Visible = false;
            firstNameErr.Visible = false;
            lastNameErr.Visible = false;
            emailErr.Visible = false;
            genderErr.Visible = false;
            resumeErr.Visible = false;
            passwordErr.Visible = false;

            // calling function for signup
            performApplicantSignUp();
        }

        public void performApplicantSignUp()
        {

            // checking if datamembers/fields are empty 
            if (!string.IsNullOrWhiteSpace(username) && !string.IsNullOrWhiteSpace(firstName) && !string.IsNullOrWhiteSpace(lastName) &&
                !string.IsNullOrWhiteSpace(password) && !string.IsNullOrWhiteSpace(email) && !string.IsNullOrWhiteSpace(gender) && resumeSignup.HasFile && System.IO.Path.GetExtension(resumeSignup.PostedFile.FileName) == ".pdf")
            {
                try
                {
                    con = new SqlConnection(s);
                    con.Open();
                    q = "select * from applicant where username=@username";
                    cmd = new SqlCommand(q, con);
                    cmd.Parameters.AddWithValue("@username", username);
                    dr = cmd.ExecuteReader();

                    dr.Read();
                    // checking if username already exists
                    if (dr.HasRows)
                    {
                        usernameErr.Visible = true;
                        usernameErr.Text = "username already exists";
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                        
                        //letting user sign up
                        PasswordHash hash = new PasswordHash(password);
                        byte[] hashedpassword = hash.ToArray();

                        String resumeLocation = "resumes/" + DateTime.Now.ToString("yyyymmddMMss") + resumeSignup.FileName;
                        resumeSignup.SaveAs(Server.MapPath(resumeLocation));

                        q = "insert into applicant values(@username, @firstname, @lastname, @email, @resumelocation, @gender, @pass)";
                        cmd = new SqlCommand(q, con);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@firstname", firstName);
                        cmd.Parameters.AddWithValue("@lastname", lastName);
                        cmd.Parameters.AddWithValue("email", email);
                        cmd.Parameters.AddWithValue("@resumelocation", resumeLocation);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@pass", hashedpassword);

                        cmd.ExecuteNonQuery();

                        Response.Redirect("/login.aspx?status=success");
                    }
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
                // individual checking of data members/fields
                if (string.IsNullOrWhiteSpace(username))
                {
                    usernameErr.Visible = true;
                    usernameErr.Text = "username is required";
                }
                if (string.IsNullOrWhiteSpace(firstName))
                {
                    firstNameErr.Visible = true;
                    firstNameErr.Text = "first name is required";
                }
                if (string.IsNullOrWhiteSpace(lastName))
                {
                    lastNameErr.Visible = true;
                    lastNameErr.Text = "last name is required";
                }
                if (string.IsNullOrWhiteSpace(email))
                {
                    emailErr.Visible = true;
                    emailErr.Text = "email is required";
                }
                if (string.IsNullOrWhiteSpace(password))
                {
                    passwordErr.Visible = true;
                    passwordErr.Text = "password is required";
                }
                if (string.IsNullOrWhiteSpace(gender))
                {
                    genderErr.Visible = true;
                    genderErr.Text = "gender is required";
                }

                if (resumeSignup.HasFile != true || System.IO.Path.GetExtension(resumeSignup.PostedFile.FileName) != ".pdf")
                {
                    resumeErr.Visible = true;
                    resumeErr.Text = "upload a valid .pdf resume file";
                }
            }

        }
    }
}