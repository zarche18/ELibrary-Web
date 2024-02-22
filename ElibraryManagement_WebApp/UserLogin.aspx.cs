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
    public partial class WebForm5 : System.Web.UI.Page
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
                if(connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                string sqlQuery = "SELECT * FROM tbl_member_master WHERE member_id ='"+txtMemberID.Text.Trim()+"' AND password ='"+txtPassword.Text.Trim()+"'";
                SqlCommand command = new SqlCommand(sqlQuery,connection);
                SqlDataReader reader = command.ExecuteReader();
                if(reader.HasRows)
                {
                    while(reader.Read())
                    {
                        Session["member_id"] = reader.GetValue(0).ToString().Trim();
                        Session["full_name"] = reader.GetValue(1).ToString().Trim();
                        Session["role"] = "user";
                        Session["account_status"] = reader.GetValue(10).ToString().Trim();
                    }
                    Response.Redirect("homepage.aspx");
                }
            }
            catch
            {
                Response.Write("<script>alert('Invalid Login Credential!')</script>");
            }
        }
    }
}