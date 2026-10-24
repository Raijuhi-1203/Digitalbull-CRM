<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="social-media.aspx.cs" Inherits="Admin_social_media" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        /* Keep all table row data in one line */
        #ordersTable {
            width: 100%;
            white-space: nowrap;
            border-collapse: collapse;
        }

            #ordersTable th,
            #ordersTable td {
                padding: 8px 10px;
                font-size: 13px;
                white-space: nowrap;
            }

                /* Social media action links */
                #ordersTable td a {
                    display: inline-block;
                    text-decoration: none;
                    margin: 0 3px;
                }

        /* Horizontal scrolling */
        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        /* Keep table headings in one line */
        #ordersTable thead th {
            white-space: nowrap;
            font-weight: 600;
        }
    </style>
    <!-- Toast Container -->
    <div id="toastContainer" class="toast-container">

        <div id="toastMessage" class="custom-toast">

            <div class="toast-icon">
                <i id="toastIcon" class="bi bi-check-circle"></i>
            </div>

            <div class="toast-content">
                <div id="toastTitle" class="toast-title">Success</div>
                <div id="toastText" class="toast-text">
                    Data saved successfully.
                </div>
            </div>

            <button type="button" class="toast-close" onclick="hideToast()">
                <i class="fas fa-times"></i>
            </button>

        </div>

    </div>

    <div class="container-fluid px-3 px-lg-4 py-4">

        <div class="page-heading">
            <div class="page-heading-copy">
                <span class="page-icon"><i class="bi bi-person-plus" aria-hidden="true"></i></span>
                <div>
                    <h3>Manage Social Media</h3>
                </div>
            </div>
        </div>

        <section class="panel">
            <div class="panel-header">
                <input class="form-control form-control-sm table-search" type="search" placeholder="Search orders" data-table-search="ordersTable" aria-label="Search orders">
            </div>

            <div class="table-responsive">
                <table class="table align-middle mb-0" id="ordersTable" data-searchable-table>
                    <thead>
                        <tr>

                            <th>Name</th>
                            <th>Action</th>
                            <th>View</th>
                            <th>Subscribe</th>
                            <th>Like</th>
                            <th>Comment</th>
                            <th>Follower</th>
                            <th>Share</th>
                            <th>Review</th>
                            <th>Month</th>
                        </tr>
                    </thead>
                    <tbody>

                        <asp:Repeater ID="rptbinddata" runat="server" OnItemCommand="rptbinddata_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="fw-semibold"><%# Eval("client_name") %></td>
                                    <td>
                                        <a href='<%# Eval("fb") %>' style="color: blue;"><i class="fa fa-facebook-square"></i></a>|
                                        <a href='<%# Eval("insta") %>' style="color: #b52165;"><i class="fa fa-instagram"></i></a>|
                                        <a href='<%# Eval("yt") %>' style="color: #ff0007;"><i class="fa fa-youtube"></i></a>|
                                        <a href='<%# Eval("gmb") %>' style="color: #2fa004;"><i class="fa fa-google"></i></a>|
                                        <a href='<%# Eval("linkedin") %>' style="color: #1083b8;"><i class="fa fa-linkedin-square"></i></a>|
                                        <a href='<%# Eval("twitter") %>' style="color: #0dd5ea;"><i class="fa fa-twitter-square"></i></a>
                                    </td>
                                    <td><%# Eval("views2") %></td>
                                    <td><%# Eval("subscribe2") %></td>
                                    <td><%# Eval("likes2") %></td>
                                    <td><%# Eval("cmt2") %></td>
                                    <td><%# Eval("followers2") %></td>
                                    <td><%# Eval("group_share2") %></td>
                                    <td><%# Eval("review2") %></td>
                                    <td><%# Eval("month_name") %></td>

                                </tr>

                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        </section>
    </div>

</asp:Content>
