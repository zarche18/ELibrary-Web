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
    public partial class WebForm4 : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["ELibraryConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connection = new SqlConnection(con);
                string sqlQuery = "SELECT * FROM tbl_admin_login WHERE user_name ='"+txtAminID.Text.Trim()+"' AND password='"+txtAdminPassword.Text.Trim()+"'";
                if(connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                SqlCommand command = new SqlCommand(sqlQuery,connection);
                SqlDataReader reader = command.ExecuteReader();
                if(reader.HasRows)
                {
                    while(reader.Read())
                    {
                        Response.Write("<script>alert('Login Success!')</script>");
                        Session["member_id"] = reader.GetValue(0).ToString().Trim();
                        Session["full_name"] = reader.GetValue(2).ToString().Trim();
                        Session["role"] = "admin";
                        Session["account_status"] = "";
                    }
                    Response.Redirect("homepage.aspx");
                }
            }
            catch
            {
                Response.Write("<script>alert('Invalid login credential!')</script>");
            }
        }
    }
}