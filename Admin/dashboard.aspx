<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"
    AutoEventWireup="true" CodeFile="dashboard.aspx.cs"
    Inherits="Admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        /* ==============================
           DASHBOARD
        ============================== */

        .dashboard-wrapper {
            min-height: 100vh;
            padding: 25px;
            background: #f5f7fb;
        }

        /* Header */
        .dashboard-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .dashboard-title {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .dashboard-title-icon {
            width: 52px;
            height: 52px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #111827;
            color: #fff;
            font-size: 22px;
            box-shadow: 0 8px 20px rgba(17, 24, 39, .15);
        }

        .dashboard-title small {
            display: block;
            color: #8b93a7;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 3px;
        }

        .dashboard-title h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            color: #172033;
        }

        /* =================================
   STAFF SECTION
================================= */

        .staff-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 22px;
        }


        /* STAFF CARD */

        .staff-card {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: space-between;
            min-height: 100px;
            padding: 18px 19px;
            background: #ffffff;
            border: 1px solid #edf0f5;
            border-radius: 18px;
            box-shadow: 0 7px 25px rgba(30, 41, 59, .055);
            cursor: pointer;
            transition: transform .25s ease, box-shadow .25s ease, border-color .25s ease;
        }


            /* Hover */

            .staff-card:hover {
                transform: translateY(-4px);
                border-color: #dfe5ef;
                box-shadow: 0 14px 32px rgba(30, 41, 59, .10);
            }


        /* STAFF INFO */

        .staff-info {
            display: flex;
            align-items: center;
            gap: 13px;
        }


        /* AVATAR */

        .staff-avatar {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            background: linear-gradient( 135deg, #fff7ed, #ffedd5 );
            color: #ea580c;
            font-size: 20px;
            flex-shrink: 0;
            transition: all .25s ease;
        }


        /* Avatar hover */

        .staff-card:hover .staff-avatar {
            background: #ea580c;
            color: #ffffff;
            transform: scale(1.05);
        }


        /* STAFF DETAILS */

        .staff-details {
            min-width: 0;
        }

        .staff-name {
            margin: 0;
            color: #172033;
            font-size: 15px;
            font-weight: 700;
            line-height: 1.4;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .staff-label {
            display: block;
            margin-top: 3px;
            color: #98a1b2;
            font-size: 11px;
            font-weight: 500;
        }


        /* ARROW */

        .staff-arrow {
            width: 34px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            background: #f6f7f9;
            color: #8b94a5;
            font-size: 16px;
            flex-shrink: 0;
            transition: all .25s ease;
        }


        /* Arrow hover */

        .staff-card:hover .staff-arrow {
            background: #172033;
            color: #ffffff;
            transform: translateX(3px);
        }


        /* =================================
   OPTIONAL DIFFERENT STAFF COLORS
================================= */

        .staff-card:nth-child(4n+1) .staff-avatar {
            background: #eff6ff;
            color: #2563eb;
        }

        .staff-card:nth-child(4n+2) .staff-avatar {
            background: #ecfdf5;
            color: #16a34a;
        }

        .staff-card:nth-child(4n+3) .staff-avatar {
            background: #fff7ed;
            color: #ea580c;
        }

        .staff-card:nth-child(4n+4) .staff-avatar {
            background: #fef2f2;
            color: #dc2626;
        }


        /* Hover colors */

        .staff-card:nth-child(4n+1):hover .staff-avatar {
            background: #2563eb;
            color: #ffffff;
        }

        .staff-card:nth-child(4n+2):hover .staff-avatar {
            background: #16a34a;
            color: #ffffff;
        }

        .staff-card:nth-child(4n+3):hover .staff-avatar {
            background: #ea580c;
            color: #ffffff;
        }

        .staff-card:nth-child(4n+4):hover .staff-avatar {
            background: #dc2626;
            color: #ffffff;
        }


        /* =================================
   RESPONSIVE
================================= */

        @media (max-width: 1200px) {

            .staff-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {

            .staff-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .staff-card {
                min-height: 90px;
                padding: 15px;
            }

            .staff-avatar {
                width: 44px;
                height: 44px;
                border-radius: 12px;
            }
        }

        /* ==============================
           MAIN GRID
        ============================== */

        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .dashboard-panel {
            background: #fff;
            border: 1px solid #edf0f5;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(30, 41, 59, .05);
            overflow: hidden;
        }

        .panel-heading {
            padding: 21px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #f0f2f6;
        }

        .panel-heading-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .panel-icon {
            width: 40px;
            height: 40px;
            border-radius: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f1f5ff;
            color: #4f46e5;
            font-size: 18px;
        }

        .panel-heading h2 {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            color: #172033;
        }

        .panel-heading p {
            margin: 3px 0 0;
            color: #98a1b2;
            font-size: 12px;
        }

        /* ==============================
           ACTIVITY
        ============================== */

        .activity-list {
            padding: 8px 24px 18px;
        }

        .activity-item {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            padding: 16px 0;
            border-bottom: 1px solid #f1f3f6;
        }

            .activity-item:last-child {
                border-bottom: 0;
            }

        .activity-dot {
            flex-shrink: 0;
            width: 10px;
            height: 10px;
            margin-top: 6px;
            border-radius: 50%;
            background: #4f46e5;
            box-shadow: 0 0 0 5px #eef2ff;
        }

        .activity-staff {
            font-size: 14px;
            font-weight: 700;
            color: #263247;
            margin: 0 0 4px;
        }

        .activity-details {
            font-size: 13px;
            color: #8a93a5;
            line-height: 1.5;
            margin: 0;
        }

        /* ==============================
           CLIENT TABLE
        ============================== */

        .client-table-wrapper {
            overflow-x: auto;
        }

        .client-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 700px;
        }

            .client-table thead th {
                padding: 14px 24px;
                background: #fafbfc;
                color: #7d8799;
                font-size: 11px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: .7px;
                text-align: left;
                border-bottom: 1px solid #edf0f4;
            }

            .client-table tbody td {
                padding: 17px 24px;
                border-bottom: 1px solid #f1f3f6;
                color: #354052;
                font-size: 13px;
                vertical-align: middle;
            }

            .client-table tbody tr {
                transition: background .2s ease;
            }

                .client-table tbody tr:hover {
                    background: #fafbff;
                }

        .client-name {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 700;
            color: #1f2937;
        }

        .client-avatar {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eef2ff;
            color: #4f46e5;
            font-weight: 700;
            font-size: 14px;
        }

        .social-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            padding: 7px 12px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 11px;
            font-weight: 700;
            background: #f6f7f9;
            color: #596273;
            border: 1px solid #eceef2;
            transition: all .2s ease;
        }

            .social-btn:hover {
                background: #172033;
                color: #fff;
                border-color: #172033;
            }

        /* ==============================
           TOAST
        ============================== */

        .toast-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
        }

        .custom-toast {
            min-width: 320px;
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 15px;
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 15px 40px rgba(0,0,0,.15);
            border: 1px solid #edf0f4;
        }

        .toast-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #ecfdf3;
            color: #16a34a;
            font-size: 20px;
        }

        .toast-content {
            flex: 1;
        }

        .toast-title {
            font-size: 13px;
            font-weight: 700;
            color: #1f2937;
        }

        .toast-text {
            margin-top: 2px;
            color: #8b94a5;
            font-size: 12px;
        }

        .toast-close {
            border: 0;
            background: transparent;
            color: #9ca3af;
            cursor: pointer;
            font-size: 14px;
        }

        /* ==============================
           RESPONSIVE
        ============================== */

        @media (max-width: 1200px) {
            .staff-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {

            .dashboard-wrapper {
                padding: 16px;
            }

            .dashboard-header {
                margin-bottom: 18px;
            }

            .dashboard-title h1 {
                font-size: 23px;
            }

            .dashboard-title-icon {
                width: 45px;
                height: 45px;
                border-radius: 12px;
            }

            .staff-grid {
                grid-template-columns: 1fr;
            }

            .panel-heading {
                padding: 17px;
            }

            .activity-list {
                padding-left: 17px;
                padding-right: 17px;
            }

            .client-table thead th,
            .client-table tbody td {
                padding-left: 15px;
                padding-right: 15px;
            }

            .custom-toast {
                min-width: auto;
                width: calc(100vw - 30px);
            }
        }
    </style>


    <!-- ==============================
         TOAST
    ============================== -->

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

            <button type="button"
                class="toast-close"
                onclick="hideToast()">
                <i class="fas fa-times"></i>
            </button>

        </div>

    </div>


    <!-- ==============================
         DASHBOARD
    ============================== -->

    <div class="dashboard-wrapper">

        <!-- HEADER -->

        <div class="dashboard-header">

            <div class="dashboard-title">

                <div class="dashboard-title-icon">
                    <i class="bi bi-speedometer2"></i>
                </div>

                <div>
                    <small>Workspace Overview</small>
                    <h1>Dashboard</h1>
                </div>

            </div>

        </div>


        <!-- ==============================
             STAFF PROGRESS
        ============================== -->

        <div class="staff-grid">

            <asp:Repeater
                ID="staffreapeter"
                runat="server"
                OnItemCommand="staffreapeter_ItemCommand">

                <ItemTemplate>

                    <div class="staff-card">

                        <div class="staff-info">

                            <div class="staff-avatar">
                                <i class="bi bi-person"></i>
                            </div>

                            <div class="staff-details">

                                <p class="staff-name">
                                    <%# Eval("name") %>
                                </p>

                                <span class="staff-label">Team Member</span>

                            </div>

                        </div>

                        <div class="staff-arrow">
                            <a href="staff-summary.aspx?ref=<%# Eval("name") %>"><i class="bi bi-arrow-right"></i></a>
                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <!-- ==============================
             TEAM ACTIVITY
        ============================== -->

        <div class="dashboard-grid">


            <!-- LOW VIEWS CLIENTS -->
            <div class="dashboard-panel">

                <div class="panel-heading">
                    <div class="panel-heading-left">
                        <div class="panel-icon" style="background: #fff7ed; color: #ea580c;">
                            <i class="bi bi-graph-down-arrow"></i>
                        </div>
                        <div>
                            <h2>Low Views Clients</h2>
                            <p>Clients with fewer than 1,000 views this month</p>
                        </div>
                    </div>
                </div>

                <div class="client-table-wrapper">
                    <table class="client-table">
                        <thead>
                            <tr>
                                <th>Client Name</th>
                                <th>Monthly Views</th>
                                <th>Facebook</th>
                                <th>Instagram</th>
                                <th>YouTube</th>
                                <th>Google Business</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptLowViews" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <strong><%# Eval("client_name") %></strong>
                                        </td>
                                        <td>
                                            <span style="color: #dc2626; font-weight: 700;">
                                                <%# Eval("total_views") %>
                                            </span>
                                        </td>
                                        <td>
                                            <a class="social-btn" target="_blank"
                                                href='<%# Eval("fb") %>'>Visit</a>
                                        </td>
                                        <td>
                                            <a class="social-btn" target="_blank"
                                                href='<%# Eval("insta") %>'>Visit</a>
                                        </td>
                                        <td>
                                            <a class="social-btn" target="_blank"
                                                href='<%# Eval("yt") %>'>Visit</a>
                                        </td>
                                        <td>
                                            <a class="social-btn" target="_blank"
                                                href='<%# Eval("gmb") %>'>Visit</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>

            </div>


            <div class="dashboard-panel">

                <div class="panel-heading">

                    <div class="panel-heading-left">

                        <div class="panel-icon">
                            <i class="bi bi-activity"></i>
                        </div>

                        <div>

                            <h2>Team Activity</h2>

                            <p>
                                Recent operational updates
                            </p>

                        </div>

                    </div>

                </div>


                <div class="activity-list">

                    <asp:Repeater
                        ID="rptbinddata"
                        runat="server"
                        OnItemCommand="rptbinddata_ItemCommand">

                        <ItemTemplate>

                            <div class="activity-item">

                                <span class="activity-dot"></span>

                                <div>

                                    <p class="activity-staff">
                                        <%# Eval("staff_id") %>
                                    </p>

                                    <p class="activity-details">
                                        <%# Eval("work_details") %>
                                    </p>

                                </div>

                            </div>

                        </ItemTemplate>

                    </asp:Repeater>

                </div>

            </div>


            <!-- ==============================
                 CLIENTS
            ============================== -->

            <div class="dashboard-panel">

                <div class="panel-heading">

                    <div class="panel-heading-left">

                        <div class="panel-icon">
                            <i class="bi bi-buildings"></i>
                        </div>

                        <div>

                            <h2>Recent Clients</h2>

                            <p>
                                Latest account activity across workspace
                            </p>

                        </div>

                    </div>

                </div>


                <div class="client-table-wrapper">

                    <table class="client-table">

                        <thead>

                            <tr>

                                <th>Client</th>

                                <th>Facebook</th>

                                <th>Instagram</th>

                                <th>GMB</th>

                                <th>YouTube</th>
                                <th>Linkedin</th>
                                <th>Twitter</th>

                            </tr>

                        </thead>


                        <tbody>

                            <asp:Repeater
                                ID="Repeater1"
                                runat="server"
                                OnItemCommand="Repeater1_ItemCommand">

                                <ItemTemplate>

                                    <tr>

                                        <td>

                                            <div class="client-name">

                                                <div class="client-avatar">
                                                    <%# Eval("business_name").ToString().Substring(0,1).ToUpper() %>
                                                </div>

                                                <span>
                                                    <%# Eval("business_name") %>
                                                </span>

                                            </div>

                                        </td>


                                        <td>

                                            <a class="social-btn"
                                                target="_blank"
                                                href='<%# Eval("facebook") %>'>

                                                <i class="bi bi-facebook"></i>
                                                Visit

                                            </a>

                                        </td>


                                        <td>

                                            <a class="social-btn"
                                                target="_blank"
                                                href='<%# Eval("instagram") %>'>

                                                <i class="bi bi-instagram"></i>
                                                Visit

                                            </a>

                                        </td>


                                        <td>

                                            <a class="social-btn"
                                                target="_blank"
                                                href='<%# Eval("gmb") %>'>

                                                <i class="bi bi-google"></i>
                                                Visit

                                            </a>

                                        </td>


                                        <td>

                                            <a class="social-btn"
                                                target="_blank"
                                                href='<%# Eval("youtube") %>'>

                                                <i class="bi bi-youtube"></i>
                                                Visit

                                            </a>

                                        </td>

                                        <td>

                                            <a class="social-btn"
                                                target="_blank"
                                                href='<%# Eval("linkedin") %>'>

                                                <i class="bi bi-linkedin"></i>
                                                Visit

                                            </a>

                                        </td>

                                        <td>

                                            <a class="social-btn"
                                                target="_blank"
                                                href='<%# Eval("twitter") %>'>

                                                <i class="bi bi-twitter"></i>
                                                Visit

                                            </a>

                                        </td>

                                    </tr>

                                </ItemTemplate>

                            </asp:Repeater>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>

</asp:Content>
