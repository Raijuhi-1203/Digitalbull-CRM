<%@ Page Language="C#" MasterPageFile="~/Staff/StaffMasterPage.master" AutoEventWireup="true" CodeFile="view-ticket.aspx.cs" Inherits="Staff_view_ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="profile-page">




        <!-- =========================
              SUCCESS / ERROR MESSAGE
         ========================== -->

        <asp:Panel ID="pnlMessage"
            runat="server"
            Visible="false"
            CssClass="profile-message">

            <asp:Label ID="lblMessage"
                runat="server">
            </asp:Label>

        </asp:Panel>


        <div class="profile-layout">

            <!-- =========================
              RIGHT CONTENT
         ========================== -->

            <div class="profile-right">


                <!-- =========================
                      PERSONAL INFORMATION
                 ========================== -->

                <div class="settings-card">

                    <div class="settings-heading">

                        <div class="settings-heading-icon">
                            <i class="bi bi-person-plus"></i>
                        </div>

                        <div>

                            <h3>View support ticket</h3>

                            <p>Need Help? Submit a Ticket and We’ll Take Care of It.</p>

                        </div>

                    </div>


                    <div class="form-row">

                        <div class="form-group" style="pointer-events: none;">

                            <label>
                                Ticket ID

                            <span>*</span>
                            </label>

                            <div class="input-box">

                                <i class="fas fa-envelope"></i>

                                <asp:TextBox ID="ticket_id"
                                    runat="server"
                                    CssClass="form-control">
                                </asp:TextBox>

                            </div>



                        </div>

                        <div class="form-group" style="pointer-events: none;">

                            <label>
                                What problem are you having?
                            
                             <span>*</span>
                            </label>

                            <div class="input-box">

                                <i class="fas fa-user"></i>


                                <asp:DropDownList ID="dblproblem" class="form-control" runat="server">
                                    <asp:ListItem>Sales</asp:ListItem>
                                    <asp:ListItem>Billing</asp:ListItem>
                                    <asp:ListItem>Support</asp:ListItem>
                                </asp:DropDownList>
                            </div>



                        </div>

                        <div class="form-group" style="pointer-events: none;">

                            <label>
                                Subject

                             <span>*</span>
                            </label>

                            <div class="input-box">

                                <i class="fas fa-envelope"></i>

                                <asp:TextBox ID="subject"
                                    runat="server"
                                    CssClass="form-control"
                                    placeholder="Enter Subject">
                                </asp:TextBox>

                            </div>



                        </div>

                    </div>

                    <div class="form-group" style="pointer-events: none;">

                        <label>Message</label>

                        <div class="input-box textarea-box">

                            <asp:Label ID="descp"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Enter your message">
                            </asp:Label>

                        </div>

                    </div>

                    <div class="form-group">

                        <label>Reply</label>

                        <div class="input-box textarea-box">

                            <asp:TextBox ID="reply"
                                runat="server"
                                TextMode="MultiLine"
                                CssClass="form-control">
                            </asp:TextBox>

                        </div>

                    </div>

                    <div class="form-actions">

                        <asp:Button
                            ID="btnSubmit"
                            runat="server"
                            Text="Submit Reply"
                            CssClass="save-btn"
                            OnClick="btnSubmit_Click" />

                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- =========================
          CSS
     ========================== -->

    <style>
        .form-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
            border-top: 1px solid #edf0f2;
            padding-top: 18px;
            margin-top: 5px;
        }

        .save-btn {
            border: 0;
            padding: 11px 24px;
            min-width: 130px;
            border-radius: 8px;
            background: #07852f;
            color: #fff;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: all .25s ease;
        }

            .save-btn:hover {
                background: #056b26;
                transform: translateY(-1px);
                box-shadow: 0 5px 12px rgba(7,133,47,.18);
            }

            .save-btn:active {
                transform: translateY(0);
            }

        .profile-page {
            padding: 35px;
            width: 100%;
            box-sizing: border-box;
            background: #f6f8fa;
            min-height: calc(100vh - 100px);
            font-family: 'Poppins', sans-serif;
        }

        /* HEADER */

        .profile-header {
            margin-bottom: 28px;
        }

        .page-label {
            color: #07852f;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }

        .profile-header h1 {
            margin: 5px 0;
            color: #18212b;
            font-size: 28px;
            font-weight: 700;
        }

        .profile-header p {
            margin: 0;
            color: #858e97;
            font-size: 13px;
        }


        /* LAYOUT */

        .profile-layout {
            display: block;
            width: 100%;
            gap: 25px;
            align-items: start;
        }

        .profile-right {
            width: 100%;
            max-width: 100%;
        }

        /* LEFT CARD */

        .profile-card {
            background: #fff;
            border: 1px solid #e7ebef;
            border-radius: 15px;
            overflow: hidden;
            text-align: center;
            box-shadow: 0 4px 18px rgba(0,0,0,.025);
        }

        .profile-cover {
            height: 90px;
            background: linear-gradient(135deg,#07852f,#21a951);
        }

        .profile-image-wrapper {
            position: relative;
            width: 105px;
            height: 105px;
            margin: -52px auto 12px;
        }

        .profile-image {
            width: 105px;
            height: 105px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #fff;
            box-shadow: 0 3px 12px rgba(0,0,0,.12);
        }

        .profile-camera {
            position: absolute;
            right: 2px;
            bottom: 5px;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #07852f;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            border: 3px solid #fff;
            font-size: 11px;
        }

        .profile-file {
            display: none;
        }

        .profile-card h2 {
            margin: 5px 15px 2px;
            font-size: 18px;
            color: #252d35;
            font-weight: 700;
        }

        .profile-role {
            margin: 0;
            color: #929aa2;
            font-size: 11px;
        }

        .profile-status {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-top: 13px;
            padding: 5px 10px;
            border-radius: 20px;
            background: #eaf8ef;
            color: #07852f;
            font-size: 9px;
            font-weight: 600;
        }

        .status-dot {
            width: 6px;
            height: 6px;
            background: #07852f;
            border-radius: 50%;
        }

        .profile-divider {
            height: 1px;
            background: #edf0f2;
            margin: 20px;
        }


        /* PROFILE INFO */

        .profile-info {
            padding: 0 20px 20px;
            text-align: left;
        }

        .profile-info-row {
            display: flex;
            gap: 12px;
            margin-bottom: 18px;
        }

            .profile-info-row > i {
                width: 30px;
                height: 30px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 8px;
                background: #eaf8ef;
                color: #07852f;
                font-size: 11px;
            }

            .profile-info-row span {
                display: block;
                color: #9aa2a9;
                font-size: 9px;
                margin-bottom: 2px;
            }

            .profile-info-row strong {
                display: block;
                color: #39434c;
                font-size: 10px;
                font-weight: 600;
                word-break: break-word;
            }


        /* SETTINGS CARD */

        .settings-card {
            background: #fff;
            border: 1px solid #e7ebef;
            border-radius: 15px;
            padding: 25px;
            width: 100%;
            margin-bottom: 22px;
            box-shadow: 0 4px 18px rgba(0,0,0,.025);
        }

        .settings-heading {
            display: flex;
            gap: 13px;
            align-items: center;
            padding-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid #edf0f2;
        }

        .settings-heading-icon {
            width: 43px;
            height: 43px;
            border-radius: 11px;
            background: #0d6efd4d;
            color: #0d6efd;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 16px;
        }

        .settings-heading h3 {
            margin: 0 0 3px;
            font-size: 15px;
            color: #27313a;
            font-weight: 700;
        }

        .settings-heading p {
            margin: 0;
            color: #929aa2;
            font-size: 10px;
        }


        /* FORM */

        .form-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .form-group {
            margin-bottom: 18px;
        }

            .form-group label {
                display: block;
                margin-bottom: 7px;
                color: #4c555d;
                font-size: 10px;
                font-weight: 600;
            }

                .form-group label span {
                    color: #e53935;
                }

        .input-box {
            position: relative;
        }

            .input-box > i {
                position: absolute;
                left: 13px;
                top: 50%;
                transform: translateY(-50%);
                color: #a0a8ae;
                font-size: 11px;
                z-index: 2;
            }

            .input-box .form-control {
                height: 43px;
                border: 1px solid #e0e5e8;
                border-radius: 8px;
                padding: 0 12px 0 36px;
                font-size: 11px;
                color: #39434c;
                box-shadow: none;
            }

                .input-box .form-control:focus {
                    border-color: #07852f;
                    box-shadow: 0 0 0 3px rgba(7,133,47,.08);
                }

        .textarea-box > i {
            top: 16px;
            transform: none;
        }

        .textarea-box .form-control {
            height: auto;
            padding-top: 12px;
            resize: vertical;
        }

        .validation-error {
            display: block;
            color: #dc3545;
            font-size: 9px;
            margin-top: 5px;
        }


        /* BUTTON */

        .form-actions {
            display: flex;
            justify-content: flex-end;
            border-top: 1px solid #edf0f2;
            padding-top: 18px;
        }

        .save-btn,
        .password-btn {
            border: 0;
            padding: 10px 20px;
            border-radius: 8px;
            background: #07852f;
            color: #fff;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
        }

            .save-btn:hover,
            .password-btn:hover {
                background: #056b26;
            }

        .password-icon {
            background: #fff5df;
            color: #d18b00;
        }

        .password-btn {
            background: #26343d;
        }

            .password-btn:hover {
                background: #18232a;
            }


        /* MESSAGE */

        .profile-message {
            background: #eaf8ef;
            border: 1px solid #c9ecd5;
            color: #08752d;
            padding: 12px 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 11px;
        }


        /* RESPONSIVE */

        @media (max-width: 991px) {

            .profile-layout {
                grid-template-columns: 1fr;
            }

            .profile-left {
                max-width: 400px;
                width: 100%;
                margin: auto;
            }
        }


        @media (max-width: 767px) {

            .profile-page {
                padding: 20px 15px;
            }

            .profile-header h1 {
                font-size: 23px;
            }

            .settings-card {
                padding: 18px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .form-actions {
                justify-content: stretch;
            }

            .save-btn,
            .password-btn {
                width: 100%;
            }
        }
    </style>

    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {

            CKEDITOR.replace('descp', {
                height: 300,

                toolbar: [
                    {
                        name: 'basicstyles',
                        items: ['Bold', 'Italic', 'Underline', 'Strike']
                    },
                    {
                        name: 'paragraph',
                        items: [
                            'NumberedList',
                            'BulletedList',
                            '-',
                            'Outdent',
                            'Indent',
                            'Blockquote'
                        ]
                    },
                    {
                        name: 'styles',
                        items: ['Format']
                    },
                    {
                        name: 'insert',
                        items: ['Link', 'Table']
                    },
                    {
                        name: 'tools',
                        items: ['Maximize']
                    }
                ]
            });

        });
    </script>

</asp:Content>
