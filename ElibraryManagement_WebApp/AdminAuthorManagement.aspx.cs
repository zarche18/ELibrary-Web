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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string conection = ConfigurationManager.ConnectionStrings["ELibraryConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            grdAuthorList.DataBind();
        }

        #region Events
        protected void btnGo_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(CheckIDExist())
            {
                Response.Write($"Author ID is already Exists!");
            }
            else
            {
                Add();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (CheckIDExist())
            {
                Update();
            }
            else
            {
                Response.Write("<script>alert('Authour Id does not exists!')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (CheckIDExist())
            {
                Delete();
            }
            else
            {
                Response.Write("<script>alert('Authour Id does not exists!')</script>");
            }
        }
        #endregion

        #region Methods
        bool CheckIDExist()
        {
            try
            {
                SqlConnection conn = new SqlConnection(conection); 
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlquery = $"SELECT * FROM tbl_author_master WHERE author_id ='{txtAuthorID.Text.Trim()}'";
                SqlCommand command = new SqlCommand(sqlquery,conn);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if(dt.Rows.Count >0 )
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
        void getAuthorByID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(conection);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlquery = $"SELECT * FROM tbl_author_master WHERE author_id ='{txtAuthorID.Text.Trim()}'";
                SqlCommand command = new SqlCommand(sqlquery, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txtAuthorID.Text = dt.Rows[0][0].ToString();
                    txtAuthorName.Text = dt.Rows[0][1].ToString();
                } 
                else
                {
                    Response.Write($"Invalid Author ID!");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Encounter Error: {ex.Message}"); 
            }
        }
        void Add()
        {
            try
            {
                SqlConnection con = new SqlConnection(conection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlquery = "INSERT INTO tbl_author_master (author_id,author_name) VALUES (@author_id,@author_name)";
                SqlCommand command = new SqlCommand(sqlquery, con);
                command.Parameters.AddWithValue("@author_id", txtAuthorID.Text.Trim());
                command.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());
                command.ExecuteNonQuery();
                Clear();
                Response.Write("<script>alert('Insert new Author is success!')</script>");
                grdAuthorList.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Insert new Author encountered error! Error:"+ex.Message+"')</script>");
            }
            
        }
        void Update()
        {
            try
            {
                SqlConnection con = new SqlConnection(conection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlquery = "UPDATE tbl_author_master SET author_name = @author_name WHERE author_id =@author_id";
                SqlCommand command = new SqlCommand(sqlquery, con);
                command.Parameters.AddWithValue("@author_id", txtAuthorID.Text.Trim());
                command.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());
                command.ExecuteNonQuery();
                Clear();
                Response.Write("<script>alert('Updates Author Successful!')</script>");
                grdAuthorList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Updates Author encountered error! Error:" + ex.Message + "')</script>");
            }
        }
        void Delete()
        {
            try
            {
                SqlConnection con = new SqlConnection(conection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlquery = "DELETE FROM tbl_author_master WHERE author_id = @author_id ";
                SqlCommand command = new SqlCommand(sqlquery, con);
                command.Parameters.AddWithValue("@author_id", txtAuthorID.Text.Trim()); 
                command.ExecuteNonQuery();
                Clear();
                Response.Write("<script>alert('Delete Author Successful!')</script>");
                grdAuthorList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Delete Author encountered error! Error:" + ex.Message + "')</script>");
            }
        }
        void Clear()
        {
            txtAuthorID.Text = "";
            txtAuthorName.Text = "";
        }
        #endregion
    }
}