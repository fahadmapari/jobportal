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
    public partial class employer_join : System.Web.UI.Page
    {
        String username, companyName, companyEmail, companyBio, password;
        String q = "";
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlDataReader dr;
        SqlCommand cmd;
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
            // storing data from fields into data members
            username = usernameSignup.Text.ToString().Trim().Replace(" ", "").ToLower();
            companyName = companyNameSignup.Text.ToString().Trim();
            companyEmail = emailSignup.Text.ToString().Trim();
            companyBio = companyBioSignup.Text.ToString().Trim();
            password = passwordSignup.Text.ToString().Trim();


            usernameErr.Visible = false;
            passwordSignupErr.Visible = false;
            companyNameSignupErr.Visible = false;
            companyBioSignupErr.Visible = false;
            emailSignupErr.Visible = false;


            // calling function for signup
            performEmployerSignUp();
        }

        public void performEmployerSignUp()
        {

            if (!string.IsNullOrWhiteSpace(username) && !string.IsNullOrWhiteSpace(companyName) && !string.IsNullOrWhiteSpace(companyEmail) &&
                !string.IsNullOrWhiteSpace(companyBio) && !string.IsNullOrWhiteSpace(password) )
            {
                try
                {
                    con = new SqlConnection(s);
                    con.Open();
                    q = "select * from employer where username=@username";
                    cmd = new SqlCommand(q, con);
                    cmd.Parameters.AddWithValue("@username", username);
                    dr = cmd.ExecuteReader();

                    dr.Read();

                    if (dr.HasRows)
                    {
                        usernameErr.Visible = true;
                        usernameErr.Text = "username already exists";
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                        

                        PasswordHash hash = new PasswordHash(password);
                        byte[] hashedpassword = hash.ToArray();

                        

                        q = "insert into employer values(@username, @companyname, @email, @bio, @password)";
                        cmd = new SqlCommand(q, con);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@companyname", companyName);
                        cmd.Parameters.AddWithValue("@email", companyEmail);
                        cmd.Parameters.AddWithValue("@bio", companyBio);
                        cmd.Parameters.AddWithValue("@password", hashedpassword);

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
                if (string.IsNullOrWhiteSpace(username))
                {
                    usernameErr.Visible = true;
                    usernameErr.Text = "username is required";
                }
                if (string.IsNullOrWhiteSpace(companyName))
                {
                    companyNameSignupErr.Visible = true;
                    companyNameSignupErr.Text = "company name is required";
                }
                if (string.IsNullOrWhiteSpace(companyEmail))
                {
                    emailSignupErr.Visible = true;
                    emailSignupErr.Text = "email is required";
                }
                if (string.IsNullOrWhiteSpace(companyBio))
                {
                    companyBioSignupErr.Visible = true;
                    companyBioSignupErr.Text = "about company is required";
                }
                if (string.IsNullOrWhiteSpace(password))
                {
                    passwordSignupErr.Visible = true;
                    passwordSignupErr.Text = "password is required";
                }
                
            }

        }
    }
}