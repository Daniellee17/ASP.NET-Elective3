using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Database : System.Web.UI.Page
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
            LblName.Text = "Welcome, Guest!";
            LB_login.Text = "Login";
        }

        if (!IsPostBack)
        {

            PopulateGridView();

        }
    }

    void PopulateGridView()
    {
        try
        {
            DataTable dtbl = new DataTable();


            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM FinalTable", sqlCon);
                sqlDa.Fill(dtbl);

            }

            if (dtbl.Rows.Count > 0)
            {
                gvUsers.DataSource = dtbl;
                gvUsers.DataBind();



            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvUsers.DataSource = dtbl;
                gvUsers.DataBind();
                gvUsers.Rows[0].Cells.Clear();
                gvUsers.Rows[0].Cells.Add(new TableCell());
                gvUsers.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvUsers.Rows[0].Cells[0].Text = "No Data Found...";
                gvUsers.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
        }


        catch (Exception ex)
        {
            LBL.Text = ex.Message;
                  }

    }




    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            if (e.CommandName.Equals("AddNew"))
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO FinalTable (FirstName,LastName,Username,Contact,Email,Password,Type,Verified) VALUES (@FirstName,@LastName,@Username,@Contact,@Email,@Password,@Type,@Verified)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.Parameters.AddWithValue("@FirstName", (gvUsers.FooterRow.FindControl("txtFirstNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (gvUsers.FooterRow.FindControl("txtLastNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Contact", (gvUsers.FooterRow.FindControl("txtContactFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Username", (gvUsers.FooterRow.FindControl("txtUsernameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (gvUsers.FooterRow.FindControl("txtEmailFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", (gvUsers.FooterRow.FindControl("txtPasswordFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Type", (gvUsers.FooterRow.FindControl("txtTypeFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Verified", (gvUsers.FooterRow.FindControl("txtVerifiedFooter") as TextBox).Text.Trim());


                    sqlCmd.ExecuteNonQuery();
                    PopulateGridView();
                    LBL.Text = "New Record Added";
                  

                }
            }
        }
        catch (Exception ex)
        {
          
            LBL.Text = ex.Message;
        }


    }

    protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUsers.EditIndex = e.NewEditIndex;
        PopulateGridView();
    }

    protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUsers.EditIndex = -1;
        PopulateGridView();
    }

    protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        try
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "UPDATE FinalTable SET FirstName=@FirstName,LastName=@LastName,Username=@Username,Contact=@Contact,Email=@Email,Password=@Password,Type=@Type,Verified=@Verified WHERE UserID=@id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                sqlCmd.Parameters.AddWithValue("@FirstName", (gvUsers.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@LastName", (gvUsers.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Contact", (gvUsers.Rows[e.RowIndex].FindControl("txtContact") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Username", (gvUsers.Rows[e.RowIndex].FindControl("txtUsername") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Email", (gvUsers.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Password", (gvUsers.Rows[e.RowIndex].FindControl("txtPassword") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Type", (gvUsers.Rows[e.RowIndex].FindControl("txtType") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Verified", (gvUsers.Rows[e.RowIndex].FindControl("txtVerified") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                gvUsers.EditIndex = -1;
                PopulateGridView();
                LBL.Text = "Record Updated";
               
                Response.Redirect(Request.RawUrl);

            }

        }
        catch (Exception ex)
        {
            LBL.Text = ex.Message;
        }
    }

    protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "DELETE FROM FinalTable WHERE UserID=@id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();

                PopulateGridView();
                LBL.Text = "";
            }

        }

        catch (Exception ex)
        {
            LBL.Text = ex.Message;
        }
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
    protected void LB_my_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyAccount.aspx");
    }



    protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void BTN_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyAccount.aspx");
    }
}