﻿using System;
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
    public partial class posted_jobs : System.Web.UI.Page
    {
        String q = "";
        String postowner = "";
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"] != null)
            {
                if (Session["role"].ToString() != "employer")
                {
                    Response.Redirect("/WebForm1.aspx");
                }
            }
            else
            {
                Response.Redirect("/WebForm1.aspx");
            }

            postowner = Session["username"].ToString();
            try
            {
                q = "select * from jobs where postedby=@postowner order by jobid desc";
                con = new SqlConnection(s);
                con.Open();
                cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@postowner", postowner);
                sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if(dt.Rows.Count > 0)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    flashPanel2.Visible = false;
                }
                else
                {
                    flashPanel2.Visible = true;
                }
            }catch(Exception err)
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
            HyperLink hyperLink2 = (HyperLink)e.Item.FindControl("HyperLink2");

            String id = hyperLink3.NavigateUrl.ToString();
            String joblink = "/job.aspx?id=" + id;
            String editlink = "/edit-post.aspx?id=" + id;
            String deletelink = "/delete-job.aspx?id=" + id;

            hyperLink3.NavigateUrl = joblink;
            hyperLink1.NavigateUrl = editlink;
            hyperLink2.NavigateUrl = deletelink;
        }

    }
}