<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="manage-client.aspx.cs" Inherits="Admin_manage_client" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                    <h3>Manage Client</h3>
                </div>
            </div>
            <div class="heading-actions">
                <a class="btn btn-outline-secondary btn-sm" href="add-client.aspx"><i class="bi bi-arrow-left" aria-hidden="true"></i>Add Client</a>
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
                            <th>Business Name</th>
                            <th>Mobile No.</th>
                            <th>Package</th>
                            <th>Onboarding Date</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <asp:Repeater ID="rptbinddata" runat="server" OnItemCommand="rptbinddata_ItemCommand">
                            <ItemTemplate>

                                <tr>
                                    <td class="fw-semibold"><%# Eval("business_name") %></td>
                                    <td class="fw-semibold"><%# Eval("mobileno") %></td>
                                    <td class="fw-semibold"><%# Eval("package") %></td>
                                    <td class="fw-semibold"><%# Eval("create_date") %></td>
                                    <td class="text-end">
                                        <a class="btn btn-red btn-sm" href="view-client.aspx?ref=<%#  Eval("id") %>" title="Delete">Delete</a> |
                                        <a class="btn btn-blue btn-sm" href="edit-client.aspx?ref=<%#  Eval("id") %>" title="Edit">Edit</a> |
                                        <a class="btn btn-green btn-sm" href="view-client.aspx?ref=<%#  Eval("id") %>" title="View">View</a>
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        </section>
    </div>
</asp:Content>
