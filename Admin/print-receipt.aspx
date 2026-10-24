<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print-receipt.aspx.cs" Inherits="Admin_print_receipt" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Receipt</title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css" />
    <link rel="stylesheet" href="assets/css/style.css" />

    <style>
        * {
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;
            background: #eeeeee;
            font-family: Calibri, "Calibri (MS)", Arial, sans-serif;
            color: #222;
        }


        /* =========================================================
           A4 SCREEN PAGE
        ========================================================= */

        .a4-page {
            width: 210mm;
            min-height: 297mm;
            background: #ffffff;
            margin: 20px auto;
            padding: 12mm 14mm;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            position: relative;
        }


        /* =========================================================
           HEADER
        ========================================================= */

        .receipt-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-bottom: 8px;
            border-bottom: 1px solid #222;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        /* =========================================================
   QUOTATION + DATE ROW
========================================================= */

        .quotation-date-row {
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            margin-top: 8px;
            margin-bottom: 8px;
            padding: 0;
        }

        .quotation-title {
            width: 50%;
            text-align: left;
            font-size: 14px;
            line-height: 1.2;
        }

        .quotation-date {
            width: 50%;
            text-align: right;
            font-size: 14px;
            line-height: 1.2;
        }

            .quotation-title i,
            .quotation-date i {
                white-space: nowrap;
            }

        /* LOGO */

        .logo-area {
            width: 28%;
            text-align: left;
        }

            .logo-area img {
                width: 135px;
                height: auto;
                display: block;
            }


        /* COMPANY */

        .company-area {
            width: 72%;
            text-align: right;
            font-family: Calibri, "Calibri (MS)", Arial, sans-serif;
        }

            .company-area h2 {
                margin: 0 0 5px 0;
                font-size: 25px;
                font-weight: 700;
            }

            .company-area p {
                margin: 0;
                font-size: 13px;
                line-height: 1.5;
            }


        /* =========================================================
           HEADER DESIGN IMAGE
        ========================================================= */

        .separator {
            width: 100%;
            margin: 8px 0 15px 0;
            page-break-inside: avoid;
            break-inside: avoid;
        }

            .separator img {
                width: 100%;
                height: auto;
                display: block;
            }


        /* =========================================================
           CUSTOMER
        ========================================================= */

        .customer-section {
            margin-top: 8px;
            margin-bottom: 12px;
            page-break-inside: avoid;
            break-inside: avoid;
        }

            .customer-section h4 {
                margin: 0 0 4px 0;
                font-size: 17px;
            }

            .customer-section p {
                margin: 3px 0;
                font-size: 14px;
                line-height: 1.5;
            }


        /* =========================================================
           CONTENT SECTION
        ========================================================= */

        .content-section {
            margin-top: 12px;
        }

            .content-section h4 {
                margin: 0 0 5px 0;
                padding-bottom: 3px;
                font-size: 17px;
                font-weight: 700;
                border-bottom: 1px solid #333;
            }

            .content-section p {
                margin: 5px 0;
                font-size: 14px;
                line-height: 1.55;
            }

            .content-section ul {
                margin-top: 5px;
                margin-bottom: 8px;
                padding-left: 25px;
            }

            .content-section li {
                font-size: 14px;
                line-height: 1.5;
                margin-bottom: 2px;
            }


        /* =========================================================
           FOOTER IMAGE
        ========================================================= */

        .footer-image {
            width: 100%;
            margin-top: 25px;
        }

            .footer-image img {
                width: 100%;
                height: auto;
                display: block;
            }


        /* =========================================================
           PRINT BUTTON
        ========================================================= */

        .print-area {
            text-align: center;
            margin: 20px;
        }

        .print-button {
            border: none;
            background: #222;
            color: #fff;
            padding: 10px 25px;
            border-radius: 5px;
            font-family: Calibri, Arial, sans-serif;
            font-size: 15px;
            cursor: pointer;
        }

            .print-button:hover {
                background: #444;
            }


        /* =========================================================
           PRINT TOP SPACE
           
           This creates a fixed 25mm top area during printing.
        ========================================================= */




        /* =========================================================
           PRINT FOOTER
        ========================================================= */

        .print-footer {
            width: 100% !important;
            height: 25mm !important;
        }

        @media screen {

            .a4-page {
                width: 210mm;
                min-height: 297mm;
                margin: 20px auto;
                padding: 12mm 14mm;
                background: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            }
        }



        @media print {

            @page {
                size: A4 portrait;
                margin: 15mm 14mm 32mm 14mm;
            }

            html,
            body {
                margin: 0 !important;
                padding: 0 !important;
                width: 100% !important;
                background: #ffffff !important;
                font-family: Calibri, "Calibri (MS)", Arial, sans-serif;
            }

            .print-area {
                display: none !important;
            }

            .quotation-date-row {
                display: flex !important;
                flex-direction: row !important;
                width: 100% !important;
                justify-content: space-between !important;
                align-items: center !important;
                margin-top: 8px !important;
                margin-bottom: 8px !important;
                padding: 0 !important;
                page-break-inside: avoid !important;
                break-inside: avoid !important;
            }

            .quotation-title {
                width: 50% !important;
                text-align: left !important;
                display: block !important;
            }

            .quotation-date {
                width: 50% !important;
                text-align: right !important;
                display: block !important;
            }

                .quotation-title i,
                .quotation-date i {
                    white-space: nowrap !important;
                }

            .a4-page {
                width: 100% !important;
                min-height: 0 !important;
                height: auto !important;
                margin: 0 !important;
                padding: 0 !important;
                background: #ffffff !important;
                box-shadow: none !important;
                overflow: visible !important;
                position: static !important;
            }

            .receipt-header,
            .separator,
            .customer-section {
                page-break-inside: avoid !important;
                break-inside: avoid !important;
            }

            .content-section {
                margin-top: 12px !important;
                page-break-inside: auto !important;
                break-inside: auto !important;
                overflow: visible !important;
            }

                .content-section h4 {
                    page-break-after: avoid !important;
                    break-after: avoid !important;
                }

                .content-section p {
                    page-break-inside: auto !important;
                    break-inside: auto !important;
                }

                .content-section ul {
                    page-break-inside: auto !important;
                    break-inside: auto !important;
                }

                .content-section li {
                    page-break-inside: avoid !important;
                    break-inside: avoid !important;
                }


            .print-footer {
                display: block !important;
                position: fixed !important;
                left: 0 !important;
                right: 0 !important;
                bottom: 0 !important;
                width: 100% !important;
                height: 25mm !important;
                margin: 0 !important;
                padding: 0 !important;
                background: #ffffff !important;
                z-index: 999999 !important;
                page-break-inside: avoid !important;
                break-inside: avoid !important;
            }

                .print-footer img {
                    display: block !important;
                    width: 100% !important;
                    height: 25mm !important;
                    object-fit: contain !important;
                    object-position: center bottom !important;
                    margin: 0 !important;
                    padding: 0 !important;
                }

            a {
                color: #222 !important;
                text-decoration: none !important;
            }
        }
    </style>

