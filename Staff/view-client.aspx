<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" AutoEventWireup="true" CodeFile="view-client.aspx.cs" Inherits="Admin_view_client" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        table {
            width: 80%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>

    <div class="container-fluid px-3 px-lg-4 py-4">

        <div class="page-heading">
            <div class="page-heading-copy">
                <span class="page-icon"><i class="bi bi-person-plus" aria-hidden="true"></i></span>
                <div>
                    <h3>View Details</h3>
                </div>
            </div>
        </div>

        <section class="row g-3">
            <div class="col-12 col-xl-12">
                <div class="panel">

                    <div class="row g-3">

                        <table>
                            <tr>
                                <td>Business Name</td>
                                <td>
                                    <asp:Label runat="server" ID="bname" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Established Year</td>
                                <td>
                                    <asp:Label runat="server" ID="eyear" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Business Contact Number</td>
                                <td>
                                    <asp:Label runat="server" ID="bmob" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Official Mail</td>
                                <td>
                                    <asp:Label runat="server" ID="omail" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Facebook</td>
                                <td>
                                    <asp:Label runat="server" ID="fb" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Instagram</td>
                                <td>
                                    <asp:Label runat="server" ID="insta" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Youtube</td>
                                <td>
                                    <asp:Label runat="server" ID="yt" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>GMB</td>
                                <td>
                                    <asp:Label runat="server" ID="gmb" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Twitter</td>
                                <td>
                                    <asp:Label runat="server" ID="x" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>LinkdenIn</td>
                                <td>
                                    <asp:Label runat="server" ID="linkedin" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Website</td>
                                <td>
                                    <asp:Label runat="server" ID="web" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Package</td>
                                <td>
                                    <asp:Label runat="server" ID="dblpackage" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Address</td>
                                <td>
                                    <asp:Label runat="server" ID="address" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Vision</td>
                                <td>
                                    <asp:Label runat="server" ID="vision" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Mision</td>
                                <td>
                                    <asp:Label runat="server" ID="mision" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Description</td>
                                <td>
                                    <asp:Label runat="server" ID="descp" required></asp:Label></td>

                            </tr>

                            <tr>
                                <td>Notes</td>
                                <td>
                                    <asp:Label runat="server" ID="notes" required></asp:Label></td>

                            </tr>
                        </table>

                    </div>

                </div>
            </div>

        </section>

    </div>
</asp:Content>
