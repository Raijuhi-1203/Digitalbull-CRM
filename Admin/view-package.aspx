<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="view-package.aspx.cs" Inherits="Admin_view_package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


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
                <div class="panel needs-validation">

                    <div class="row g-3">
                        <div class="col-md-4" style="pointer-events:none;">
                            <label class="form-label" for="firstName">Name</label>
                            <asp:TextBox runat="server" class="form-control" ID="name" type="text" required></asp:TextBox>

                        </div>
                        <div class="col-md-4" style="pointer-events:none;">
                            <label class="form-label" for="lastName">Price</label>
                            <asp:TextBox runat="server" class="form-control" ID="price" type="text" required></asp:TextBox>

                        </div>

                        <div class="col-12" style="pointer-events:none;">
                            <label class="form-label" for="notes">Details</label>
                            <asp:TextBox ClientIDMode="Static" runat="server" class="form-control" ID="details" TextMode="MultiLine"></asp:TextBox>
                        </div>

                    </div>
                    <div class="d-flex flex-wrap justify-content-end gap-2 mt-4">
                        <a class="btn btn-outline-secondary" href="manage-client.aspx">Cancel</a>
                        <button id="btnsend" runat="server" onserverclick="btnsend_ServerClick" class="btn btn-primary" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Delete</button>
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
