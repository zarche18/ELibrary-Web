<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="UserViewProfile.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/generaluser.png" width="150px" />
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                     <h6>Your Profile </h6> 
                                    <span>Account Status -</span>

                                    <asp:Label ID="Label1" runat="server" Text="Your status" class="badge badge-pill badge-success"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                      <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullName" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtDOB" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                          <div class="row">
                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtContactNo" class="form-control" runat="server" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmailID" class="form-control" runat="server" TextMode="Email" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlCity" runat="server" class="form-control">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                 <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtCity" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-4">
                                 <label>Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPinCode" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullAddress" class="form-control" runat="server" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                     <span class="badge badge-info">Login Credential</span>
                                </center>                               
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtMemberID" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                 <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtOldPassword" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-4">
                                 <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtNewPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-8 mx-auto">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-primary btn-block" />
                            </div>
                        </div>

                    </div>
                </div>
            </div> <%--User Profile--%>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/books_proile.png" width="150px" />
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                     <h6>Your Issued Books </h6>
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Label ID="Label2" runat="server" Text="Info about book due date" class="badge badge-pill badge-info"></asp:Label>
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
                                <asp:GridView ID="grdBookedInfoList" runat="server" class="table table-striped table-bordered"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div><%-- Your Book Issue--%>
        </div> 

    </div>
</asp:Content>
