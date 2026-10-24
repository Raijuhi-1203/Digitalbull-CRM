<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" AutoEventWireup="true" CodeFile="social-media.aspx.cs" Inherits="Staff_social_media" %>

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
                    <h3>Add Social Media</h3>
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

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Views</label>
                            <asp:TextBox runat="server" class="form-control" ID="views"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Subscribe</label>
                            <asp:TextBox runat="server" class="form-control" ID="subscribe"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Like</label>
                            <asp:TextBox runat="server" class="form-control" ID="like"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Comment</label>
                            <asp:TextBox runat="server" class="form-control" ID="cmt"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Follower</label>
                            <asp:TextBox runat="server" class="form-control" ID="follower"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Group Share</label>
                            <asp:TextBox runat="server" class="form-control" ID="gshare"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Review</label>
                            <asp:TextBox runat="server" class="form-control" ID="review"></asp:TextBox>
                        </div>

                    </div>

                    <div class="d-flex flex-wrap justify-content-end gap-2 mt-4">
                        <button runat="server" id="btnsend" onserverclick="btnsend_ServerClick" class="btn btn-primary" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Add</button>
                    </div>
                </div>
            </div>

        </section>

    </div>

</asp:Content>
