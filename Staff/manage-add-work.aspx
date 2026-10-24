<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" AutoEventWireup="true" CodeFile="manage-add-work.aspx.cs" Inherits="Staff_manage_add_work" %>

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
                    <h3>Manage Work</h3>
                </div>
            </div>
            <div class="heading-actions">
                <a class="btn btn-outline-secondary btn-sm" href="add-work.aspx"><i class="bi bi-arrow-left" aria-hidden="true"></i>Add Work</a>
            </div>
        </div>

        <section class="panel">
            <div class="panel-header">
                <input class="form-control form-control-sm table-search" type="search" placeholder="Search..." data-table-search="ordersTable" aria-label="Search orders">
            </div>

            <div class="table-responsive">
                <table class="table align-middle mb-0" id="ordersTable" data-searchable-table>
                    <thead>
                        <tr>

                            <th>Client Name</th>
                            <th>Work</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <asp:Repeater ID="rptbinddata" runat="server" OnItemCommand="rptbinddata_ItemCommand">
                            <ItemTemplate>

                                <tr>
                                    <td class="fw-semibold"><%# Eval("client_id") %></td>
                                    <td><%# Eval("work_details") %></td>
                                    <td><%# Eval("create_date") %></td>
                                    <td><%# Eval("working_time") %></td>
                                    <td class="text-end">
                                        <a class="btn btn-blue btn-sm" href="edit-work.aspx?ref=<%#  Eval("id") %>"  title="Edit">Edit</a> 
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

