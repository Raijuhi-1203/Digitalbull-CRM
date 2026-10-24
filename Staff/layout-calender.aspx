<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" AutoEventWireup="true" CodeFile="layout-calender.aspx.cs" Inherits="Staff_layout_calender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        /* Date Filter Wrapper */
        .date-select {
            margin-left: auto;
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 5px 14px;
            min-width: 175px;
            height: 46px;
            border: 1px solid #dbe7f5;
            border-radius: 14px;
            background: linear-gradient(135deg, #ffffff, #f5f9ff);
            box-shadow: 0 5px 15px rgba(48, 91, 160, 0.08);
            transition: all 0.3s ease;
        }

            /* Calendar Icon */
            .date-select > i {
                color: #326bea;
                font-size: 16px;
            }

        /* Date Input */
        .date-filter {
            width: 100%;
            height: 34px;
            padding: 0 2px;
            border: none !important;
            outline: none !important;
            background: transparent !important;
            color: #18345e;
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: none !important;
        }

            /* Calendar Picker Icon */
            .date-filter::-webkit-calendar-picker-indicator {
                cursor: pointer;
                width: 17px;
                height: 17px;
                padding: 3px;
                border-radius: 6px;
                opacity: 0.75;
                transition: 0.2s ease;
            }

                .date-filter::-webkit-calendar-picker-indicator:hover {
                    opacity: 1;
                    background: #e5efff;
                }

        /* Hover Effect */
        .date-select:hover {
            border-color: #7ca9f8;
            box-shadow: 0 7px 20px rgba(48, 107, 234, 0.13);
            transform: translateY(-1px);
        }

        /* Focus Effect */
        .date-select:focus-within {
            border-color: #326bea;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(50, 107, 234, 0.10);
        }

        /* Mobile */
        @media (max-width: 600px) {
            .date-select {
                margin-left: 0;
                width: 100%;
                max-width: 220px;
            }
        }

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

        /* Activity */
        .activity-card {
            height: 96px;
            margin-top: 20px;
            display: flex;
            align-items: center;
            padding: 0 20px;
            overflow: hidden;
            position: relative;
            background: linear-gradient( 100deg, #f6fbff, #fff 60%, #f0eaff );
        }

        .activity-content {
            display: flex;
            align-items: center;
            gap: 15px;
            z-index: 1;
        }

            .activity-content h2 {
                margin: 0 0 4px;
                font-size: 19px;
            }

            .activity-content p {
                margin: 0;
                color: #7185a6;
                font-size: 11px;
            }

        .activity-graphic {
            position: absolute;
            right: 40px;
            bottom: -8px;
            font-size: 65px;
            opacity: .7;
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
            background: #fff0ef;
            color: #ef3b32;
        }

        .youtube {
            background: #ffe9e8;
            color: #f00;
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

        <!-- Social Media Work -->
        <section class="dashboard-card work-card">

            <div class="section-heading">
                <div class="section-icon">▣</div>

                <div>
                    <h2>Social Media Work</h2>
                    <p>Check the latest posts and their status for all clients.</p>
                </div>

                <div class="date-select">
                    <i class="fas fa-calendar-alt"></i>

                    <asp:TextBox
                        ID="dt"
                        runat="server"
                        TextMode="Date"
                        CssClass="date-filter"
                        AutoPostBack="true"
                        OnTextChanged="dt_TextChanged">
                    </asp:TextBox>
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
                                        <span class="content-type-icon">
                                            ☰
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



    </main>

</asp:Content>
