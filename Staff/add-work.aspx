<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="add-work.aspx.cs" Inherits="Staff_add_work" %>

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
                    <h3>Add Work</h3>
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

                        <div class="col-md-6">
                            <label class="form-label" for="notes">Working Hour</label>
                            <asp:TextBox runat="server" class="form-control" ID="wtime"></asp:TextBox>
                        </div>

                        <div class="col-12">
                            <label class="form-label" for="notes">Work Details</label>
                            <asp:TextBox ClientIDMode="Static" runat="server" class="form-control" ID="details" TextMode="MultiLine"></asp:TextBox>
                        </div>



                    </div>

                    <div class="d-flex flex-wrap justify-content-end gap-2 mt-4">
                        <a class="btn btn-outline-secondary" href="manage-add-work.aspx">Cancel</a>
                        <button runat="server" id="btnsend" onserverclick="btnsend_ServerClick" class="btn btn-primary" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Add</button>
                    </div>
                </div>
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
