<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="MemberManagement.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
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
                                         <asp:LinkButton ID="lkGo" runat="server"  class="btn btn-primary btn-sm" OnClick="lkGo_Click">
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
                                               <asp:TextBox ID="txtAccountStatus" class="form-control" placeholder="Status" runat="server" ReadOnly="true"></asp:TextBox>
                                               
                                                <asp:LinkButton ID="btnActive" runat="server"  class="btn btn-success btn-sm mr-1" OnClick="btnActive_Click">
                                                   <i class="fas fa-check-circle"></i>
                                                </asp:LinkButton>

                                                 <asp:LinkButton ID="btnPending" runat="server"  class="btn btn-warning btn-sm mr-1" OnClick="btnPending_Click">
                                                   <i class="far fa-pause-circle"></i>
                                                </asp:LinkButton>

                                                 <asp:LinkButton ID="btnDelete" runat="server"  class="btn btn-danger btn-sm" OnClick="btnDelete_Click">
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
                            <div class="col-md-4">
                                <label> State </label>
                                 <asp:TextBox ID="txtState" runat="server"  class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                 <label> City </label>
                                <asp:TextBox ID="txtCity" runat="server"  class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                 <label> Pin Code </label>
                                <asp:TextBox ID="txtPinCode" runat="server"  class="form-control" TextMode="Number" ReadOnly="true"></asp:TextBox>
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
                                   <asp:Button ID="btnDeleteUser" runat="server" Text="Delete User Permanently" class="btn btn-danger btn-block" OnClick="btnDeleteUser_Click"/>  
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryConnectionString %>" SelectCommand="SELECT * FROM [tbl_member_master]"></asp:SqlDataSource>
                           <div class="col">
                               <asp:GridView ID="grdMemberList" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                   <Columns>
                                       <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                       <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                       <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                       <asp:BoundField DataField="contactno" HeaderText="Contact" SortExpression="contactno" />
                                       <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                       <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                       <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                   </Columns>
                               </asp:GridView>
                           </div>
                       </div>

                   </div>
               </div>
           </div> <%--Member List--%>

       </div>
    </div>
</asp:Content>
