<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="assign-work.aspx.cs" Inherits="Admin_assign_work" %>

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
                    <h3>Manage Assign Work</h3>
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
                            <th>Date</th>
                            <th>Work Details</th>
                            <th>Status</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <asp:Repeater ID="rptbinddata" runat="server" OnItemCommand="rptbinddata_ItemCommand">
                            <ItemTemplate>

                                <tr>
                                    <td class="fw-semibold"><%# Eval("client_id") %></td>
                                    <td class="fw-semibold"><%# Eval("create_date") %></td>
                                    <td class="fw-semibold"><%# Eval("work_details") %></td>
                                    <td class="fw-semibold"><%# Eval("statuss") %></td>
                                    <td class="text-end">
                                        <asp:Button class="btn btn-green btn-sm" runat="server" ID="btnaccept" CommandName="Accept" CommandArgument='<%# Eval("id") %>' Text="Accept" Visible='<%# !string.Equals(Eval("statuss").ToString(), "Accept", StringComparison.OrdinalIgnoreCase) && !string.Equals(Eval("statuss").ToString(), "Decline", StringComparison.OrdinalIgnoreCase) && !string.Equals(Eval("statuss").ToString(), "Done", StringComparison.OrdinalIgnoreCase) %>' />
                                        <asp:Button class="btn btn-red btn-sm" runat="server" ID="btndecline" CommandName="Decline" CommandArgument='<%# Eval("id") %>' Text="Decline" Visible='<%# !string.Equals(Eval("statuss").ToString(), "Accept", StringComparison.OrdinalIgnoreCase) && !string.Equals(Eval("statuss").ToString(), "Decline", StringComparison.OrdinalIgnoreCase) && !string.Equals(Eval("statuss").ToString(), "Done", StringComparison.OrdinalIgnoreCase) %>' />
                                        <br />
                                        <asp:Button class="btn btn-blue btn-sm mt-1" runat="server" ID="btninprogress" CommandName="Progress" CommandArgument='<%# Eval("id") %>' Text="In Progress" Visible='<%# !string.Equals(Eval("statuss").ToString(), "Done", StringComparison.OrdinalIgnoreCase) %>'  />
                                        <asp:Button class="btn btn-green btn-sm mt-1" runat="server" ID="btndone" CommandName="Done" CommandArgument='<%# Eval("id") %>' Text="Done" Visible='<%# !string.Equals(Eval("statuss").ToString(), "Done", StringComparison.OrdinalIgnoreCase) %>' />
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        </section>
    </div>

    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            CKEDITOR.replace('details', {
                height: 300,

                toolbar: [
                    {
                        name: 'basicstyles',
                        items: ['Bold', 'Italic', 'Underline', 'Strike']
                    },
                    {
                        name: 'paragraph',
                        items: [
                            'NumberedList',
                            'BulletedList',
                            '-',
                            'Outdent',
                            'Indent',
                            'Blockquote'
                        ]
                    },
                    {
                        name: 'styles',
                        items: ['Format']
                    },
                    {
                        name: 'insert',
                        items: ['Link', 'Table']
                    },
                    {
                        name: 'tools',
                        items: ['Maximize']
                    }
                ]
            });

        });
    </script>

</asp:Content>
