<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="staff-summary.aspx.cs" Inherits="Admin_staff_summary" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="Server">

    <style>
        /* =====================================
           STAFF SUMMARY
        ===================================== */

        .staff-summary-page {
            padding: 25px;
            background: #f6f7fb;
            min-height: 100vh;
        }


        /* =====================================
           PAGE HEADER
        ===================================== */

        .summary-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .summary-title {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .summary-title-icon {
            width: 52px;
            height: 52px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #172033;
            color: #fff;
            font-size: 21px;
            box-shadow: 0 8px 22px rgba(23,32,51,.15);
        }

        .summary-title small {
            display: block;
            color: #929bad;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .8px;
        }

        .summary-title h1 {
            margin: 3px 0 0;
            color: #172033;
            font-size: 26px;
            font-weight: 750;
        }


        /* =====================================
       STAFF PROFILE CARD
    ===================================== */

        .staff-profile {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 23px;
            background: #fff;
            border: 1px solid #edf0f5;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(30,41,59,.055);
            margin-bottom: 20px;
        }

        .staff-profile-left {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .staff-profile-avatar {
            width: 62px;
            height: 62px;
            border-radius: 17px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eff6ff;
            color: #2563eb;
            font-size: 25px;
        }

        .staff-profile-name {
            margin: 0;
            color: #172033;
            font-size: 19px;
            font-weight: 750;
        }

        .staff-profile-role {
            margin-top: 4px;
            color: #929bad;
            font-size: 12px;
        }

        .staff-profile-date {
            color: #8b94a5;
            font-size: 12px;
        }


        /* =====================================
       STAT CARDS
    ===================================== */

        .summary-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 20px;
        }

        .summary-stat {
            padding: 20px;
            background: #fff;
            border: 1px solid #edf0f5;
            border-radius: 18px;
            box-shadow: 0 7px 25px rgba(30,41,59,.05);
        }

        .stat-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .stat-label {
            color: #8c95a6;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .5px;
        }

        .stat-icon {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
        }

        .stat-number {
            margin-top: 13px;
            color: #172033;
            font-size: 27px;
            font-weight: 800;
        }

        .stat-info {
            margin-top: 4px;
            color: #9aa2b1;
            font-size: 11px;
        }

        .stat-blue .stat-icon {
            background: #eff6ff;
            color: #2563eb;
        }

        .stat-green .stat-icon {
            background: #ecfdf5;
            color: #16a34a;
        }

        .stat-orange .stat-icon {
            background: #fff7ed;
            color: #ea580c;
        }

        .stat-red .stat-icon {
            background: #fef2f2;
            color: #dc2626;
        }


        /* =====================================
       CONTENT GRID
    ===================================== */

        .summary-content {
            display: grid;
            /*grid-template-columns: 1fr 340px;
            gap: 20px;*/
        }

        .summary-panel {
            background: #fff;
            border: 1px solid #edf0f5;
            border-radius: 20px;
            box-shadow: 0 7px 25px rgba(30,41,59,.05);
            overflow: hidden;
        }

        .panel-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 22px;
            border-bottom: 1px solid #f0f2f6;
        }

        .panel-title {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .panel-title-icon {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            background: #f1f5ff;
            color: #4f46e5;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .panel-title h2 {
            margin: 0;
            color: #172033;
            font-size: 16px;
            font-weight: 750;
        }

        .panel-title p {
            margin: 3px 0 0;
            color: #9aa2b1;
            font-size: 11px;
        }


        /* =====================================
       FILTER
    ===================================== */

        .filter-box {
            display: flex;
            gap: 8px;
        }

        .filter-control {
            height: 34px;
            padding: 0 10px;
            border: 1px solid #e5e8ee;
            border-radius: 8px;
            background: #fff;
            color: #626b7d;
            font-size: 11px;
            outline: none;
        }


        /* =====================================
       WORK DETAILS
    ===================================== */

        .work-list {
            padding: 5px 22px 15px;
        }

        .work-item {
            display: flex;
            gap: 14px;
            padding: 17px 0;
            border-bottom: 1px solid #f1f3f6;
        }

            .work-item:last-child {
                border-bottom: 0;
            }

        .work-icon {
            width: 40px;
            height: 40px;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 11px;
            background: #f1f5ff;
            color: #4f46e5;
        }

        .work-content {
            flex: 1;
        }

        .work-title {
            margin: 0;
            color: #263247;
            font-size: 13px;
            font-weight: 700;
        }

        .work-description {
            margin: 5px 0 0;
            color: #8c95a6;
            font-size: 12px;
            line-height: 1.5;
        }

        .work-meta {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 7px;
            color: #000;
            font-size: 12px;
            font-weight: 600;
        }


        /* =====================================
       STATUS
    ===================================== */

        .status {
            display: inline-flex;
            align-items: center;
            padding: 5px 9px;
            border-radius: 20px;
            font-size: 10px;
            font-weight: 700;
        }

            .status::before {
                content: "";
                width: 5px;
                height: 5px;
                border-radius: 50%;
                margin-right: 5px;
            }

        .status-completed {
            background: #ecfdf5;
            color: #15803d;
        }

            .status-completed::before {
                background: #16a34a;
            }

        .status-progress {
            background: #eff6ff;
            color: #2563eb;
        }

            .status-progress::before {
                background: #2563eb;
            }

        .status-pending {
            background: #fff7ed;
            color: #ea580c;
        }

            .status-pending::before {
                background: #ea580c;
            }


        /* =====================================
       RIGHT SIDE
    ===================================== */

        .side-content {
            padding: 20px;
        }

        .summary-progress {
            margin-bottom: 25px;
        }

        .summary-progress-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 12px;
            font-weight: 700;
            color: #4b5563;
        }

        .summary-progress-bar {
            height: 9px;
            background: #edf0f5;
            border-radius: 20px;
            overflow: hidden;
        }

        .summary-progress-fill {
            width: 72%;
            height: 100%;
            background: #2563eb;
            border-radius: 20px;
        }


        /* =====================================
       WORK BREAKDOWN
    ===================================== */

        .breakdown-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 13px 0;
            border-bottom: 1px solid #f1f3f6;
        }

            .breakdown-item:last-child {
                border-bottom: 0;
            }

        .breakdown-left {
            display: flex;
            align-items: center;
            gap: 9px;
        }

        .breakdown-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
        }

        .dot-green {
            background: #16a34a;
        }

        .dot-blue {
            background: #2563eb;
        }

        .dot-orange {
            background: #f59e0b;
        }

        .dot-red {
            background: #dc2626;
        }

        .breakdown-name {
            color: #687184;
            font-size: 12px;
        }

        .breakdown-value {
            color: #172033;
            font-size: 13px;
            font-weight: 750;
        }


        /* =====================================
       RESPONSIVE
    ===================================== */

        @media(max-width:1100px) {

            .summary-content {
                grid-template-columns: 1fr;
            }

            .summary-stats {
                grid-template-columns: repeat(2,1fr);
            }
        }

        @media(max-width:650px) {

            .staff-summary-page {
                padding: 15px;
            }

            .summary-stats {
                grid-template-columns: 1fr;
            }

            .staff-profile {
                align-items: flex-start;
                gap: 15px;
                flex-direction: column;
            }

            .summary-header {
                align-items: flex-start;
            }

            .filter-box {
                display: none;
            }
        }

        /* ==========================================
   WORK LOG CARD
========================================== */

        .work-log-card {
            display: flex;
            position: relative;
            padding: 20px 22px;
            background: #ffffff;
            border: 1px solid #edf0f5;
            border-radius: 18px;
            margin-bottom: 14px;
            box-shadow: 0 5px 20px rgba(30, 41, 59, .045);
            transition: all .25s ease;
        }

            .work-log-card:hover {
                transform: translateY(-2px);
                border-color: #dfe5ee;
                box-shadow: 0 12px 30px rgba(30, 41, 59, .08);
            }


        /* ==========================================
   TIMELINE
========================================== */

        .work-timeline {
            width: 48px;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-right: 17px;
        }

        .work-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #eef2ff;
            color: #4f46e5;
            font-size: 17px;
            flex-shrink: 0;
            transition: all .25s ease;
        }

        .work-log-card:hover .work-icon {
            background: #4f46e5;
            color: #ffffff;
            transform: scale(1.05);
        }

        .timeline-line {
            width: 1px;
            flex: 1;
            min-height: 35px;
            margin-top: 8px;
            background: #e8ebf0;
        }


        /* ==========================================
   CONTENT
========================================== */

        .work-log-content {
            flex: 1;
            min-width: 0;
        }


        /* ==========================================
   TOP
========================================== */

        .work-log-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 15px;
            margin-bottom: 15px;
        }

        .client-label {
            display: block;
            margin-bottom: 3px;
            color: #9aa2b1;
            font-size: 9px;
            font-weight: 800;
            letter-spacing: .9px;
        }

        .work-client {
            margin: 0;
            color: #172033;
            font-size: 15px;
            font-weight: 750;
        }


        /* ==========================================
   WORKING TIME
========================================== */

        .work-time-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 7px 11px;
            border-radius: 8px;
            background: #f0fdf4;
            color: #15803d;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

            .work-time-badge i {
                font-size: 12px;
            }


        /* ==========================================
   WORK DETAILS
========================================== */

        .work-details-box {
            display: flex;
            align-items: flex-start;
            gap: 11px;
            padding: 13px 14px;
            background: #f8f9fb;
            border: 1px solid #f0f1f4;
            border-radius: 12px;
        }

        .details-icon {
            width: 30px;
            height: 30px;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            background: #ffffff;
            color: #667085;
            font-size: 13px;
        }

        .details-label {
            display: block;
            margin-bottom: 4px;
            color: #a0a7b5;
            font-size: 8px;
            font-weight: 800;
            letter-spacing: .7px;
        }

        .work-description {
            margin: 0;
            color: #5f697a;
            font-size: 12px;
            line-height: 1.6;
        }


        /* ==========================================
   FOOTER
========================================== */

        .work-log-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 14px;
        }

        .work-date {
            display: flex;
            align-items: center;
            gap: 6px;
            color: #969ead;
            font-size: 10px;
        }

            .work-date i {
                color: #737d8e;
            }


        .work-status {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #7d8798;
            font-size: 10px;
            font-weight: 600;
        }

        .status-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #22c55e;
            box-shadow: 0 0 0 3px #dcfce7;
        }


        /* ==========================================
   RESPONSIVE
========================================== */

        @media(max-width:600px) {

            .work-log-card {
                padding: 15px;
            }

            .work-timeline {
                width: 38px;
                margin-right: 12px;
            }

            .work-icon {
                width: 36px;
                height: 36px;
                border-radius: 10px;
                font-size: 14px;
            }

            .work-log-top {
                flex-direction: column;
                gap: 8px;
            }

            .work-time-badge {
                align-self: flex-start;
            }

            .work-details-box {
                padding: 11px;
            }

            .work-log-footer {
                align-items: flex-start;
                gap: 8px;
                flex-direction: column;
            }
        }
    </style>

    <div class="staff-summary-page">


        <!-- =================================
             PAGE HEADER
        ================================= -->

        <div class="summary-header">

            <div class="summary-title">

                <div class="summary-title-icon">
                    <i class="bi bi-person-workspace"></i>
                </div>

                <div>

                    <small>Staff Management</small>

                    <h1>Staff Summary</h1>

                </div>

            </div>

        </div>


        <!-- =================================
             STAFF PROFILE
        ================================= -->

        <div class="staff-profile">

            <div class="staff-profile-left">

                <div class="staff-profile-avatar">
                    <i class="bi bi-person"></i>
                </div>

                <div>

                    <h2 class="staff-profile-name" id="name" runat="server">Staff Name</h2>

                    <div class="staff-profile-role" id="role" runat="server">
                        Team Member • Digital Marketing Department
               
                    </div>

                </div>

            </div>



        </div>


        <div class="summary-content">


            <!-- WORK DETAILS -->

            <div class="summary-panel">

                <div class="panel-header">

                    <div class="panel-title">

                        <div class="panel-title-icon">
                            <i class="bi bi-list-check"></i>
                        </div>

                        <div>

                            <h2>Work Details</h2>

                            <p>
                                Recent work completed by staff
                       
                            </p>

                        </div>

                    </div>


                    <div class="filter-box">
                        <asp:TextBox AutoPostBack="true" OnTextChanged="dt_TextChanged" TextMode="Date" ID="dt" runat="server" class="filter-control"></asp:TextBox>
                    </div>

                </div>

                <div class="work-list">


                    <asp:Repeater ID="rptbinddata"
                        runat="server"
                        OnItemCommand="rptbinddata_ItemCommand">

                        <ItemTemplate>

                            <div class="work-log-card">

                                <!-- Left Timeline -->
                                <div class="work-timeline">

                                    <div class="work-icon">
                                        <i class="bi bi-briefcase-fill"></i>
                                    </div>

                                    <div class="timeline-line"></div>

                                </div>


                                <!-- Main Content -->
                                <div class="work-log-content">

                                    <!-- Top -->
                                    <div class="work-log-top">

                                        <div>

                                            <span class="client-label">CLIENT
                                            </span>

                                            <h3 class="work-client">
                                                <%# Eval("client_id") %>
                                            </h3>

                                        </div>

                                        <span class="work-time-badge">

                                            <i class="bi bi-clock"></i>

                                            <%# Eval("working_time") %>

                                        </span>

                                    </div>


                                    <!-- Work Details -->
                                    <div class="work-details-box">

                                        <div class="details-icon">
                                            <i class="bi bi-card-text"></i>
                                        </div>

                                        <div>

                                            <span class="details-label">WORK DETAILS
                                            </span>

                                            <p class="work-description">
                                                <%# Eval("work_details") %>
                                            </p>

                                        </div>

                                    </div>


                                    <!-- Footer -->
                                    <div class="work-log-footer">

                                        <span class="work-date">

                                            <i class="bi bi-calendar3"></i>

                                            <%# Eval("create_date") %>

                                        </span>

                                        <span class="work-status">

                                            <span class="status-dot"></span>

                                            Work Logged

                                        </span>

                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>

                    </asp:Repeater>

                </div>

            </div>

        </div>

    </div>

</asp:Content>
