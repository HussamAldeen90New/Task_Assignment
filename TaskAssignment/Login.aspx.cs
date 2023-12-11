using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace TaskAssignment
{
    public partial class Login : System.Web.UI.Page
    {
        string ConnectionString = @"Data Source=DC ; Initial Catalog = ISRISTEL_AssignmentDB; Integrated Security = True";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible= false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "" || txtPassword.Text == "")
                lblErrorMessage.Text = "Please Fill All The Fields";
            else
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("Verification", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    int count=Convert.ToInt32(sqlCmd.ExecuteScalar());
                    if (count == 1)
                    {
                        Session["username"] = txtUsername.Text.Trim();
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        lblErrorMessage.Visible = true;     
                    }
                    sqlCmd.ExecuteNonQuery();
                    
                }
            }
        }
        void Clear()
        {
            txtUsername.Text = txtPassword.Text = "";
            hfUseID.Value = "";
            lblErrorMessage.Text = "";
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Register.aspx");
        }
    }
}