</head>

<body>

    <div class="print-area">

        <button type="button"
            class="print-button"
            onclick="window.print();">

            <i class="bi bi-printer"></i>

            Print Receipt

        </button>
    </div>

    <form id="form1" runat="server">

        <div class="a4-page">

            <div class="receipt-header">

                <!-- LOGO -->

                <div class="logo-area">

                    <img src="assets/LOGO.png"
                        alt="Digital Bull Logo" />

                </div>

                <!-- COMPANY DETAILS -->

                <div class="company-area">

                    <h2>
                        <i>Digital Bull™</i>
                    </h2>

                    <p>

                        <i>Shop No.– 404,405, Third Floor Mobile Plaza

                            <br />

                            Khowa Mandi Road Golghar,
                            Gorakhpur, U.P.-273001, India

                            <br />

                            Mob: +91-9044815507

                            |

                            E-mail: info@digitalbull.in

                            |

                            www.digitalbull.in

                        </i>

                    </p>

                </div>

            </div>

            <div class="customer-section">
                <div class="quotation-date-row">

                    <div class="quotation-title">
                        <i><b>Quotation</b></i>
                    </div>

                    <div class="quotation-date">
                        <i>
                            <b>Date : <span runat="server" id="date"></span>
                            </b>
                        </i>
                    </div>

                </div>

            </div>

            <div class="separator">

                <img src="assets/h1.png"
                    alt="Header Design" />

            </div>

            <div class="customer-section">

                <h4>
                    <i>To,</i>
                </h4>

                <h4>
                    <b><i runat="server" id="client_name"></i></b>
                </h4>

                <p>

                    <i>

                        <b>Phone No:</b>

                        <span runat="server" id="mobileno"></span>

                        <br />

                        <b>Email Id:</b>
                        <span runat="server" id="email"></span>
                        <br />

                        <b>Address:</b>
                        <span runat="server" id="address"></span>


                    </i>

                </p>

            </div>

            <div class="content-section">

                <h4>
                    <i>ACKNOWLEDGMENT</i>
                </h4>

                <p>

                    <i>The client acknowledges Digital Bull to implement
                        Digital Marketing services for his/her company.

                    </i>

                </p>

                <p>

                    <i>Overall duration for your contract is 6 months
                        with Digital Marketing.

                    </i>

                </p>

            </div>

            <div class="content-section">

                <h4>
                    <i>SERVICES</i>
                </h4>

                <p>

                    <i>Here are the following services that were selected
                        by the client:

                    </i>

                </p>

                <i>
                    <asp:Label runat="server" ID="services"></asp:Label></i>

            </div>

            <div class="content-section">

                <h4>
                    <i>PRICING</i>
                </h4>

                <p>

                    <i>A separate document will be created for the
                        breakdown of pricing which includes the above
                        service mentioned.

                    </i>

                </p>

            </div>

            <div class="content-section">

                <h4>
                    <i>PAYMENTS</i>
                </h4>

                <p>

                    <i>Digital Marketing Plan With Best ROI:
                        (<span runat="server" id="package"></span>) Rs.<span runat="server" id="price"></span>/- Per Month
                        

                    </i>

                </p>

                <p>

                    <i>Payments will be made by Cash or Online.

                    </i>

                </p>

            </div>

            <div class="content-section">

                <h4>
                    <i>WARRANTY OF SERVICES</i>
                </h4>

                <p>

                    <i>Digital Bull™ assures that services offered will
                        be in excellent, superior, and first-rate quality.

                        For changes in the way of how we render our service,
                        please notify us.

                        If you're not satisfied with our work, kindly let
                        us know so that we can further assist you.

                    </i>

                </p>

            </div>

            <div class="content-section">

                <h4>
                    <i>SERVICE DELIVERY</i>
                </h4>

                <p>

                    <i>After completing the project based on the approved
                        design/plan, the client will be given 1 Year to
                        decide if the project will be tagged as complete
                        or incomplete.

                        If incomplete, Digital Bull™ will further assist
                        the client with the same rate and apply the changes
                        based on the requests of the client.

                    </i>

                </p>

            </div>

            <div class="print-footer">

                <img src="assets/f1.png" style="width: 100%; height: auto;"
                    alt="Digital Bull Footer" />

            </div>

        </div>

    </form>
</body>

</html>
