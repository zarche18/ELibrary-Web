<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
     <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/generaluser.png" />
                                </center>                                
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
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
                                <label> Member ID</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="txtMemberID" runat="server" placeholder="Member ID" >
                                   </asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label> Password</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button ID="btnLogin" runat="server" class="btn btn-success btn-block" Text="Login" OnClick="btnLogin_Click" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <a href="SignUp.aspx">
                                        <asp:Button ID="btnSignup" runat="server" CssClass="btn btn-info btn-block" Text="Signup"/>
                                    </a> 
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                
                <a href="homepage.aspx"> << Back to Home</a>
                
            </div>
        </div>
    
    </div>
</asp:Content>
