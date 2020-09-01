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

namespace ProjectJobPortal
{
    public partial class job : System.Web.UI.Page
    {
        int jobid;
        String applieduser;
        String postowner;
        String q = "";
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt = new DataTable();
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.HasKeys())
            {
                jobid = Convert.ToInt32(Request.QueryString.Get("id").ToString());
                try
                {
                    q = "select * from jobs where jobid=@jobid";
                    con = new SqlConnection(s);
                    cmd = new SqlCommand(q,con);
                    cmd.Parameters.AddWithValue("@jobid", jobid);
                    sda = new SqlDataAdapter(cmd);

                    sda.Fill(dt);

                    if(dt.Rows.Count > 0)
                    {
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                    }
                    else
                    {
                        Response.Write("Record not found");
                    }
                }catch(Exception err)
                {
                    Response.Write(err.Message);
                }
                finally
                {
                    dt.Clear();
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("/WebForm1.aspx");
            }
        }


        

        protected void applybtn_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            
             


            if (Session["username"] != null)
            {
                if(Session["role"].ToString() == "applicant")
                {
                    postowner = (item.FindControl("Label2") as Label).Text;
                    applieduser = Session["username"].ToString();

                    if (verfiyJob())
                    {
                        applyJob();
                        flashPanel.Visible = true;
                        flashPanel2.Visible = false;
                    }
                    else
                    {
                        flashPanel.Visible = false;
                        flashPanel2.Visible = true;
                    }
                }
                else
                {
                    Response.Write("Employer can't apply for jobs");
                }
            }
            else
            {
                Response.Redirect("/applicant-join.aspx");
            }

        }


        public bool verfiyJob()
        {
            bool returnValue = false;
            try
            {
                q = "select * from appliedjobs where jobid=@jobid and applieduser=@applieduser";
                con = new SqlConnection(s);
                con.Open();
                cmd = new SqlCommand(q,con);
                cmd.Parameters.AddWithValue("@jobid", jobid);
                cmd.Parameters.AddWithValue("@applieduser", applieduser);

                dr = cmd.ExecuteReader();
                dr.Read();

                if (dr.HasRows)
                {
                    returnValue = false; 
                }
                else
                {

                    returnValue = true;
                }

            }
            catch(Exception err)
            {
                Response.Write(err.Message);
            }
            finally
            {
                dr.Close();
                con.Close();
            }


            return returnValue;
        }

        public void applyJob()
        {
            try
            {
                q = "insert into appliedjobs values(@jobid, @applieduser, @postowner)";
                con = new SqlConnection(s);
                con.Open();
                cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@jobid", jobid);
                cmd.Parameters.AddWithValue("@applieduser", applieduser);
                cmd.Parameters.AddWithValue("@postowner", postowner);

                cmd.ExecuteNonQuery();

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

    }
}