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
    public partial class Register : System.Web.UI.Page
    {
        string ConnectionString = @"Data Source=DC ; Initial Catalog = ISRISTEL_AssignmentDB; Integrated Security = True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int userID = Convert.ToInt32(Request.QueryString["id"]);
                    using (SqlConnection sqlCon=new SqlConnection(ConnectionString))
                    {
                        sqlCon.Open();
                        SqlDataAdapter sqlDat = new SqlDataAdapter("ViewUserInf", sqlCon);
                        sqlDat.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDat.SelectCommand.Parameters.AddWithValue("@UserID", userID);
                        DataTable dt1= new DataTable();
                        sqlDat.Fill(dt1);

                        hfUseID.Value=userID.ToString();
                        txtUsername.Text = dt1.Rows[0][1] .ToString();
                        txtEmail.Text = dt1.Rows[0][2].ToString();
                        txtPassword.Text = dt1.Rows[0][3].ToString();
                        txtPassword.Attributes.Add("Value", dt1.Rows[0][3].ToString());
                        txtConfirmPassword.Text = dt1.Rows[0][3].ToString();
                        txtConfirmPassword.Attributes.Add("Value", dt1.Rows[0][3].ToString());

                    }
                }
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "" || txtEmail.Text == "" || txtPassword.Text == "" || txtConfirmPassword.Text == "")
                lblErrorMessage.Text = "Please Fill All The Fields";
            else if (txtPassword.Text != txtConfirmPassword.Text)
                lblErrorMessage.Text = "Password does not Match";
            else
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("UserAddOrEdit", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@UseID", Convert.ToInt32(hfUseID.Value == "" ? "0" : hfUseID.Value));
                    sqlCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    Clear();
                    lblSuccessMessage.Text = "Submitted Successfully";
                }
            }
        }
        
        void Clear()
        {
            txtUsername.Text = txtEmail.Text = txtPassword.Text = txtConfirmPassword.Text = "";
            hfUseID.Value ="";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
        }

        protected void btnLogin2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}