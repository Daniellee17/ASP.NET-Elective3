using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MyAccount : System.Web.UI.Page
{
    string connectionString = @"Data Source=MSI-DANE;Initial Catalog=ageDB;Integrated Security=True;";
    int admin = 0;
    int loggedin = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        this.UnobtrusiveValidationMode =
            System.Web.UI.UnobtrusiveValidationMode.None;

        if (Session["Username"] != null)
        {
            loggedin = 1;
            LB_reg.Text = "Experiments";
            Tb1.Text = Session["Username"].ToString();

            if (Session["Type"] == "Administrator")
            {
                admin = 1;
                LblName.Text = "Welcome, " + " Admin " + Session["FirstName"] + "!";
                BTNAccounts.Visible = true;
                BTNGrid.Visible = true;
            }
            else
            {
                admin = 0;
                LblName.Text = "Welcome, " + Session["FirstName"] + "!";
               

            }
            LB_login.Text = "Logout";

      

        }

        else
        {
            LblName.Text = "Welcome, Guest!";
            LB_login.Text = "Login";
       
        }

        if (!IsPostBack)
        {



        }


        using (SqlConnection sqlCon1 = new SqlConnection(connectionString))
        {
            sqlCon1.Open();

           
        


            ////////// FIRST NAME AND LAST NAME ////////////////
            SqlCommand a = new SqlCommand("SELECT FirstName FROM FinalTable WHERE Username=@Username", sqlCon1);
            a.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valuea = a.ExecuteScalar();

            SqlCommand a2 = new SqlCommand("SELECT LastName FROM FinalTable WHERE Username=@Username", sqlCon1);
            a2.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valuea2 = a2.ExecuteScalar();

            if (valuea != null)
             LBL_FullName.Text = valuea.ToString() + " " + valuea2.ToString();


            ////////// CONTACT ////////////////
            SqlCommand b = new SqlCommand("SELECT Contact FROM FinalTable WHERE Username=@Username", sqlCon1);
            b.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valueb = b.ExecuteScalar();
            if (valueb != null)
                LBL_Contact.Text =valueb.ToString();

            ////////// USERNAME ////////////////
            if (Tb1.Text != "")
                LBL_Username.Text = Tb1.Text.Trim();

            ////////// EMAIL ////////////////
            SqlCommand bb = new SqlCommand("SELECT Email FROM FinalTable WHERE Username=@Username", sqlCon1);
            bb.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object valuebb = bb.ExecuteScalar();
            if (valuebb != null)
                LBL_Email.Text = valuebb.ToString();


            ////////// PASSWORD ////////////////
            //SqlCommand bbb = new SqlCommand("SELECT Password FROM FinalTable WHERE Username=@Username", sqlCon1);
            //bbb.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            //object valuebbb = bbb.ExecuteScalar();
            //if (valuebbb != null)
            //   LBL_Password.Text = valuebbb.ToString();
            LBL_Password.Text = "Hiddden";

           ////////// TYPE ////////////////
           SqlCommand c = new SqlCommand("SELECT Type FROM FinalTable WHERE Username=@Username", sqlCon1);
            c.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
            object value = c.ExecuteScalar();
            if (value != null)
                LBL_Type.Text = value.ToString();




        }




    }
 


    protected void LB_my_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyAccount.aspx");
    }


    protected void LB_login_Click(object sender, EventArgs e)
    {

        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }

    protected void LB_reg_Click(object sender, EventArgs e)
    {
        if (loggedin == 1)
        {
            Response.Redirect("Experiments.aspx");
        }

        else
        {
            Response.Redirect("Registration.aspx");
        }
    }

    protected void LB_contact_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contact.aspx");
    }



    protected void LB_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }


    protected void LB_db_Click(object sender, EventArgs e)
    {
        if (admin == 1)
        {
            Response.Redirect("Database.aspx");
        }

        else
        {

            LBL.Text = "You don't have admin privileges!";
        }

    }


    protected void LB_a2_Click(object sender, EventArgs e)
    {
        if (admin == 1)
        {
            Response.Redirect("AdminPage1.aspx");
        }

        else
        {

            LBL.Text = "You don't have admin privileges!";
        }
    }




  

    protected void BTNreset_Click(object sender, EventArgs e)
    {
        if (Tb1.Text == "")
        {
            LBL.Text = "You are not logged in!";
        }

        else

        {

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                string query0 = "UPDATE FinalTable SET Password = 'reset' WHERE Username=@Username";
                SqlCommand sqlCmd0 = new SqlCommand(query0, sqlCon);

                sqlCmd0.Parameters.AddWithValue("@Username", Tb1.Text.Trim());
                sqlCmd0.ExecuteNonQuery();

                Response.Redirect(Request.RawUrl);
             
            }
            
        }




    }

    protected void LB_experiments_Click(object sender, EventArgs e)
    {
        Response.Redirect("Experiments.aspx");
    }


    protected void BTNchange_Click(object sender, EventArgs e)
    {

        if (Tb1.Text == "")
        {
            LBL.Text = "You are not logged in!";
        }

        else

        {



            Response.Redirect("Reset.aspx");



        }
    }

    protected void BTNAccounts_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPage1.aspx");
    }

    protected void BTNGrid_Click(object sender, EventArgs e)
    {
        Response.Redirect("Database.aspx");
    }
}