using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagement_WebApp
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["ELibraryConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
           if(CheckExistingMember())
            {
                Response.Write("<script>alert('Member already exists!')</script>");
            }
            else
            {
                SingupNewMember();
            }
        }

        bool CheckExistingMember()
        {
            try
            {
                SqlConnection connection = new SqlConnection(con);
                if(connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                string sqlQuery = "SELECT * FROM tbl_member_master WHERE member_id ='"+ txtMemberID.Text.Trim() +"'";
                SqlCommand command = new SqlCommand(sqlQuery,connection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Encountered Error: " + ex.Message + "')</script>");
            }
            return false;
        }

        void SingupNewMember()
        {
            try
            {
                SqlConnection connection = new SqlConnection(con);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                string sqlQuery = "INSERT INTO tbl_member_master (member_id,full_name,dob,contactno,email,state,city,pincode,full_address,password,account_status) Values(@member_id, @full_name, @dob, @contactno, @email, @state, @city, @pincode, @full_address, @password, @account_status)";
                SqlCommand command = new SqlCommand(sqlQuery, connection);
                command.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
                command.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                command.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                command.Parameters.AddWithValue("@contactno", txtContactNumber.Text.Trim());
                command.Parameters.AddWithValue("@email", txtEmailID.Text.Trim());
                command.Parameters.AddWithValue("@state", ddlState.SelectedItem.Text.Trim());
                command.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                command.Parameters.AddWithValue("@pincode", txtPinCode.Text.Trim());
                command.Parameters.AddWithValue("@full_address", txtFullAddress.Text.Trim());
                command.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                command.Parameters.AddWithValue("@account_status", "pending");

                command.ExecuteNonQuery();
                connection.Close();
                Response.Write("<script>alert('Sinupg new member successfully!')</script>");
                Clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Sinupg new member Failed! Error: " + ex.Message + "')</script>");
            }
        }
        void Clear()
        {
            txtMemberID.Text = "";
            txtFullName.Text = "";
            txtDOB.Text = "";
            txtContactNumber.Text = "";
            txtEmailID.Text = "";
            ddlState.SelectedItem.Text = "";
            txtCity.Text = "";
            txtPinCode.Text = "";
            txtFullAddress.Text = "";
            txtPassword.Text = "";
        }
    }
}