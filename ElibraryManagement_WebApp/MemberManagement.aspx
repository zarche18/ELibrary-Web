<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="MemberManagement.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm11" %>
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
                                    <h5> Member Details</h5>
                               </center>                              
                           </div>
                       </div>
                        <div class="row">
                           <div class="col">
                               <center>
                                   <img src="imgs/generaluser.png" width="100px" />
                               </center>                              
                           </div>
                       </div>
                        <div class="row">
                           <div class="col">
                              <hr />                           
                           </div>
                       </div>
                        <div class="row">
                           <div class="col-md-3">
                                <label>Member ID</label>        
                               <div class="form-group">
                                   <div class="input-group">
                                       <asp:TextBox ID="txtMemberID" class="form-control" placeholder="ID" runat="server"></asp:TextBox>
                                         <asp:LinkButton ID="lkGo" runat="server"  class="btn btn-primary btn-sm">
                                                   Go
                                                </asp:LinkButton>
                                   </div>
                               </div>
                           </div>
                            <div class="col-md-4">
                                <label>Full Name</label>  
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullName" class="form-control" placeholder="Full Name" runat="server" ReadOnly="true"></asp:TextBox>
                               </div>
                           </div>
                            <div class="col-md-5">
                               <label>Account Status</label>  
                                <div class="form-group">
                                      <div class="input-group">
                                            <div class="input-group">
                                               <asp:TextBox ID="txtAccountStatus" class="form-control" placeholder="Status" runat="server"></asp:TextBox>
                                               
                                                <asp:LinkButton ID="btnActive" runat="server"  class="btn btn-success btn-sm mr-1">
                                                   <i class="fas fa-check-circle"></i>
                                                </asp:LinkButton>

                                                 <asp:LinkButton ID="btnPending" runat="server"  class="btn btn-warning btn-sm mr-1">
                                                   <i class="far fa-pause-circle"></i>
                                                </asp:LinkButton>

                                                 <asp:LinkButton ID="btnDelete" runat="server"  class="btn btn-danger btn-sm">
                                                   <i class="fas fa-times-circle"></i>
                                                </asp:LinkButton> 
                                           </div>
                                      </div>
                               </div>
                           </div>
                       </div>

                       <div class="row">
                           <div class="col-md-4">
                                <label>DOB</label>        
                               <div class="form-group">
                                    <asp:TextBox ID="txtDOB" class="form-control" placeholder="DOB" runat="server" ReadOnly="true" TextMode="Date"></asp:TextBox>
                               </div>
                           </div>
                            <div class="col-md-4">
                                <label>Contact No</label>  
                                <div class="form-group">
                                    <asp:TextBox ID="txtContactNo" class="form-control" placeholder="Contact No" runat="server" ReadOnly="true"></asp:TextBox>
                               </div>
                           </div>
                            <div class="col-md-4">
                               <label>Email</label>  
                                 <div class="form-group">
                                    <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server" ReadOnly="true"></asp:TextBox>
                               </div>
                           </div>
                       </div>

                       <div class="row">
                           <div class="col">
                                <label>Full Postal Address</label>        
                               <div class="form-group">
                                    <asp:TextBox ID="txtFullPostalAddress" class="form-control" placeholder="Full Postal Address" runat="server" ReadOnly="true" TextMode="MultiLine" Rows="2"></asp:TextBox>
                               </div>
                           </div> 
                       </div>

                       <div class="row">
                           <div class="col">     
                               <div class="form-group">
                                   <asp:Button ID="btnDeleteUser" runat="server" Text="Delete User Permanently" class="btn btn-danger btn-block" />  
                               </div>
                           </div> 
                       </div>
                   </div>
               </div>
               <a href="homepage.aspx"> << Back to home</a>
           </div> <%--Member Details--%>

           <div class="col-md-7">
                <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                    <h5> Member List</h5>
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
                               <asp:GridView ID="grdMemberList" class="table table-striped table-bordered" runat="server"></asp:GridView>
                           </div>
                       </div>

                   </div>
               </div>
           </div> <%--Member List--%>

       </div>
    </div>
</asp:Content>
