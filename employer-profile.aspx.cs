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
    public partial class employer_profile : System.Web.UI.Page
    {
        String q = "";
        String user = "";
        String s = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.HasKeys())
            {
                user = Request.QueryString.Get("user").ToString();
                findUser();
            }
            else
            {
                flashPanel2.Visible = true;
            }
        }
        public void findUser()
        {
            try
            {
                q = "select * from employer where username=@user";
                con = new SqlConnection(s);
                con.Open();
                cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@user", user);
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
    }
}