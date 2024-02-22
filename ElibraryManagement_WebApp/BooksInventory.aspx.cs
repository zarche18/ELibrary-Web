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
    public partial class WebForm12 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ELibraryConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            grdBookInventoryList.DataBind();
        }

        #region Events
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(checkExistsBookID())
            {
                Response.Write("<script>alert('Can't add duplicate book ID!')</script>");
            }
            else
            {
                Add();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
        #endregion

        #region Methods
        bool checkExistsBookID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                if(conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = "SELECT * FROM tbl_book_master WHERE book_id = '"+txtBookID.Text.Trim()+"'";
                SqlCommand sqlCommand = new SqlCommand(sqlQuery,conn);
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
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
                Response.Write($"<script>alert('Encounter Error! Error: {ex.Message}");
            }
            return false;
        }
        void Add()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = "INSERT INTO tbl_book_master (book_id,book_name,genre,author_name,publisher_name,publiser_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link)Values (@book_id,@book_name,@genre,@author_name,@publisher_name,@publiser_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)";
                SqlCommand sqlCommand = new SqlCommand(sqlQuery, conn);
                sqlCommand.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@genre", lbGenre.SelectedItem.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@author_name", ddlAuthorName.Text);
                sqlCommand.Parameters.AddWithValue("@publisher_name", ddlPublisherName.Text);
                sqlCommand.Parameters.AddWithValue("@publiser_date", txtPublishDate.Text);
                sqlCommand.Parameters.AddWithValue("@language", ddlLanguage.Text);
                sqlCommand.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@no_of_pages", txtPages.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@book_description", txtBookDescription.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@actual_stock", txtActualStock.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@current_stock", txtCurrentStock.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@book_img_link", fuBooksInfo.FileName);
                sqlCommand.ExecuteNonQuery();
                Response.Write("<script>alert('Input Book Inventory is success!')</script>");
                grdBookInventoryList.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Encounter Error! Error: "+ ex.Message+"')</script>");
            }
        }
        void Clear()
        {
            txtBookID.Text = "";
            txtBookName.Text = "";
            ddlLanguage.SelectedItem.Text = "";
            ddlAuthorName.SelectedItem.Text = "";
            lbGenre.SelectedItem.Text = "";
            ddlPublisherName.SelectedItem.Text = "";
            txtEdition.Text = "";
            txtBookCost.Text = "";
            txtPages.Text = "";
            txtActualStock.Text = "";
            txtCurrentStock.Text = "";
            txtIssuedBooks.Text = "";
            txtBookDescription.Text = "";
        }
        void getBooInventoryByID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string sqlQuery = "SELECT * FROM tbl_book_master WHERE book_id = '" + txtBookID.Text.Trim() + "'";
                SqlCommand sqlCommand = new SqlCommand(sqlQuery, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                     
                } 
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Encounter Error! Error: {ex.Message}");
            } 
        }
        #endregion
    }
}