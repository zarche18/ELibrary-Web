﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="BooksInventory.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm12" %>

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
                                    <h5>Book Details</h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/books.png" width="100px" />
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
                                <asp:FileUpload ID="fuBooksInfo" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Book ID</lable>
                                <div class="input-group">
                                    <asp:TextBox ID="txtBookID" class="form-control" placeholder="Book ID" runat="server"></asp:TextBox>
                                    <asp:LinkButton ID="lkbGo" runat="server" class="btn btn-dark btn-sm">Go</asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <lable>Book Name</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookName" class="form-control" placeholder="Book Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <lable>Language</lable>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlLanguage" class="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <lable>Publisher Name</lable>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlPublisherName" class="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <lable>Author Name</lable>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlAuthorName" class="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <lable>Publish Date</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPublishDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <lable>Genre</lable>
                                <div class="form-group">
                                    <asp:ListBox ID="lbGenre" SelectionMode="Multiple" class="form-control" runat="server" Rows="5">
                                        <asp:ListItem Text="Action" Value="Action"></asp:ListItem>
                                        <asp:ListItem Text="Adventure" Value="Adventure"></asp:ListItem>
                                        <asp:ListItem Text="Commic Book" Value="Commic Book"></asp:ListItem>
                                        <asp:ListItem Text="Self Help" Value="Self Help"></asp:ListItem> 
                                        <asp:ListItem Text="Motivation" Value="Motivation"></asp:ListItem> 
                                    </asp:ListBox>  
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <lable>Edition</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEdition" class="form-control" placeholder="Edition" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <lable>Book Cost(per unit)</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookCost" class="form-control" placeholder="Cost" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <lable>Pages</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPages" class="form-control" placeholder="Pages" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <lable>Actual Stock</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtActualStock" class="form-control" placeholder="Actual Stock" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <lable>Current Stock</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtCurrentStock" class="form-control" placeholder="Current Stock" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <lable>Issued Books</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtIssuedBooks" class="form-control" placeholder="Issued Books" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <lable>Book Description</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookDescription" class="form-control" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-primary btn-block" />
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-warning btn-block" />
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-danger btn-block" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%--Book Details--%>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h5>Inventory List</h5>
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
                                <asp:GridView ID="grdBookInventoryList" class="table table-striped table-bordered" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%--Inventory List--%>
        </div>
    </div>
</asp:Content>