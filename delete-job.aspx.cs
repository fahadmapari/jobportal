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
    public partial class delete_job : System.Web.UI.Page
    {
        String q = "";
        String id;
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] == null)
            {
                Response.Redirect("/WebForm1.aspx");
            }

            if (Request.QueryString.HasKeys())
            {
                id = Request.QueryString.Get("id");
                try
                {
                    q = "select * from jobs where jobid=@id";
                    con = new SqlConnection(s);
                    con.Open();
                    cmd = new SqlCommand(q, con);
                    cmd.Parameters.AddWithValue("@id", id);
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    if(Session["username"].ToString() != dr["postedby"].ToString())
                    {
                        Response.Redirect("/WebForm1.aspx");
                    }
                    dr.Close();
                }
                catch(Exception err)
                {
                    Response.Write(err.Message);
                }
                finally
                {
                    con.Close();
                }

                try
                {
                    q = "delete from appliedjobs where jobid=@id";
                    con = new SqlConnection(s);
                    con.Open();
                    cmd = new SqlCommand(q, con);
                    cmd.Parameters.AddWithValue("@id", id);
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

                try
                {
                    q = "delete from jobs where jobid=@id ";
                    con = new SqlConnection(s);
                    con.Open();
                    cmd = new SqlCommand(q,con);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("/posted-jobs.aspx");
                }catch(Exception err)
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
                Response.Redirect("/WebForm1.aspx");
            }

        }
    }
}