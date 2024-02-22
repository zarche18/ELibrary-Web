<%@ Page Title="" Language="C#" MasterPageFile="~/_MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminAuthorManagement.aspx.cs" Inherits="ElibraryManagement_WebApp.WebForm8" %>

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


            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h6>Author Detail</h6>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/writer.png" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtAuthorID" class="form-control" runat="server" placeholder="Author ID"></asp:TextBox>
                                        <asp:Button ID="btnGo" runat="server" Text="Go" class="btn btn-dark btn-sm" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAuthorName" class="form-control" runat="server" placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-success btn-block" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-md-4 mx-auto">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-warning  btn-block" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-md-4 mx-auto">
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-danger  btn-block" OnClick="btnDelete_Click" />
                            </div>
                        </div>

                    </div>
                </div>

                <a href="homepage.aspx"><< Back to home</a>

            </div>
            <%--Author Detail--%>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h6>Author List</h6>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryConnectionString %>" SelectCommand="SELECT * FROM [tbl_author_master]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="grdAuthorList" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False"  DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--Author List--%>
        </div>
    </div>

</asp:Content>
