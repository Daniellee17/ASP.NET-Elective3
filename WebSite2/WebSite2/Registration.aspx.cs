using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Registration : System.Web.UI.Page
{
    string connectionString = @"Data Source=MSI-DANE;Initial Catalog=ageDB;Integrated Security=True;";
    int admin = 0;
    int guest = 0;
    protected void Page_Load(object sender, EventArgs e)
    {



        this.UnobtrusiveValidationMode =
            System.Web.UI.UnobtrusiveValidationMode.None;



        if (Session["Username"] != null)
        {
            if (Session["Type"] == "Administrator")
            {
                admin = 1;
                LblName.Text = "Welcome, " + " Admin " + Session["FirstName"] + "!";
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
            guest = 1;
            LblName.Text = "Welcome, Guest!";
            LB_login.Text = "Login";
        }

        if (!IsPostBack)
        {

            clear();


        }
    }
    void clear()
    {
        TBfn.Text = TBln.Text = TBcontact.Text = TBun.Text = TBemail.Text = TBpass.Text = TBcpass.Text = "";
        hfUserID.Value = "";
        LBL.Text = "";
        CheckBox1.Checked = false;
    }

    protected void BTNsubmit_Click(object sender, EventArgs e)
    {
        if (TBun.Text == "" || TBpass.Text == "" || TBemail.Text == "" || TBfn.Text == "" || TBln.Text == "" || TBcontact.Text == "" || RadioButtonList1.SelectedValue=="")
        {
           
                LBL.Text = "Please fill in all fields";
            
                
        
        }
        else if (TBpass.Text != TBcpass.Text)
        {
            LBL.Text = "Passwords do not match";
          
        }
        else if (CheckBox1.Checked == false)
        {
            LBL.Text = "You need to agree to our terms of service";


        }

        else
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                string query0 = "SELECT COUNT(1) FROM FinalTable WHERE Username=@Username";
                SqlCommand sqlCmd0 = new SqlCommand(query0, sqlCon);
                sqlCmd0.Parameters.AddWithValue("@Username", TBun.Text.Trim());
                int count = Convert.ToInt32(sqlCmd0.ExecuteScalar());
                if (count == 1)
                {
                    LBL.Text = "Username already exists";
                }

                else
                {
                    string query = "INSERT INTO FinalTable (FirstName,LastName,Contact,Username,Email,Password,Type, Verified) VALUES(@FirstName, @LastName, @Contact, @Username, @Email, @Password, @Type, 'No')";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    //sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(hfUserID.Value == "" ? "0" : hfUserID.Value));
                    sqlCmd.Parameters.AddWithValue("@FirstName", TBfn.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", TBln.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Contact", TBcontact.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Username", TBun.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", TBemail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", TBpass.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Type", RadioButtonList1.SelectedValue);

                    sqlCmd.ExecuteNonQuery();
                    clear();
                    LBL.ForeColor = System.Drawing.Color.Green;
                    LBL.Text = "Registration Successful!";
                }

                    

            }
        }
       

    }



    protected void LB_my_Click(object sender, EventArgs e)
    {
        if (guest == 1)
        {
            LBL.Text = "You are not logged in!";
        }


        else
        {
            Response.Redirect("MyAccount.aspx");
        }

    }


    protected void LB_login_Click(object sender, EventArgs e)
    {

        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }

    protected void LB_reg_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
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

    protected void LB_contact_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contact.aspx");
    }



    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}