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
    public partial class WebForm9 : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["ELibraryConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            grdPublisherList.DataBind();
        }
        #region Events
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(CheckExistData())
            {
                Response.Write("<script>alert('Member already exists!')</script>");
            }
            else
            {
                Add();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (CheckExistData())
            {
                Update();
            }
            else
            {
                Response.Write("<script>alert('Publish ID does exists!')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (CheckExistData())
            {
                Delete();
            }
            else
            {
                Response.Write("<script>alert('Publish ID does exists!')</script>");
            }
        }
        #endregion

        #region method
        public void Add()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = "INSERT INTO tbl_publisher_master (publisher_id,publisher_name) values (@publisher_id,@publisher_name)";
                SqlCommand command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@publisher_id", txtPublisherID.Text);
                command.Parameters.AddWithValue("@publisher_name", txtFullName.Text);
                command.ExecuteNonQuery();
                Response.Write("<script>alert('Insert publisher success!');</script>");
                Clear();
                grdPublisherList.DataBind();
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('Insert publisher failed!Error:" + ex.Message + "');</script>");
            }
        }
        public void Update()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = "UPDATE tbl_publisher_master SET publisher_name = @publisher_name WHERE publisher_id =@publisher_id";
                SqlCommand command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@publisher_id", txtPublisherID.Text);
                command.Parameters.AddWithValue("@publisher_name", txtFullName.Text);
                command.ExecuteNonQuery();
                Response.Write("<script>alert('Updated publisher successful!');</script>");
                Clear();
                grdPublisherList.DataBind();
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('Updated publisher failed!Error:" + ex.Message + "');</script>");
            }
        }
        public void Delete()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = "DELETE FROM tbl_publisher_master WHERE publisher_id =@publisher_id";
                SqlCommand command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@publisher_id", txtPublisherID.Text); 
                command.ExecuteNonQuery();
                Response.Write("<script>alert('Delete publisher successful!');</script>");
                Clear();
                grdPublisherList.DataBind();
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('Delete publisher failed!Error:" + ex.Message + "');</script>");
            }
        }
        bool CheckExistData()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                if(conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = $"SELECT * FROM tbl_publisher_master where publisher_id = '{txtPublisherID.Text.Trim()}'";
                SqlCommand command = new SqlCommand(sqlQuery,conn);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();

                adapter.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    return true;
                }
                return false;
            }
            catch(Exception ex)
            {
                Response.Write($"Encounter Error: {ex.Message}");
                return false;
            } 
        }
        void getPublisherByID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = $"SELECT * FROM tbl_publisher_master where publisher_id = '{txtPublisherID.Text.Trim()}'";
                SqlCommand command = new SqlCommand(sqlQuery, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();

                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txtPublisherID.Text = dt.Rows[0][0].ToString();
                    txtFullName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write($"Invlid Publisher ID!");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Encounter Error: {ex.Message}"); 
            }
        }
        public void Clear()
        {
            txtFullName.Text = "";
            txtPublisherID.Text = "";
        }
        #endregion

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getPublisherByID();
        }
    }
}