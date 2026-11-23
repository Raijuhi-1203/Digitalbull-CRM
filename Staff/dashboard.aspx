<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="Admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .dashboard-container {
            max-width: 100%;
            margin: 20px auto 35px;
            padding: 0 10px;
        }

        .dashboard-card {
            background: rgba(255,255,255,.95);
            border: 1px solid #d9e7f8;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(45,96,160,.08);
        }

        /* Section Heading */
        .section-heading {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 12px;
        }

        .section-icon {
            width: 44px;
            height: 44px;
            flex: 0 0 44px;
            border-radius: 12px;
            display: grid;
            place-items: center;
            color: #fff;
            font-size: 21px;
            background: linear-gradient(145deg,#356cff,#7654ed);
            box-shadow: 0 7px 16px rgba(63,93,236,.18);
        }

        .section-heading h2 {
            font-size: 17px;
            margin: 0 0 3px;
            font-weight: 800;
            color: #102958;
        }

        .section-heading p {
            font-size: 11px;
            color: #7185a6;
            margin: 0;
        }

        /* Work */
        .work-card {
            padding: 14px 20px 8px;
        }

        .date-select {
            margin-left: auto;
            height: 38px;
            padding: 0 13px;
            border: 1px solid #d4e1f3;
            border-radius: 12px;
            background: #fff;
            color: #102958;
            font-size: 11px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 9px;
        }

        .work-table {
            width: 100%;
            border-collapse: collapse;
        }

            .work-table th {
                background: #eff6ff;
                color: #60789e;
                font-size: 10px;
                text-align: left;
                padding: 11px 8px;
                font-weight: 800;
            }

                .work-table th:first-child {
                    border-radius: 10px 0 0 10px;
                }

                .work-table th:last-child {
                    border-radius: 0 10px 10px 0;
                }

            .work-table td {
                padding: 9px 8px;
                border-bottom: 1px solid #e1ebf7;
                font-size: 11px;
            }

            .work-table tr:last-child td {
                border-bottom: 0;
            }

        .client {
            display: flex;
            align-items: center;
            gap: 12px;
            min-width: 270px;
        }

        .client-logo {
            width: 43px;
            height: 43px;
            border-radius: 50%;
            border: 1px solid #d7e3f2;
            display: grid;
            place-items: center;
            background: #fff;
            font-weight: 900;
            font-size: 16px;
        }

        .client-name {
            font-weight: 750;
            line-height: 1.25;
        }

        .client-type {
            color: #8498b6;
            font-size: 10px;
            margin-top: 3px;
        }

            .client-type:before {
                content: "";
                display: inline-block;
                width: 6px;
                height: 6px;
                border-radius: 50%;
                background: #12ad68;
                margin-right: 7px;
            }

        .pill {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            border-radius: 9px;
            padding: 8px 12px;
            font-size: 10px;
            font-weight: 750;
            white-space: nowrap;
        }

        .post-pill {
            background: #eaf3ff;
            color: #1162d4;
        }

        .pending {
            background: #fff4dc;
            color: #e68b00;
            border: 1px solid #f4d58a;
        }

        .inprogress {
            background: #0d6efd2b;
            color: #0d6efd;
            border: 1px solid #9bc9f7;
        }

        .schedule {
            background: #0dcaf03d;
            color: #0dcaf0;
            border: 1px solid #c9adf2;
        }

        .done {
            background: #19875433;
            color: #198754;
            border: 1px solid #9bdfb4;
        }

        .default {
            background: #eeeeee;
            color: #555;
            border: 1px solid #d5d5d5;
        }

        .action-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .dash-btn {
            height: 30px;
            border-radius: 9px;
            padding: 0 13px;
            border: 1px solid #d7e3f2;
            background: #fff;
            color: #405879;
            font-size: 10px;
            font-weight: 750;
            cursor: pointer;
        }

        .btn-blue {
            background: linear-gradient(135deg,#1479ef,#1767d9);
            color: #fff;
            border-color: #1479ef;
            box-shadow: 0 5px 12px rgba(20,112,232,.18);
        }

        .btn-green {
            background: linear-gradient(135deg,#0ca86a,#00884e);
            color: #fff;
            border-color: #07995d;
        }

        /* Activity Panel */

        .activity-panel {
            background: #fff;
            border: 1px solid #edf0f4;
            border-radius: 10px;
            padding: 14px;
            box-shadow: 0 2px 8px rgba(0,0,0,.03);
        }

        .activity-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 12px;
        }

        .activity-header-icon {
            width: 34px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f1f3ff;
            color: #5969d9;
            border-radius: 8px;
            font-size: 17px;
        }

        .activity-header h2 {
            font-size: 16px;
            font-weight: 700;
            margin: 0;
        }

        .activity-header p {
            font-size: 11px;
            color: #9299a5;
            margin: 2px 0 0;
        }

        /* Table */
        .activity-table {
            width: 100%;
            min-width: 1000px;
            table-layout: auto;
        }

            .activity-table thead th {
                background: #f8f9fc;
                color: #737d90;
                font-size: 10px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: .4px;
                padding: 10px 9px;
                white-space: nowrap;
                border-bottom: 1px solid #edf0f4;
            }

            .activity-table tbody td {
                padding: 10px;
                font-size: 11px;
                color: #475467;
                border-bottom: 1px solid #f0f1f4;
                white-space: nowrap;
                vertical-align: middle;
            }

            .activity-table tbody tr:hover {
                background: #fafbff;
            }

        /* Staff */
        .activity-staff {
            display: flex;
            align-items: center;
            gap: 6px;
            font-weight: 600;
            color: #344054;
        }

            .activity-staff i {
                font-size: 16px;
                color: #6575d9;
            }

        /* Time */
        .activity-time {
            color: #778195 !important;
        }

        /* Details */
        .activity-details {
            min-width: 250px;
            max-width: 450px;
            white-space: normal !important;
            overflow: visible;
            text-overflow: unset;
            word-break: break-word;
            overflow-wrap: anywhere;
            line-height: 1.6;
            font-size: 12px;
            color: #475467;
        }

        /* Status */
        .activity-status {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .status-btn {
            border: 1px solid #e6e9ef;
            background: transparent;
            border-radius: 5px;
            padding: 5px 8px;
            font-size: 10px;
            font-weight: 600;
            cursor: pointer;
        }

            .status-btn.pending {
                color: #d18a20;
            }

                .status-btn.pending.active {
                    background: #fff5df;
                    border-color: #f1d59e;
                }

            .status-btn.done {
                color: #159768;
                background: #1987542e;
                border-color: #159768;
            }

                .status-btn.done.active {
                    background: #e9f8f1;
                    border-color: #a9e4ca;
                }

        /* Remark */
        .remark-input {
            width: 150px;
            height: 29px;
            padding: 4px 8px;
            border: 1px solid #e5e8ef;
            border-radius: 5px;
            font-size: 11px;
            outline: none;
        }

            .remark-input:focus {
                border-color: #6575d9;
            }

        /* Submit */
        .remark-submit {
            background: #5969d9;
            color: #fff;
            border: 0;
            border-radius: 5px;
            padding: 6px 12px;
            font-size: 10px;
            font-weight: 600;
            cursor: pointer;
        }

            .remark-submit:hover {
                background: #4555c5;
            }


        /* Staff */
        .activity-staff-box {
            display: flex;
            align-items: center;
            gap: 7px;
            min-width: 0;
            font-size: 12px;
            color: #344054;
        }

            .activity-staff-box i {
                font-size: 17px;
                color: #6875d9;
            }

            .activity-staff-box strong {
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

        /* Working Time */
        .activity-time {
            font-size: 11px;
            color: #747d8d;
            white-space: nowrap;
        }

            .activity-time i {
                color: #8993a5;
                margin-right: 3px;
            }

        /* Work Details */
        .activity-work {
            font-size: 12px;
            color: #475467;
            margin: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        /* Status */
        .activity-status {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .status-btn {
            border: 1px solid #e8eaf0;
            background: #fff;
            padding: 5px 9px;
            border-radius: 5px;
            font-size: 10px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

            .status-btn.pending {
                color: #d18a20;
            }

                .status-btn.pending.active {
                    background: #fff5df;
                    border-color: #f4d69b;
                }

            .status-btn.done {
                color: #159768;
            }

                .status-btn.done.active {
                    background: #e9f8f1;
                    border-color: #a9e4ca;
                }

        /* Remark */
        .activity-remark {
            display: flex;
            align-items: center;
            gap: 5px;
            min-width: 0;
        }

        .remark-input {
            width: 100%;
            min-width: 0;
            height: 30px;
            border: 1px solid #e6e9ef;
            border-radius: 5px;
            padding: 4px 8px;
            font-size: 11px;
            outline: none;
        }

            .remark-input:focus {
                border-color: #7180e5;
            }

        .remark-submit {
            height: 30px;
            padding: 0 10px;
            border: none;
            border-radius: 5px;
            background: #5969d9;
            color: #fff;
            font-size: 10px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

            .remark-submit:hover {
                background: #4555c5;
            }

        /* Mobile Responsive */
        @media(max-width: 991px) {
            .activity-row {
                grid-template-columns: 1fr 1fr;
                gap: 10px;
            }

            .activity-work {
                grid-column: 1 / -1;
                white-space: normal;
            }

            .activity-remark {
                grid-column: 1 / -1;
            }
        }

        @media(max-width: 480px) {
            .activity-row {
                grid-template-columns: 1fr;
            }

            .activity-work,
            .activity-remark {
                grid-column: auto;
            }

            .activity-status {
                flex-wrap: wrap;
            }
        }

        /* Recent Client */
        .recent-card {
            margin-top: 16px;
            padding: 17px 18px 18px;
        }

        .recent-top {
            display: flex;
            align-items: center;
            margin-bottom: 14px;
        }

            .recent-top .section-heading {
                margin: 0;
            }

        .view-all {
            margin-left: auto;
            border: 1px solid #b9d2f8;
            color: #0964d7;
            background: #f8fbff;
            border-radius: 18px;
            padding: 8px 14px;
            font-size: 10px;
            font-weight: 750;
            cursor: pointer;
        }

        .social-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            border: 1px solid #dce8f5;
            border-radius: 9px;
        }

            .social-table th {
                height: 54px;
                background: #f1f7ff;
                border-right: 1px solid #dce8f5;
                font-size: 10px;
                text-align: left;
                padding: 0 12px;
            }

                .social-table th:last-child {
                    border-right: 0;
                }

        .social-head {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .social-icon {
            width: 30px;
            height: 30px;
            border-radius: 9px;
            display: grid;
            place-items: center;
            font-size: 18px;
            font-weight: 900;
        }

        .facebook {
            background: #e7f0ff;
            color: #1672e8;
        }

        .instagram {
            background: #faeaff;
            color: #d833cf;
        }

        .gmb {
            background: #dc354538;
            color: #dc3545;
        }

        .youtube {
            background: #ffe9e8;
            color: #f00;
        }

        .twitter {
            background: #00a6ff36;
            color: #00a6ff;
        }

        .social-table td {
            height: 55px;
            padding: 8px 12px;
            border-top: 1px solid #e1ebf5;
            border-right: 1px solid #e1ebf5;
            font-size: 10px;
        }

            .social-table td:last-child {
                border-right: 0;
            }

        .social-client {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .mini-logo {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            border: 1px solid #d9e5f2;
            display: grid;
            place-items: center;
            background: #fff;
            font-size: 14px;
            font-weight: 900;
            flex: 0 0 36px;
        }

        .social-client strong {
            font-size: 10px;
            display: block;
        }

        .social-client small {
            color: #8296b4;
            font-size: 9px;
        }

        .row-arrow {
            margin-left: auto;
            color: #6d88ad;
            font-size: 18px;
        }

        .visit {
            min-width: 96px;
            height: 29px;
            border: 0;
            border-radius: 17px;
            font-size: 10px;
            font-weight: 750;
            cursor: pointer;
        }

        .facebook-bg {
            background: #edf5ff;
            color: #1268dd;
            padding: 10px;
        }

        .instagram-bg {
            background: #faefff;
            color: #9a37e5;
            padding: 10px;
        }

        .gmb-bg {
            background: #fff0ef;
            color: #e8342d;
            padding: 10px;
        }

        .youtube-bg {
            background: #eaf9f2;
            color: #078a56;
            padding: 10px;
        }

        .linkedin-bg {
            background: #0dcaf030;
            color: #0dcaf0;
            padding: 10px;
        }

        .twitter-bg {
            background: #0d6efd4f;
            color: #0d6efd;
            padding: 10px;
        }

        /* Mobile */
        @media (max-width: 800px) {

            .dashboard-container {
                padding: 0 8px;
            }

            .work-card {
                overflow-x: auto;
            }

            .work-table {
                min-width: 850px;
            }

            .recent-card {
                overflow-x: auto;
            }

            .social-table {
                min-width: 800px;
            }
        }
    </style>

    <style>
        .content-cell {
            min-width: 260px;
            max-width: 360px;
            padding: 14px 16px !important;
        }

        /* Content Type */
        .content-type {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 9px;
        }

        .content-type-icon {
            width: 34px;
            height: 34px;
            border-radius: 9px;
            background: #eef2ff;
            color: #4f46e5;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

            .content-type-icon i {
                font-size: 14px;
            }

        .content-type-info {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .content-label {
            font-size: 10px;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: .5px;
            font-weight: 600;
        }

        .content-type-info strong {
            font-size: 13px;
            color: #1e293b;
            font-weight: 700;
        }

        /* Note */
        .content-note {
            display: flex;
            align-items: flex-start;
            gap: 7px;
            padding: 8px 10px;
            background: #f8fafc;
            border-left: 3px solid #e2e8f0;
            border-radius: 6px;
            color: #000;
            font-size: 12px;
            line-height: 1.5;
        }

            .content-note i {
                color: #94a3b8;
                margin-top: 3px;
                font-size: 11px;
                flex-shrink: 0;
            }
    </style>

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

    <!-- =========================
         DASHBOARD BODY
    ========================= -->

    <main class="dashboard-container">

        <!-- Pending Social Media Work -->
        <section class="dashboard-card work-card" id="pending_work" runat="server">

            <div class="section-heading">
                <div class="section-icon">▣</div>

                <div>
                    <h2>Pending Social Media Work</h2>
                    <p>Check the latest posts and their status for all clients.</p>
                </div>

                <div class="date-select">
                    📅 &nbsp; <span id="dt" runat="server"></span>
                </div>
            </div>

            <table class="work-table">
                <thead>
                    <tr>
                        <th>CLIENT</th>
                        <th>POST TYPE</th>
                        <th>STATUS</th>
                        <th>POST DATE</th>
                        <th>ACTION</th>
                    </tr>
                </thead>

                <tbody>

                    <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="Repeater3_ItemCommand">
                        <ItemTemplate>

                            <tr>
                                <td>
                                    <div class="client">

                                        <div>
                                            <div class="client-name">
                                                <%# Eval("client_name") %>
                                            </div>
                                        </div>
                                    </div>
                                </td>

                                <td class="content-cell">

                                    <div class="content-type">
                                        <span class="content-type-icon">☰
                                        </span>

                                        <div class="content-type-info">
                                            <span class="content-label">Content Type</span>
                                            <strong><%# Eval("post_type") %></strong>
                                        </div>
                                    </div>

                                    <div class="content-note">
                                        <i class="fas fa-align-left"></i>
                                        <span><%# Eval("post_note") %></span>
                                    </div>

                                </td>

                                <td>
                                    <span id="st" runat="server"
                                        class='<%# GetStatusClass(Eval("post_status").ToString()) %>'>
                                        <%# GetStatusIcon(Eval("post_status").ToString()) %>
                                        &nbsp; <%# Eval("post_status") %>
                                    </span>
                                </td>

                                <%-- <td>
                                    <span id="st" runat="server" class="pill pending">✦ &nbsp; <%# Eval("post_status") %>
                                    </span>
                                </td>--%>

                                <td>
                                    <span class="pill pending">◷ &nbsp; <%# Eval("post_date") %>
                                    </span>
                                </td>

                                <td>
                                    <div class="action-wrap">

                                        <asp:Button CssClass="dash-btn btn-blue" ID="btninprogress" runat="server" Text="▷ &nbsp; In Progress"
                                            CommandName="Progress"
                                            CommandArgument='<%# Eval("id") + "|" + Eval("client_name") %>'
                                            Visible='<%# Eval("post_status").ToString() == "Pending" %>' />

                                        <asp:Button CssClass="dash-btn" ID="btnAction" runat="server" Text="▣ &nbsp; Schedule"
                                            CommandName="Schedule"
                                            CommandArgument='<%# Eval("id") + "|" + Eval("client_name") %>'
                                            Visible='<%# Eval("post_status").ToString() == "Pending" || Eval("post_status").ToString() == "In progress" %>' />

                                        <asp:Button CssClass="dash-btn btn-green" ID="Button1" runat="server" Text="✓ &nbsp; Post Done"
                                            CommandName="Done"
                                            CommandArgument='<%# Eval("id") %>'
                                            Visible='<%# Eval("post_status").ToString() != "Done" %>' />


                                    </div>
                                </td>
                            </tr>


                        </ItemTemplate>
                    </asp:Repeater>


                </tbody>
            </table>
        </section>

        <!-- Today's Social Media Work -->
        <section class="dashboard-card work-card mt-3" id="today_work" runat="server">

            <div class="section-heading">
                <div class="section-icon">▣</div>
                <div>
                    <h2>Today's Social Media Work</h2>
                    <p>Check the latest posts and their status for all clients.</p>
                </div>
            </div>

            <table class="work-table">
                <thead>
                    <tr>
                        <th>CLIENT</th>
                        <th>POST TYPE</th>
                        <th>STATUS</th>
                        <th>POST DATE</th>
                        <th>ACTION</th>
                    </tr>
                </thead>

                <tbody>

                    <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand">
                        <ItemTemplate>

                            <tr>

                                <td>
                                    <div class="client">

                                        <div>
                                            <div class="client-name">
                                                <%# Eval("client_name") %>
                                            </div>

                                        </div>
                                    </div>
                                </td>

                                <td class="content-cell">

                                    <div class="content-type">
                                        <span class="content-type-icon">☰
                                        </span>

                                        <div class="content-type-info">
                                            <span class="content-label">Content Type</span>
                                            <strong><%# Eval("post_type") %></strong>
                                        </div>
                                    </div>

                                    <div class="content-note">
                                        <i class="fas fa-align-left"></i>
                                        <span><%# Eval("post_note") %></span>
                                    </div>

                                </td>

                                <td>
                                    <span id="st" runat="server"
                                        class='<%# GetStatusClass(Eval("post_status").ToString()) %>'>
                                        <%# GetStatusIcon(Eval("post_status").ToString()) %>
                                        &nbsp; <%# Eval("post_status") %>
                                    </span>
                                </td>

                                <td>
                                    <span class="pill pending">◷ &nbsp; <%# Eval("post_date") %>
                                    </span>
                                </td>

                                <td>
                                    <div class="action-wrap">

                                        <asp:Button CssClass="dash-btn btn-blue" ID="btninprogress2" runat="server" Text="▷ &nbsp; In Progress"
                                            CommandName="Progress"
                                            CommandArgument='<%# Eval("id") + "|" + Eval("client_name") %>'
                                            Visible='<%# Eval("post_status").ToString() == "Pending" %>' />

                                        <asp:Button CssClass="dash-btn" ID="btnAction2" runat="server" Text="▣ &nbsp; Schedule"
                                            CommandName="Schedule"
                                            CommandArgument='<%# Eval("id") + "|" + Eval("client_name") %>'
                                            Visible='<%# Eval("post_status").ToString() == "Pending" || Eval("post_status").ToString() == "In progress" %>' />

                                        <asp:Button CssClass="dash-btn btn-green" ID="Button12" runat="server" Text="✓ &nbsp; Post Done"
                                            CommandName="Done"
                                            CommandArgument='<%# Eval("id") %>'
                                            Visible='<%# Eval("post_status").ToString() != "Done" %>' />


                                    </div>
                                </td>
                            </tr>


                        </ItemTemplate>
                    </asp:Repeater>


                </tbody>
            </table>
        </section>

        <!-- Compact Activity Section -->

        <section class="mt-3">
            <div class="activity-panel">

                <div class="activity-header">
                    <div class="activity-header-icon">
                        <i class="bi bi-activity"></i>
                    </div>
                    <div>
                        <h2>Activity</h2>
                        <p>Recent operational updates and staff work progress.</p>
                    </div>
                </div>

                <div class="table-responsive">

                    <table class="table activity-table align-middle mb-0">

                        <thead>
                            <tr>
                                <th>Client</th>
                                <th>Working Time</th>
                                <th>Work Details</th>
                                <th>Status</th>
                                <th>Remark</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>

                            <asp:Repeater ID="rptbinddata"
                                runat="server"
                                OnItemCommand="rptbinddata_ItemCommand">

                                <ItemTemplate>

                                    <tr>

                                        <!-- Staff -->
                                        <td>
                                            <div class="activity-staff">
                                                <i class="bi bi-person-circle"></i>
                                                <%# Eval("client_id") %>
                                            </div>
                                        </td>

                                        <!-- Working Time -->
                                        <td class="activity-time">
                                            <i class="bi bi-clock"></i>
                                            <%# Eval("working_time") %>
                                        </td>

                                        <!-- Work Details -->
                                        <td class="activity-details">
                                            <%# Eval("work_details") %>
                                        </td>

                                        <!-- Status -->
                                        <td>
                                            <div class="activity-status">

                                                <asp:Button ID="btnDone"
                                                    runat="server"
                                                    Text="Done"
                                                    CssClass='<%# Convert.ToString(Eval("statuss")) == "Done" ? "status-btn done active" : "status-btn done" %>'
                                                    CommandName="SetDone"
                                                    CommandArgument='<%# Eval("id") %>' />

                                            </div>
                                        </td>

                                        <!-- Remark -->
                                        <td>
                                            <asp:TextBox ID="txtRemark"
                                                runat="server"
                                                CssClass="remark-input"
                                                TextMode="MultiLine"
                                                Text='<%# Eval("remark") %>'
                                                placeholder="Enter remark..." />
                                        </td>

                                        <!-- Action -->
                                        <td>
                                            <asp:Button ID="btnSubmitRemark"
                                                runat="server"
                                                Text="Submit"
                                                CssClass="remark-submit"
                                                CommandName="SubmitRemark"
                                                CommandArgument='<%# Eval("id") %>' />
                                        </td>

                                    </tr>

                                </ItemTemplate>

                            </asp:Repeater>

                        </tbody>
                    </table>

                </div>
            </div>
        </section>


        <!-- Recent Assign Client -->
        <section class="dashboard-card recent-card">

            <div class="recent-top">

                <div class="section-heading">

                    <div class="section-icon">
                        ♧
                    </div>

                    <div>
                        <h2>Recent Assign Client</h2>
                        <h2 id="total" runat="server"></h2>
                        <p>Latest account activity across the workspace.</p>
                    </div>

                </div>

                <button class="view-all">
                    View All &nbsp;›
                </button>

            </div>


            <div class="table-responsive">

                <table class="social-table">

                    <thead>
                        <tr>

                            <th class="client-column">CLIENT
                            </th>

                            <th>
                                <div class="social-head">
                                    <span class="social-icon facebook">f
                                    </span>
                                    Facebook
                                </div>
                            </th>

                            <th>
                                <div class="social-head">
                                    <span class="social-icon instagram">◎
                                    </span>
                                    Instagram
                                </div>
                            </th>

                            <th>
                                <div class="social-head">
                                    <span class="social-icon gmb">G
                                    </span>
                                    GMB
                                </div>
                            </th>

                            <th>
                                <div class="social-head">
                                    <span class="social-icon youtube">▶
                                    </span>
                                    YouTube
                                </div>
                            </th>

                            <th>
                                <div class="social-head">
                                    <span class="social-icon facebook">in
                                    </span>
                                    Linkedin
                                </div>
                            </th>

                            <th>
                                <div class="social-head">
                                    <span class="social-icon twitter">𝕏
                                    </span>
                                    Twitter
                                </div>
                            </th>

                        </tr>
                    </thead>


                    <tbody>

                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <!-- Client 1 -->
                                <tr>

                                    <td>
                                        <div class="social-client">



                                            <div>
                                                <strong><%# Eval("business_name") %>
                                                </strong>


                                            </div>

                                            <span class="row-arrow">›
                                            </span>

                                        </div>
                                    </td>

                                    <td>
                                        <a class="visit facebook-bg" href="<%# Eval("facebook") %>">Visit &nbsp;↗
                                        </a>
                                    </td>

                                    <td>
                                        <a class="visit instagram-bg" href="<%# Eval("instagram") %>">Visit &nbsp;↗
                                        </a>
                                    </td>

                                    <td>
                                        <a class="visit gmb-bg" href="<%# Eval("gmb") %>">Visit &nbsp;↗
                                        </a>
                                    </td>

                                    <td>
                                        <a class="visit youtube-bg" href="<%# Eval("youtube") %>">Visit &nbsp;↗
                                        </a>
                                    </td>

                                    <td>
                                        <a class="visit linkedin-bg" href="<%# Eval("linkedin") %>">Visit &nbsp;↗
                                        </a>
                                    </td>

                                    <td>
                                        <a class="visit twitter-bg" href="<%# Eval("twitter") %>">Visit &nbsp;↗
                                        </a>
                                    </td>

                                </tr>

                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            </div>

        </section>

    </main>

</asp:Content>
