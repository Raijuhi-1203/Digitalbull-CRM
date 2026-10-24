<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="view-client.aspx.cs" Inherits="Admin_view_client" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid px-3 px-lg-4 py-4">

        <div class="page-heading">
            <div class="page-heading-copy">
                <span class="page-icon"><i class="bi bi-person-plus" aria-hidden="true"></i></span>
                <div>
                    <h3>View Details</h3>
                </div>
            </div>
            <div class="heading-actions">
               
            <button runat="server" id="btnqutation" onserverclick="btnqutation_ServerClick" class="btn btn-primary" type="submit"><i class="bi bi-clipboard" aria-hidden="true"></i>Qutation</button>
           
            </div>
        </div>

        <section class="row g-3">
            <div class="col-12 col-xl-12">
                <div class="panel">

                    <div class="panel-header">
                        <div>
                            <h2 class="h5 mb-1 section-title">
                                <i class="bi bi-ui-checks-grid" aria-hidden="true"></i>
                                <span>Personal Details</span></h2>
                        </div>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-6" style="pointer-events: none;">
                            <label class="form-label" for="name">Name</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox runat="server" class="form-control" ID="name" required></asp:TextBox>
                        </div>
                        <div class="col-md-6" style="pointer-events: none;">
                            <label class="form-label" for="mobileno">Mobile No.</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox runat="server" class="form-control" ID="mobileno" required></asp:TextBox>
                        </div>
                        <div class="col-md-6" style="pointer-events: none;">
                            <label class="form-label" for="email">Email</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox runat="server" class="form-control" ID="email" required></asp:TextBox>
                        </div>
                        <div class="col-md-6" style="pointer-events: none;">
                            <label class="form-label" for="dob">DOB</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox runat="server" TextMode="Date" class="form-control" ID="dob" required></asp:TextBox>
                        </div>


                    </div>

                    <div class="row g-3">


                        <div class="panel-header mt-5">
                            <div>
                                <h2 class="h5 mb-1 section-title">
                                    <i class="bi bi-ui-checks-grid" aria-hidden="true"></i>
                                    <span>Business Details</span></h2>
                            </div>
                        </div>


                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="bname">Business Name</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox runat="server" class="form-control" ID="bname" required></asp:TextBox>
                        </div>
                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="eyear">Established Year</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox runat="server" class="form-control" ID="eyear" required></asp:TextBox>
                        </div>
                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="bmob">Business Contact Number</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox runat="server" class="form-control" ID="bmob" required></asp:TextBox>
                        </div>
                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="omail">Official Mail</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox runat="server" class="form-control" ID="omail" required></asp:TextBox>
                        </div>
                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="fb">Facebook</label>
                            <asp:TextBox runat="server" class="form-control" ID="fb" required></asp:TextBox>
                        </div>

                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="insta">Instagram</label>
                            <asp:TextBox runat="server" class="form-control" ID="insta" required></asp:TextBox>
                        </div>

                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="yt">Youtube</label>
                            <asp:TextBox runat="server" class="form-control" ID="yt" required></asp:TextBox>
                        </div>

                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="gmb">GMB</label>
                            <asp:TextBox runat="server" class="form-control" ID="gmb" required></asp:TextBox>
                        </div>

                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="x">Twitter</label>
                            <asp:TextBox runat="server" class="form-control" ID="x" required></asp:TextBox>
                        </div>

                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="link">LinkdenIn</label>
                            <asp:TextBox runat="server" class="form-control" ID="linkedin" required></asp:TextBox>
                        </div>

                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="web">Website</label>
                            <asp:TextBox runat="server" class="form-control" ID="web" required></asp:TextBox>
                        </div>

                        <div class="col-md-4" style="pointer-events: none;">
                            <label class="form-label" for="pack">Package</label>
                            <span style="color: red;">*</span>
                            <asp:DropDownList ID="dblpackage" AppendDataBoundItems="True" class="selectpicker form-control" data-live-search="true" runat="server">
                            </asp:DropDownList>
                        </div>

                        <div class="col-6" style="pointer-events: none;">
                            <label class="form-label" for="add">Address</label>
                            <span style="color: red;">*</span>
                            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="address"></asp:TextBox>
                        </div>

                        <div class="col-6" style="pointer-events: none;">
                            <label class="form-label" for="vision">Vision</label>
                            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="vision"></asp:TextBox>
                        </div>

                        <div class="col-6" style="pointer-events: none;">
                            <label class="form-label" for="notes">Mision</label>
                            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="mision"></asp:TextBox>
                        </div>

                        <div class="col-6" style="pointer-events: none;">
                            <label class="form-label" for="notes">Notes</label>
                            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="notes"></asp:TextBox>
                        </div>

                        <div class="col-6" style="pointer-events: none;">
                            <label class="form-label" for="descp">Description</label>
                            <asp:Label TextMode="MultiLine" runat="server" class="form-control" ID="descp"></asp:Label>
                        </div>

                    </div>

                    <div class="d-flex flex-wrap justify-content-end gap-2 mt-4">

                        <button runat="server" id="btnsend" onserverclick="btnsend_ServerClick" class="btn btn-primary" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Delete</button>
                        <button runat="server" id="btndisable" onserverclick="btndisable_ServerClick" class="btn btn-blue" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Disable</button>
                        <button runat="server" id="btnenable" onserverclick="btnenable_ServerClick" class="btn btn-green" type="submit"><i class="bi bi-person-check" aria-hidden="true"></i>Enable</button>
                    </div>
                </div>
            </div>

        </section>

    </div>
</asp:Content>
