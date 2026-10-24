<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" AutoEventWireup="true" CodeFile="assign-client.aspx.cs" Inherits="Admin_assign_client" %>

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
                            <th>Status</th>
                            <th class="text-end">View</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <asp:Repeater ID="rptbinddata" runat="server" OnItemCommand="rptbinddata_ItemCommand">
                            <ItemTemplate>

                                <tr>
                                    <td class="fw-semibold"><%# Eval("client_id") %></td>
                                    <td class="fw-semibold"><%# Eval("statuss") %></td>
                                    <td class="text-end">
                                        <asp:Button class="btn btn-red btn-sm" runat="server" ID="btndel" CommandName="View" CommandArgument='<%# Eval("client_id") %>' Text="View Details" />
                                    </td>
                                    <td class="text-end">
                                        <asp:Button class="btn btn-green btn-sm" runat="server" ID="btnaccept" CommandName="Accept" CommandArgument='<%# Eval("id") %>' Text="Accept" Visible='<%# !string.Equals(Eval("statuss").ToString(), "Accept", StringComparison.OrdinalIgnoreCase) && !string.Equals(Eval("statuss").ToString(), "Decline", StringComparison.OrdinalIgnoreCase) %>' />
                                        <asp:Button class="btn btn-red btn-sm" runat="server" ID="btndecline" CommandName="Decline" CommandArgument='<%# Eval("id") %>' Text="Decline" Visible='<%# !string.Equals(Eval("statuss").ToString(), "Accept", StringComparison.OrdinalIgnoreCase) && !string.Equals(Eval("statuss").ToString(), "Decline", StringComparison.OrdinalIgnoreCase) %>' />
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

