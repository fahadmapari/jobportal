using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace ProjectJobPortal
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Focus();
        }


        void sendMail(String email, String msg)
        {
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("**********@gmail.com", "*********");
                MailMessage mmsg = new MailMessage();
                mmsg.To.Add("btechy4@gmail.com");
                mmsg.From = new MailAddress("fahadmapari49@gmail.com");
                mmsg.Subject = email;
                mmsg.Body = msg;
                client.Send(mmsg);
            }catch(Exception err)
            {
                Response.Write(err.Message);
            }

            }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            flashPanel.Visible = false;
            if(TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "")
            {
                String email = TextBox1.Text.Trim();
                String msg = TextBox2.Text.Trim();
                sendMail(email, msg);
                TextBox1.Text = "";
                TextBox2.Text = "";
                flashPanel.Visible = true;
            }
            else
            {
                if(TextBox1.Text.Trim() == "")
                {
                    Label1.Visible = true;
                    Label2.Text = "emial is required";
                }
                if(TextBox2.Text.Trim() == "")
                {
                    Label2.Visible = true;
                    Label2.Text = "message is required";
                }
            }
        }
    }
}