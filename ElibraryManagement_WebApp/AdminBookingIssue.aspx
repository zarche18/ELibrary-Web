<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminBookingIssue.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h5>
                                        Books Issuing
                                    </h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/books.png" width="100px"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                               <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                               <label>Member ID</label>
                                <div class="form-group"> 
                                    <asp:TextBox ID="txtMemberID" runat="server" class="form-control" placeholder="Member ID"></asp:TextBox> 
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Book ID</label>
                                <div class="form-group">
                                     <div class="input-group">
                                         <asp:TextBox ID="txtBookID" runat="server" class="form-control" placeholder="Book ID"></asp:TextBox>
                                         <asp:Button ID="btnGo" Text="Go" runat="server" class="btn btn-dark" />
                                     </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                               <label>Member Name</label>
                                <div class="form-group"> 
                                    <asp:TextBox ID="txtMemberName" runat="server" class="form-control" placeholder="Member Name" ReadOnly="true"></asp:TextBox> 
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Book Name</label>
                                <div class="form-group"> 
                                     <asp:TextBox ID="txtBookName" runat="server" class="form-control" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-6">
                               <label>Start Date</label>
                                <div class="form-group"> 
                                    <asp:TextBox ID="txtStartDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox> 
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>End Date</label>
                                <div class="form-group"> 
                                     <asp:TextBox ID="txtEndDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6"> 
                                 <asp:Button ID="btnISsue" Text="Issue" runat="server" class="btn btn-primary btn-block" />
                            </div>
                            <div class="col-md-6"> 
                                <asp:Button ID="btnReturn" Text="Return" runat="server" class="btn btn-success btn-block" />
                            </div>
                        </div>

                    </div>
                </div>
                <a href="homepage.aspx"> >> Back to home</a>
            </div> <%--Book Issue--%>
            
            <div class="col-md-8">
                 <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">  
                                <center>
                                     <h5>Issued Book List</h5>
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
                                <asp:GridView ID="grdBookIssueList" runat="server" class="table table-striped table-bordered"></asp:GridView>
                            </div>
                        </div>
                    </div>
                  </div>
            </div> <%--Book Issue List--%>
             
        </div>
    </div>

</asp:Content>
