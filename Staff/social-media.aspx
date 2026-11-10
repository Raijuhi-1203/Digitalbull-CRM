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
                        
                        <div class="col-md-6">
                            <label class="form-label" for="notes">GMB Review</label>
                            <asp:TextBox runat="server" class="form-control" ID="gmbreview"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <label class="form-label" for="notes">Facebook Views</label>
                            <asp:TextBox runat="server" class="form-control" ID="fbviews"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-2">
                            <label class="form-label" for="notes">Facebook Like</label>
                            <asp:TextBox runat="server" class="form-control" ID="fblike"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-2">
                            <label class="form-label" for="notes">Facebook Comment</label>
                            <asp:TextBox runat="server" class="form-control" ID="fbcmt"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-3">
                            <label class="form-label" for="notes">Facebook Follower</label>
                            <asp:TextBox runat="server" class="form-control" ID="fbfollower"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-3">
                            <label class="form-label" for="notes">Facebook Group Share</label>
                            <asp:TextBox runat="server" class="form-control" ID="fbgshare"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <label class="form-label" for="notes">Instagram Views</label>
                            <asp:TextBox runat="server" class="form-control" ID="instaviews"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-2">
                            <label class="form-label" for="notes">Instagram Like</label>
                            <asp:TextBox runat="server" class="form-control" ID="instalike"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-2">
                            <label class="form-label" for="notes">Instagram Comment</label>
                            <asp:TextBox runat="server" class="form-control" ID="instacmt"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-3">
                            <label class="form-label" for="notes">Instagram Follower</label>
                            <asp:TextBox runat="server" class="form-control" ID="instafollower"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Instagram Group Share</label>
                            <asp:TextBox runat="server" class="form-control" ID="instagshare"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <label class="form-label" for="notes">Youtube Views</label>
                            <asp:TextBox runat="server" class="form-control" ID="ytviews"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <label class="form-label" for="notes">Youtube Subscribe</label>
                            <asp:TextBox runat="server" class="form-control" ID="ytsubscribe"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <label class="form-label" for="notes">Youtube Like</label>
                            <asp:TextBox runat="server" class="form-control" ID="ytlike"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Youtube Comment</label>
                            <asp:TextBox runat="server" class="form-control" ID="ytcmt"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="notes">Youtube Group Share</label>
                            <asp:TextBox runat="server" class="form-control" ID="ytgshare"></asp:TextBox>
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
