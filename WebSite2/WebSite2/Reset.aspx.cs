using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Reset : System.Web.UI.Page
{
    string connectionString = @"Data Source=MSI-DANE;Initial Catalog=ageDB;Integrated Security=True;";
    int admin = 0;
    int guest = 1;
    string sessionname;
    protected void Page_Load(object sender, EventArgs e)
    {



        this.UnobtrusiveValidationMode =
            System.Web.UI.UnobtrusiveValidationMode.None;


        if (Session["Rst"] != null)
        {

            BTN_Back.Visible = false;

        }

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
            
            ////////// FIRST NAME AND LAST NAME ////////////////
            SqlCommand fnCMD = new SqlCommand("SELECT FirstName FROM FinalTable WHERE Username=@Username", sqlCon);
            fnCMD.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object fnVALUE = fnCMD.ExecuteScalar();

            SqlCommand lnCMD = new SqlCommand("SELECT LastName FROM FinalTable WHERE Username=@Username", sqlCon);
            lnCMD.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object lnVALUE = lnCMD.ExecuteScalar();

            if (lnVALUE != null)
                LBL_FullName.Text = fnVALUE.ToString() + " " + lnVALUE.ToString();


            ////////// CONTACT ////////////////
            SqlCommand b = new SqlCommand("SELECT Contact FROM FinalTable WHERE Username=@Username", sqlCon);
            b.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valueb = b.ExecuteScalar();
            if (valueb != null)
                LBL_Contact.Text = valueb.ToString();

            ////////// USERNAME ////////////////
            if (Tb1.Text != "")
                LBL_Username.Text = Tb1.Text.Trim();

            ////////// EMAIL ////////////////
            SqlCommand bb = new SqlCommand("SELECT Email FROM FinalTable WHERE Username=@Username", sqlCon);
            bb.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valuebb = bb.ExecuteScalar();
            if (valuebb != null)
                LBL_Email.Text = valuebb.ToString();


  


            ////////// TYPE ////////////////
            SqlCommand c = new SqlCommand("SELECT Type FROM FinalTable WHERE Username=@Username", sqlCon);
            c.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object value = c.ExecuteScalar();
            if (value != null)
                LBL_Type.Text = value.ToString();

            
        }
        

    }


    


    
    protected void BTNenter_Click(object sender, EventArgs e)
    {
        if(guest == 0)
        {
            if(TBpass.Text != "")
            {
                if(TBpass.Text == TBcpass.Text)
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        SqlCommand sqlCmd = new SqlCommand("UPDATE FinalTable SET Password=@Password WHERE Username=@Username", sqlCon);

                        sqlCmd.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Password", TBpass.Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        Session["Rst"] = null;
                        Response.Redirect("MyAccount.aspx");

                    }
                }

                else
                {
                    LBL.Text = "Passwords do not match!";
                }
          

            }

            else
            {
                LBL.Text = "Enter fnCMD valid password!";
            }
          
        }

        else
        {
            LBL.Text = "You are not logged in!";
        }
        
    }



    protected void BTN_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyAccount.aspx");
    }
}