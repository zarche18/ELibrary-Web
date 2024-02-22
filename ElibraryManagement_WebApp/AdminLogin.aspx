<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">     
     <div class="container">
         <div class="row">
             <div class="col-md-6">
                 <div class="card">
                     <div class="card-body">

                         <div class="row">
                             <div class="col">
                                 <center>
                                       <img src="imgs/adminuser.png" width="150px" />
                                 </center>                               
                             </div>
                         </div>

                         <div class="row">
                             <div class="col">
                                 <center>
                                      <h3> Admin Login</h3>
                                 </center>                                
                             </div>
                         </div>

                         <div class="row">
                             <div class="col">
                                 <hr />
                             </div>
                         </div>

                         <div class="row">
                             <div class="col">
                                 <label>Admin ID</label>
                                 <div class="form-group">
                                      <asp:TextBox ID="txtAminID" CssClass="form-control" runat="server" placeholder="Admin ID"></asp:TextBox>
                                 </div>
                             </div>
                         </div>

                         <div class="row">
                             <div class="col">
                                <label>Password</label>
                                 <div class="form-group">
                                     <asp:TextBox runat="server" ID="txtAdminPassword" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                 </div>
                             </div>
                         </div>

                         <div class="row">
                             <div class="col">
                                 <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-success btn-block" runat="server" OnClick="btnLogin_Click" />
                             </div>
                         </div>

                     </div>
                 </div>
             </div>
         </div>
     </div>
</asp:Content>
