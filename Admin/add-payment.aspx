<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="add-payment.aspx.cs" Inherits="Admin_add_payment" %>

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
                    <h3>Add Payment</h3>
                </div>
            </div>
        </div>

        <section class="row g-3">
            <div class="col-12 col-xl-12">
                <div class="panel needs-validation">

                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label" for="pack">Client</label>
                            <span style="color: red;">*</span>
                            <asp:DropDownList ID="dblclient" AppendDataBoundItems="True" class="selectpicker form-control" data-live-search="true" runat="server">
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label" for="pack">Service</label>
                            <span style="color: red;">*</span>
                            <asp:DropDownList ID="dblservice" AppendDataBoundItems="True" class="selectpicker form-control" data-live-search="true" runat="server">
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label" for="firstName">Amount</label>
                            <asp:TextBox runat="server" class="form-control" ID="amount" type="text" required></asp:TextBox>
                        </div>


                    </div>
                    <div class="d-flex flex-wrap justify-content-end gap-2 mt-4">
                        <a class="btn btn-outline-secondary" href="manage-payment.aspx">Cancel</a>
                        <button id="btnsend" runat="server" onserverclick="btnsend_ServerClick" class="btn btn-primary" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Create</button>
                    </div>
                </div>
            </div>

        </section>

    </div>



</asp:Content>

