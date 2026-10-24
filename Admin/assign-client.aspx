<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="assign-client.aspx.cs" Inherits="Admin_assign_client" %>

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
                    <h3>Assign Client</h3>
                </div>
            </div>
        </div>

        <section class="row g-3">
            <div class="col-12 col-xl-12">
                <div class="panel">

                    <div class="row g-3">
                        
                        <div class="col-md-6">
                            <label class="form-label" for="name">Client</label>
                            <span style="color: red;">*</span>
                            <asp:DropDownList ID="dblclient" AppendDataBoundItems="True" class="selectpicker form-control" data-live-search="true" runat="server">
                            </asp:DropDownList>
                        </div>
                        
                        <div class="col-md-12">
                            <label class="form-label" for="mobileno">Staff</label>
                            <span style="color: red;">*</span>
                            <br />
                            <asp:Repeater ID="rptStaff" runat="server">
                                <ItemTemplate>
                                    <label class="staff-option">
                                        <input type="checkbox"
                                            name="selectedStaff"
                                            value='<%# Eval("name") %>'
                                            class="staff-option" />
                                        <span><%# Eval("name") %></span>
                                    </label>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>

                    </div>

                    <div class="d-flex flex-wrap justify-content-end gap-2 mt-4">
                        <a class="btn btn-outline-secondary" href="manage-client.aspx">Cancel</a>
                        <button runat="server" id="btnsend" onserverclick="btnsend_ServerClick" class="btn btn-primary" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Add</button>
                    </div>
                </div>
            </div>

        </section>

    </div>

    <div class="container-fluid px-3 px-lg-4 py-4">
        <div class="page-heading">
            <div class="page-heading-copy">
                <span class="page-icon"><i class="bi bi-person-plus" aria-hidden="true"></i></span>
                <div>
                    <h3>Manage Assign Client</h3>
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

                            <th>Client Name</th>
                            <th>Staff Name</th>
                            <th>Status</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <asp:Repeater ID="rptbinddata" runat="server" OnItemCommand="rptbinddata_ItemCommand">
                            <ItemTemplate>

                                <tr>
                                    <td class="fw-semibold"><%# Eval("client_id") %></td>
                                    <td class="fw-semibold"><%# Eval("staff_id") %></td>
                                    <td class="fw-semibold"><%# Eval("statuss") %></td>

                                    <td class="text-end">
                                        <asp:Button class="btn btn-red btn-sm" runat="server" ID="btndel" CommandName="Delete" CommandArgument='<%# Eval("id") %>' Text="Delete" />

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

