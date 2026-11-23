<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Staff/StaffMasterPage.master" CodeFile="social-media-report.aspx.cs" Inherits="Staff_social_media_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        /* Keep all table row data in one line */
        #ordersTable {
            width: 100%;
            white-space: nowrap;
            border-collapse: collapse;
        }

            #ordersTable th,
            #ordersTable td {
                padding: 8px 10px;
                font-size: 13px;
                white-space: nowrap;
            }

                /* Social media action links */
                #ordersTable td a {
                    display: inline-block;
                    text-decoration: none;
                    margin: 0 3px;
                }

        /* Horizontal scrolling */
        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        /* Keep table headings in one line */
        #ordersTable thead th {
            white-space: nowrap;
            font-weight: 600;
        }
    </style>

    <style>
        /* Social Media Summary Cards */
        .social-summary-grid {
            display: grid;
            grid-template-columns: repeat(7, minmax(120px, 1fr));
            gap: 10px;
            margin-bottom: 20px;
            width: 100%;
        }

        .social-summary-card {
            background: #fff;
            border: 1px solid #edf0f5;
            border-radius: 9px;
            padding: 10px 12px;
            display: flex;
            align-items: center;
            gap: 9px;
            min-width: 0;
            box-shadow: 0 2px 7px rgba(0,0,0,0.04);
        }

        .social-summary-icon {
            width: 35px;
            height: 35px;
            min-width: 35px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
        }

        .social-summary-info {
            min-width: 0;
        }

            .social-summary-info h4 {
                font-size: 17px;
                font-weight: 700;
                margin: 0;
                color: #202938;
                line-height: 1.3;
            }

            .social-summary-info p {
                font-size: 11px;
                color: #7b8494;
                margin: 2px 0 0;
                white-space: nowrap;
            }

        .summary-views {
            background: #e8f0ff;
            color: #3478ed;
        }

        .summary-subscribe {
            background: #ffe9e9;
            color: #e94343;
        }

        .summary-likes {
            background: #fff0e5;
            color: #f28b35;
        }

        .summary-comments {
            background: #e9e6ff;
            color: #7659d6;
        }

        .summary-followers {
            background: #e2f8f0;
            color: #16a477;
        }

        .summary-share {
            background: #e4f5ff;
            color: #1597cf;
        }

        .summary-reviews {
            background: #fff5d9;
            color: #d49b19;
        }

        @media(max-width: 992px) {
            .social-summary-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media(max-width: 480px) {
            .social-summary-grid {
                grid-template-columns: 1fr 1fr;
                gap: 9px;
            }

            .social-summary-card {
                padding: 12px 9px;
                gap: 8px;
            }

            .social-summary-icon {
                width: 36px;
                height: 36px;
                min-width: 36px;
                font-size: 16px;
            }

            .social-summary-info h4 {
                font-size: 18px;
            }

            .social-summary-info p {
                font-size: 11px;
            }
        }
        /* Responsive */
        @media(max-width: 1100px) {
            .social-summary-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        @media(max-width: 576px) {
            .social-summary-grid {
                grid-template-columns: repeat(2, 1fr);
            }
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

    <div class="container-fluid px-3 px-lg-4 py-4">

        <div class="page-heading">
            <div class="page-heading-copy">
                <span class="page-icon"><i class="bi bi-person-plus" aria-hidden="true"></i></span>
                <div>
                    <h3>Manage Social Media</h3>
                </div>
            </div>
        </div>

        <!-- Social Media Summary -->
        <div class="social-summary-grid">

            <div class="social-summary-card">
                <div class="social-summary-icon summary-views">
                    <i class="fa fa-eye"></i>
                </div>
                <div class="social-summary-info">
                    <h4>1,000</h4>
                    <p>Target Views</p>
                </div>
            </div>

            <div class="social-summary-card">
                <div class="social-summary-icon summary-subscribe">
                    <i class="fa fa-youtube-play"></i>
                </div>
                <div class="social-summary-info">
                    <h4>50</h4>
                    <p>Target Subscriber</p>
                </div>
            </div>

            <div class="social-summary-card">
                <div class="social-summary-icon summary-likes">
                    <i class="fa fa-heart"></i>
                </div>
                <div class="social-summary-info">
                    <h4>100</h4>
                    <p>Target Likes</p>
                </div>
            </div>

            <div class="social-summary-card">
                <div class="social-summary-icon summary-comments">
                    <i class="fa fa-comments"></i>
                </div>
                <div class="social-summary-info">
                    <h4>30</h4>
                    <p>Target Comments</p>
                </div>
            </div>

            <div class="social-summary-card">
                <div class="social-summary-icon summary-followers">
                    <i class="fa fa-users"></i>
                </div>
                <div class="social-summary-info">
                    <h4>50</h4>
                    <p>Target Followers</p>
                </div>
            </div>

            <div class="social-summary-card">
                <div class="social-summary-icon summary-share">
                    <i class="fa fa-share-alt"></i>
                </div>
                <div class="social-summary-info">
                    <h4>60</h4>
                    <p>Target Group Share</p>
                </div>
            </div>

            <div class="social-summary-card">
                <div class="social-summary-icon summary-reviews">
                    <i class="fa fa-star"></i>
                </div>
                <div class="social-summary-info">
                    <h4>20</h4>
                    <p>Target GMB Reviews</p>
                </div>
            </div>

        </div>

        <section class="panel">

            <div class="panel-header">
                <input class="form-control form-control-sm table-search" type="search" placeholder="Search orders" data-table-search="ordersTable" aria-label="Search orders">
            </div>

            <div class="table-responsive">
                <table class="table align-middle mb-0" id="ordersTable" data-searchable-table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Action</th>
                            <th>FB Follower</th>
                            <th>IG Follower</th>
                            <th>YT Subscribe</th>
                            <th>FB View</th>
                            <th>IG View</th>
                            <th>YT View</th>
                            <th>FB Like</th>
                            <th>IG Like</th>
                            <th>YT Like</th>
                            <th>FB Comment</th>
                            <th>IG Comment</th>
                            <th>YT Comment</th>
                            <th>FB Share</th>
                            <th>IG Share</th>
                            <th>YT Share</th>
                            <th>GMB Review</th>
                            <th>Month</th>
                        </tr>
                    </thead>
                    <tbody>

                        <asp:Repeater ID="rptbinddata" runat="server" OnItemCommand="rptbinddata_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="fw-semibold"><a href='<%# "show-client-report.aspx?ref=" + Server.UrlEncode(Convert.ToString(Eval("client_name"))) %>'><%# Eval("client_name") %></a></td>
                                    <td>
                                        <a href='<%# Eval("fb") %>' style="color: blue;"><i class="fa fa-facebook-square"></i></a>|
                                        <a href='<%# Eval("insta") %>' style="color: #b52165;"><i class="fa fa-instagram"></i></a>|
                                        <a href='<%# Eval("yt") %>' style="color: #ff0007;"><i class="fa fa-youtube"></i></a>|
                                        <a href='<%# Eval("gmb") %>' style="color: #2fa004;"><i class="fa fa-google"></i></a>|
                                        <a href='<%# Eval("linkedin") %>' style="color: #1083b8;"><i class="fa fa-linkedin-square"></i></a>|
                                        <a href='<%# Eval("twitter") %>' style="color: #0dd5ea;"><i class="fa fa-twitter-square"></i></a>
                                    </td>
                                    <td><%# Eval("fb_followers") %></td>
                                    <td><%# Eval("insta_followers") %></td>
                                    <td><%# Eval("yt_subscriber") %></td>
                                    <td><%# Eval("fb_views") %></td>
                                    <td><%# Eval("insta_views") %></td>
                                    <td><%# Eval("yt_views") %></td>
                                    <td><%# Eval("fb_likes") %></td>
                                    <td><%# Eval("insta_likes") %></td>
                                    <td><%# Eval("yt_likes") %></td>
                                    <td><%# Eval("fb_cmt") %></td>
                                    <td><%# Eval("insta_cmt") %></td>
                                    <td><%# Eval("yt_cmt") %></td>
                                    <td><%# Eval("fb_group_share") %></td>
                                    <td><%# Eval("insta_group_share") %></td>
                                    <td><%# Eval("yt_group_share") %></td>
                                    <td><%# Eval("gmb_review") %></td>
                                    <td><%# Eval("month_name") %></td>

                                </tr>

                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        </section>
    </div>

</asp:Content>

