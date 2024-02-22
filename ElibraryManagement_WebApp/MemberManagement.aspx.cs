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
    public partial class WebForm11 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ELibraryConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            grdMemberList.DataBind();
        }

        #region events 
        protected void lkGo_Click(object sender, EventArgs e)
        {
            if(checkMemberID())
            {
                getMemberByID();
            }
            else
            {
                Response.Write("<script>alert('Member ID Not Found!')</script>");
            }
        }

        protected void btnActive_Click(object sender, EventArgs e)
        {
            UpdateStatus("active");
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            UpdateStatus("pending");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            UpdateStatus("deactivate");
        }
        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            if (checkMemberID())
            {
                DeleteUser();
            }
            else
            {
                Response.Write("<script>alert('Member ID Not Found!')</script>");
            }
        }
        #endregion

        #region method 
        bool checkMemberID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = "SELECT * FROM tbl_member_master WHERE member_id = @member_id";
                SqlCommand command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return true;
                }
                return false;
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Encounter Error!' Error:"+ex.Message+");</script>");
                return false;
            }            
        }
        void getMemberByID()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            if(conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string sqlQuery = "SELECT * FROM tbl_member_master WHERE member_id = @member_id";
            SqlCommand command = new SqlCommand(sqlQuery,conn);
            command.Parameters.AddWithValue("@member_id",txtMemberID.Text.Trim());
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                txtFullName.Text = dt.Rows[0]["full_name"].ToString();
                txtAccountStatus.Text = dt.Rows[0]["account_status"].ToString();
                txtDOB.Text= dt.Rows[0]["dob"].ToString();
                txtContactNo.Text= dt.Rows[0]["contactno"].ToString();
                txtEmail.Text = dt.Rows[0]["email"].ToString();
                txtState.Text = dt.Rows[0]["state"].ToString();
                txtCity.Text = dt.Rows[0]["city"].ToString();
                txtPinCode.Text = dt.Rows[0]["pincode"].ToString();
                txtFullPostalAddress.Text = dt.Rows[0]["full_address"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID!');</script>");
            }
        }
        void UpdateStatus(string status)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string sqlQuery = "UPDATE tbl_member_master SET account_status = '" + status+"' WHERE member_id = @member_id";
            SqlCommand command = new SqlCommand(sqlQuery, conn);
            command.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            command.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Update Status Successfully!');</script>");
            getMemberByID();
            grdMemberList.DataBind();
            Clear();
        }
        void DeleteUser()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string sqlQuery = "DELETE FROM tbl_member_master WHERE member_id = @member_id";
            SqlCommand command = new SqlCommand(sqlQuery, conn);
            command.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            command.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Delete Member Successfully!');</script>");
            grdMemberList.DataBind();
            Clear();
        }
        void Clear()
        {
            txtMemberID.Text = "";
            txtFullName.Text = "";
            txtAccountStatus.Text = "";
            txtDOB.Text = "";
            txtContactNo.Text = "";
            txtEmail.Text = "";
            txtState.Text = "";
            txtCity.Text = "";
            txtPinCode.Text = "";
            txtFullPostalAddress.Text = "";
        }
        #endregion       
    }
}