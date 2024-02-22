﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminPublisherManagement.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript"> 
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-md-5">
                <div class="card">
                    <div class="card-body"> 
                        <div class="row">
                            <div class="col">
                                <center>
                                    <label> Publisher Detail</label>
                                </center>                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/publisher.png" width="100px" />
                                </center> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                Publisher ID
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtPublisherID" runat="server" class="form-control" placeholder="ID"></asp:TextBox>
                                        <asp:Button ID="btnGo" runat="server" Text="Go" class="btn btn-dark" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                Full Name
                                <div class="form-group"> 
                                        <asp:TextBox ID="txtFullName" runat="server" class="form-control" placeholder="Full Name"></asp:TextBox> 
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button ID="btnAdd" runat="server" class="btn btn-info btn-block" Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnUpdate" runat="server" class="btn btn-warning btn-block" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-md-4">
                                 <asp:Button ID="btnDelete" runat="server" class="btn btn-danger btn-block" Text="Delete" OnClick="btnDelete_Click" />
                            </div>
                        </div>
                    </div>
                </div>
           
             </div> <%--Publisher Detail--%>

            <div class="col-md-7">
                 <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <label> Publisher List</label>
                                </center>                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />                            
                            </div>
                        </div>
                         <div class="row">
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryConnectionString %>" SelectCommand="SELECT * FROM [tbl_publisher_master]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="grdPublisherList" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <%--Publisher List--%>
        </div>
    </div> 

</asp:Content>
