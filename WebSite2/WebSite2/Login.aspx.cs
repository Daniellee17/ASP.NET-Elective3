using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    int admin = 0;
    string typestored;
    string fnstored;
    int guest = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
      
        LBLerror.Text = " ";
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


    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(@"Data Source=MSI-DANE;Initial Catalog=ageDB;Integrated Security=True;"))
        {
            sqlCon.Open();
            string query = "SELECT COUNT(1) FROM FinalTable WHERE Username=@Username AND Password=@Password AND Verified='Yes'";
            string query2 = "SELECT Type FROM FinalTable WHERE Username=@Username";
            string queryReset = "SELECT Password FROM FinalTable WHERE Username=@Username";
            string query3 = "SELECT FirstName FROM FinalTable WHERE Username=@Username";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@Username", TBuser.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Password", TBpass.Text.Trim());
           
            SqlCommand sqlCmd2 = new SqlCommand(query2, sqlCon);
            sqlCmd2.Parameters.AddWithValue("@Username", TBuser.Text.Trim());

            SqlCommand sqlCmd3 = new SqlCommand(query3, sqlCon);
            sqlCmd3.Parameters.AddWithValue("@Username", TBuser.Text.Trim());

            SqlCommand sqlCmd4 = new SqlCommand(queryReset, sqlCon);
            sqlCmd4.Parameters.AddWithValue("@Username", TBuser.Text.Trim());


            int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
            if (count == 1)
            {

               

                object value = sqlCmd2.ExecuteScalar();
                object value2 = sqlCmd3.ExecuteScalar();
                object value3 = sqlCmd4.ExecuteScalar();


                if (value != null)
                {
                    typestored = value.ToString();
                }

                if (value2 != null)
                {
                    fnstored = value2.ToString();
                }


                if (typestored == "Administrator")
                {
                    Session["Username"] = TBuser.Text.Trim();
                    Session["FirstName"] = fnstored;
                    Session["Type"] = "Administrator";

                    if(value3.ToString() == "reset")
                    {
                        Response.Redirect("Reset.aspx");
                    }

                    else
                    {
                        Response.Redirect("Verification.aspx");
                    }
                   
                }

                else
                {
                    Session["Username"] = TBuser.Text.Trim();
                    Session["FirstName"] = fnstored;
                    Session["Type"] = "Standard";

                    if (value3.ToString() == "reset")
                    {
                        Response.Redirect("Reset.aspx");
                    }

                    else
                    {
                        Response.Redirect("Verification.aspx");
                    }
                    
                }
            }


            
            else
            {
                LBLerror.Text = "Incorrect Credentials!";
            }
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

    protected void LB_my_Click(object sender, EventArgs e)
    {
        if (guest == 1)
        {
            LBLerror.Text = "You are not logged in!";
        }


            else
        {
            Response.Redirect("MyAccount.aspx");
        }
        
    }
    protected void LB_db_Click(object sender, EventArgs e)
    {
        if(admin == 1)
        {
            Response.Redirect("Database.aspx");
        }

        else
        {
  
            LBLerror.Text = "You don't have admin privileges!";
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

            LBLerror.Text = "You don't have admin privileges!";
        }
    }

}