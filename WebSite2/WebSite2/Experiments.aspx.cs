using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Experiments : System.Web.UI.Page
{
    int admin = 0;
    int guest = 0;
    int loggedin = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        this.UnobtrusiveValidationMode =
            System.Web.UI.UnobtrusiveValidationMode.None;

        if (Session["Username"] != null)
        {
            loggedin = 1;
            LB_reg.Text = "Experiments";
            if (Session["Type"] == "Administrator")
            {
                admin = 1;
                LblName.Text = "Welcome, " + " Admin " + Session["FirstName"] + "!";
                Label1.Text = "ADMIN EXPERIMENT PAGE";
            }

            else
            {
                admin = 0;
                LblName.Text = "Welcome, " + Session["FirstName"] + "!";
                Label1.Text = "USER EXPERIMENT PAGE";

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



    protected void LB_login_Click(object sender, EventArgs e)
    {

        Session.RemoveAll();
        Response.Redirect("Login.aspx");
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

    protected void LB_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void LB_contact_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contact.aspx");
    }



    protected void LB_db_Click(object sender, EventArgs e)
    {
        if (admin == 1)
        {
            Response.Redirect("Database.aspx");
        }

        else
        {

            LBLerror.Text = "You don't have admin privelages!";
        }

    }

    protected void LB_experiments_Click(object sender, EventArgs e)
    {
        Response.Redirect("Experiments.aspx");
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