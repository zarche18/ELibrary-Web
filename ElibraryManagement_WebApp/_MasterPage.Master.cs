using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagement_WebApp
{
    public partial class _MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] != null && Session["role"].Equals(""))
                {
                    lkUserLogin.Visible = true;
                    lkSignup.Visible = true;

                    lkHelloUser.Visible = false;
                    lkLogout.Visible = false;

                    lkAdminLogin.Visible = true;
                    lkAuthorManager.Visible = false;
                    lkPublisherManagement.Visible = false;
                    lkBookInventory.Visible = false;
                    lkBookIssuing.Visible = false;
                    lkMemberManagement.Visible = false;
                }
                else if (Session["role"] != null &&  Session["role"].Equals("user"))
                {
                    lkUserLogin.Visible = false;
                    lkSignup.Visible = false;

                    lkHelloUser.Visible = true;
                    lkHelloUser.Text = "Hello " + Session["full_name"];
                    lkLogout.Visible = true;

                    lkAdminLogin.Visible = true;
                    lkAuthorManager.Visible = false;
                    lkPublisherManagement.Visible = false;
                    lkBookInventory.Visible = false;
                    lkBookIssuing.Visible = false;
                    lkMemberManagement.Visible = false;
                }
                else if (Session["role"] != null && Session["role"].Equals("admin"))
                {
                    lkUserLogin.Visible = false;
                    lkSignup.Visible = false;

                    lkHelloUser.Visible = true;
                    lkHelloUser.Text = "Hello Admin";
                    lkLogout.Visible = true;

                    lkAdminLogin.Visible = false;
                    lkAuthorManager.Visible = true;
                    lkPublisherManagement.Visible = true;
                    lkBookInventory.Visible = true;
                    lkBookIssuing.Visible = true;
                    lkMemberManagement.Visible = true;
                }
            }
            catch
            {

            }
        }

        protected void lkAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void lkAuthorManager_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }

        protected void lkPublisherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }

        protected void lkBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("BooksInventory.aspx");
        }

        protected void lkBookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookingIssue.aspx");
        }

        protected void lkMemberManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberManagement.aspx");
        }

        protected void lkLogout_Click(object sender, EventArgs e)
        {
            Session["member_id"] = "";
            Session["full_name"] = "";
            Session["role"] = "";
            Session["account_status"] = "";

            lkUserLogin.Visible = true;
            lkSignup.Visible = true;

            lkHelloUser.Visible = false;
            lkLogout.Visible = false;

            lkAdminLogin.Visible = true;
            lkAuthorManager.Visible = false;
            lkPublisherManagement.Visible = false;
            lkBookInventory.Visible = false;
            lkBookIssuing.Visible = false;
            lkMemberManagement.Visible = false;

            Response.Redirect("homepage.aspx");
        }

        protected void lkUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void lkSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void lkViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("BooksInventory.aspx");
        }
    }
}