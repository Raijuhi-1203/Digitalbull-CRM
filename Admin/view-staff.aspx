<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="view-staff.aspx.cs" Inherits="Admin_view_staff" %>

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
                        <div class="col-md-4" style="pointer-events:none">
                            <label class="form-label" for="firstName">Name</label>
                            <asp:TextBox runat="server" class="form-control" ID="name" type="text" required></asp:TextBox>
                            
                        </div>
                        <div class="col-md-4" style="pointer-events:none">
                            <label class="form-label" for="lastName">Mobile No.</label>
                            <asp:TextBox runat="server" class="form-control" ID="mobileno" type="text" required></asp:TextBox>
                            
                        </div>
                        <div class="col-md-4" style="pointer-events:none">
                            <label class="form-label" for="phone">Role</label>
                            <asp:DropDownList ID="dblrole" class="form-select" runat="server">
                                <asp:ListItem>Choose role</asp:ListItem>
                                <asp:ListItem>Manager</asp:ListItem>
                                <asp:ListItem>Social Media Manager</asp:ListItem>
                                <asp:ListItem>Developer</asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>
                        <div class="col-md-4" style="pointer-events:none">
                            <label class="form-label" for="email">Email</label>
                            <asp:TextBox runat="server" class="form-control" ID="email" type="email" required></asp:TextBox>
                            
                        </div>


                        <div class="col-md-4" style="pointer-events:none">
                            <label class="form-label" for="phone">Father's Name</label>
                            <asp:TextBox runat="server" class="form-control" ID="fname" type="tel" required></asp:TextBox>
                            
                        </div>

                        <div class="col-md-4" style="pointer-events:none">
                            <label class="form-label" for="phone">Mother's Name</label>
                            <asp:TextBox runat="server" class="form-control" ID="mname" type="tel" required></asp:TextBox>
                            
                        </div>

                        <div class="col-md-4" style="pointer-events:none">
                            <label class="form-label" for="phone">Alternate Contact No.</label>
                            <asp:TextBox runat="server" class="form-control" ID="alternate_no" type="tel" required></asp:TextBox>
                            
                        </div>

                        <div class="col-12" style="pointer-events:none">
                            <label class="form-label" for="notes">Address</label>
                            <asp:TextBox runat="server" class="form-control" ID="address" TextMode="MultiLine" placeholder="Address..."></asp:TextBox>
                        </div>

                    </div>
                    <div class="d-flex flex-wrap justify-content-end gap-2 mt-4">
                        <button id="btnsend" runat="server" onserverclick="btnsend_ServerClick" class="btn btn-primary" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Delete</button>
                    </div>
                </div>
            </div>

        </section>

    </div>
</asp:Content>
