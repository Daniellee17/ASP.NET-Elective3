using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


using System.Configuration;
using System.Web.Services;

using System.Net;
using System.Net.Mail;

using System.Collections.Specialized;
using System.IO;
using System.Text;

public partial class Verification : System.Web.UI.Page
{
    string connectionString = @"Data Source=MSI-DANE;Initial Catalog=ageDB;Integrated Security=True;";
    int admin = 0;
    int guest = 1;
    string sessionname;
    string EmailCode;
    string smsCode;
    string codecheck;
   string SMSNum;
    private SqlCommand cmd;


    protected void Page_Load(object sender, EventArgs e)
    {



        this.UnobtrusiveValidationMode =
            System.Web.UI.UnobtrusiveValidationMode.None;



        if (Session["Username"] != null)
        {

            sessionname = Session["Username"].ToString();
            Tb1.Text = sessionname;
            guest = 0;

        }

        else
        {
            guest = 1;

        }

        if (!IsPostBack)
        {



        }


        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();


            ////////// EMAIL ////////////////
            SqlCommand bb = new SqlCommand("SELECT Email FROM FinalTable WHERE Username=@Username", sqlCon);
            bb.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valuebb = bb.ExecuteScalar();
            if (valuebb != null)
                LBL_Email.Text = valuebb.ToString();

            ////////// CONTACT ////////////////
            SqlCommand b = new SqlCommand("SELECT Contact FROM FinalTable WHERE Username=@Username", sqlCon);
            b.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valueb = b.ExecuteScalar();
            if (valueb != null)
                LBL_Contact.Text = valueb.ToString();


        }


    }



    protected void BTNemail_Click(object sender, EventArgs e)
    {
        Random random = new Random();
        EmailCode = random.Next(10001, 99999).ToString();


        using (SqlConnection conn = new SqlConnection(connectionString))
        {

            string insert = "UPDATE FinalTable SET VCode = @code WHERE Username = @Username";
            cmd = new SqlCommand(insert, conn);

            {
                cmd.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
                cmd.Parameters.AddWithValue("@code", EmailCode);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        sendEmailCode();
        BTNemail.Visible = false;
        BTNsms.Visible = false;

        BTNreset.Visible = true;
        BTNsubmit.Visible = true;
        TBverify.Visible = true;
    }

    private void sendEmailCode()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new System.Net.NetworkCredential("esga.2.1819.c2@gmail.com", "Milktea1?");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Activation Code to Verify Your Email Address";
        msg.Body = "Dear " + Tb1.Text + "," + "\nYour Activation Code is: " + EmailCode + "\n\n\nThanks & Regards, " + "\nCPLCTV3 Two-Way Authentication Group";
        string toAdd = LBL_Email.Text;
        msg.To.Add(toAdd);
        string fromAdd = "CPLCTV3 Two-Way Authentication Group <esga.2.1819.c2@gmail.com>";
        msg.From = new MailAddress(fromAdd);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            Response.Write("<script>alert('Network unstable, please try again later.');</script>");
        }

     


    }


    protected void BTNsubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();

            ////////// CHECK CODE FROM DB ////////////////
            SqlCommand b = new SqlCommand("SELECT VCode FROM FinalTable WHERE Username=@Username", sqlCon);
            b.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valueb = b.ExecuteScalar();
            if (valueb != null)
                codecheck = valueb.ToString();
        }

       
            if (TBverify.Text == codecheck)
            {
                Response.Redirect("Home.aspx");
            }

            else
            {
                LBL.Text = "Incorrect code!";
            }

       




    }

    protected void BTNsms_Click(object sender, EventArgs e)
    {
        Random random = new Random();
        smsCode = random.Next(10001, 99999).ToString();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {

            string insert = "UPDATE FinalTable SET VCode = @code WHERE Username = @Username";
            cmd = new SqlCommand(insert, conn);

            {
                cmd.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
                cmd.Parameters.AddWithValue("@code", smsCode);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        sendSMSCode();

        
    }

    private void sendSMSCode()
    {

        String result;
        string apiKey = "r0rALrJVcpw-xCoEGyy51eScRdDLcFzpGGcsTLLNz7";
        string numbers = "63" + LBL_Contact.Text; // in a comma seperated list
        string message = "Your OTP Number is " + efdwxsfqazscax + "\n\n(Sent By : CPLCTV3 Two-Way Authentication Group)";
        string sender = "CPLCTV3";

        String url = "https://api.txtlocal.com/send/?apikey=" + apiKey + "&numbers=" + numbers + "&message=" + message + "&sender=" + sender;
        //refer to parameters to complete correct url string

        StreamWriter myWriter = null;
        HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);

        objRequest.Method = "POST";
        objRequest.ContentLength = Encoding.UTF8.GetByteCount(url);
        objRequest.ContentType = "application/x-www-form-urlencoded";
        try
        {
            myWriter = new StreamWriter(objRequest.GetRequestStream());
            myWriter.Write(url);
        }
        catch (Exception e)
        {

        }
        finally
        {
            myWriter.Close();
        }

        HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
        using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
        {
            result = sr.ReadToEnd();
            // Close and clean up the StreamReader
            sr.Close();
        }
        //result;
    }


protected void BTNreset_Click(object sender, EventArgs e)
    {
        LBL.Text = "";
        BTNemail.Visible = true;
        BTNsms.Visible = true;

        BTNreset.Visible = false;
        BTNsubmit.Visible = false;
        TBverify.Visible = false;
    }

    protected void BTNcancel_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Home.aspx");
    }
}