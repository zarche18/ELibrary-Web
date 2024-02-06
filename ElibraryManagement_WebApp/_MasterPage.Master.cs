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
    }
}