<%@ Page Language="C#" AutoEventWireup="true" CodeFile="current-print-receipt.aspx.cs" Inherits="Admin_current_print_receipt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Receipt</title>

    <style>
        @page {
            size: A4 portrait;
            margin: 0;
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            margin: 0;
            padding: 0;
            background: #e9e9e9;
        }

        body {
            font-family: "Comic Sans MS", "Trebuchet MS", Arial, sans-serif;
            color: #080808;
            -webkit-print-color-adjust: exact !important;
            print-color-adjust: exact !important;
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


        .page {
            position: relative;
            width: 210mm;
            height: 297mm;
            margin: 0 auto;
            overflow: hidden;
            background: #fff;
        }

        .content {
            position: relative;
            height: 100%;
            padding: 14mm 10mm 13mm;
        }

        /* ---------------- HEADER ---------------- */
        .header {
            position: relative;
            height: 49mm;
        }

        .logo {
            position: absolute;
            left: 3mm;
            top: 1mm;
            width: 48mm;
            height: 48mm;
            object-fit: contain;
        }

        .invoice-date {
            position: absolute;
            left: 3mm;
            top: 37mm;
            font-size: 14px;
            font-weight: 700;
            white-space: nowrap;
        }

        .company {
            position: absolute;
            right: 0;
            top: 1mm;
            width: 105mm;
            text-align: right;
        }

        .company-name {
            font-family: Arial, sans-serif;
            font-size: 34px;
            line-height: 1;
            font-weight: 800;
            margin-bottom: 5mm;
            letter-spacing: -1px;
        }

            .company-name .red {
                color: #ff2e32;
            }

            .company-name .blue {
                color: #073c80;
            }

        .company-info {
            font-size: 14px;
            line-height: 1.55;
            font-weight: 700;
        }

        /* ---------------- DECORATIVE STRIPE ---------------- */
        .stripe {
            position: absolute;
            left: 7mm;
            right: 4mm;
            top: 58mm;
            height: 15mm;
        }

        .stripe-bars {
            position: absolute;
            left: 0;
            top: 3mm;
            display: flex;
            gap: 4mm;
            align-items: center;
        }

        .bar {
            width: 16mm;
            height: 11mm;
            transform: skewX(-42deg);
        }

            .bar.blue {
                background: #073c80;
            }

            .bar.red {
                background: #ff3035;
            }

        .stripe-line-red {
            position: absolute;
            left: 70mm;
            right: 2mm;
            top: 6mm;
            height: 1.2mm;
            background: #ff3035;
            transform: skewX(-40deg);
            transform-origin: left;
        }

        .stripe-line-blue {
            position: absolute;
            left: 72mm;
            right: 2mm;
            top: 9mm;
            height: 1.2mm;
            background: #073c80;
            transform: skewX(-40deg);
            transform-origin: left;
        }

        .gear {
            position: absolute;
            right: 1mm;
            top: 1mm;
            font-family: Arial, sans-serif;
            font-size: 27px;
            color: #ff3035;
        }

        .gear-small {
            position: absolute;
            right: 7mm;
            top: 6mm;
            font-family: Arial, sans-serif;
            font-size: 18px;
            color: #073c80;
        }

        /* ---------------- BILL TO ---------------- */
        .bill-to {
            position: absolute;
            left: 10mm;
            right: 10mm;
            top: 102mm;
            
        }

        .bill-title {
            font-size: 18px;
            font-weight: 900;
            margin-bottom: 2mm;
        }

        .client-name {
            font-size: 18px;
            font-weight: 900;
            margin-bottom: 1mm;
        }

        .client-address {
            font-size: 16px;
            line-height: 1.25;
            white-space: nowrap;
           
        }

        /* ---------------- TABLE ---------------- */
        .invoice-table {
            position: absolute;
            left: 7mm;
            right: 7mm;
            top: 130mm;
            width: calc(100% - 14mm);
            border-collapse: collapse;
            font-size: 16px;
        }

            .invoice-table th,
            .invoice-table td {
                padding: 2.5mm 3mm;
                border-top: 1px solid #a9e3f5;
                border-bottom: 1px solid #a9e3f5;
                text-align: left;
                height: 10mm;
            }

            .invoice-table th {
                font-weight: 500;
                font-size: 16px;
            }

                .invoice-table th:nth-child(1),
                .invoice-table td:nth-child(1) {
                    width: 47%;
                }

                .invoice-table th:nth-child(2),
                .invoice-table td:nth-child(2) {
                    width: 30%;
                }

                .invoice-table th:nth-child(3),
                .invoice-table td:nth-child(3) {
                    width: 23%;
                    text-align: right;
                }

            .invoice-table .summary td {
                border-top: 0;
            }

                .invoice-table .summary td:nth-child(2) {
                    text-align: left;
                }

            .invoice-table .payment td {
                border-top: 1px solid #a9e3f5;
                border-bottom: 1px solid #a9e3f5;
            }

        /* ---------------- PAYMENT ---------------- */
        .payment-section {
            position: absolute;
            left: 20mm;
            right: 18mm;
            top: 188mm;
            height: 48mm;
            display: flex;
            gap: 10mm;
            align-items: center;
        }

        .qr-box {
            width: 50mm;
            height: 50mm;
            border: 1.5px solid #073c80;
            border-radius: 4mm;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 4mm;
            flex-shrink: 0;
            background: #fff;
        }

            .qr-box img {
                width: 62mm;
                height: 62mm;
                object-fit: contain;
            }

        .payment-info {
            flex: 1;
            height: 50mm;
            border: 1.5px solid #073c80;
            border-radius: 4mm;
            padding: 4mm 12mm;
        }

        .payment-title {
            font-size: 22px;
            font-weight: 900;
            margin-bottom: 2mm;
        }

        .payment-row {
            font-size: 16px;
            line-height: 1.55;
            white-space: nowrap;
        }

            .payment-row strong {
                font-weight: 900;
            }

        /* ---------------- THANK YOU ---------------- */
        .thank-you {
            position: absolute;
            left: 10mm;
            top: 245mm;
            font-family: Arial, sans-serif;
            font-size: 48px;
            font-weight: 800;
            letter-spacing: -2px;
        }

            .thank-you .red {
                color: #ff3035;
            }

            .thank-you .blue {
                color: #073c80;
            }

        /* ---------------- FOOTER CIRCUIT ---------------- */
        .footer-image {
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
          /*  height: 22mm;*/
            object-fit: cover;
            object-position: top center;
        }

        /* Browser screen preview */
        @media screen {
            .page {
                margin: 20px auto;
                box-shadow: 0 0 12px rgba(0,0,0,.2);
            }
        }

        @media print {
            html, body {
                background: #fff;
            }

            .page {
                margin: 0;
                box-shadow: none;
                page-break-after: avoid;
            }
        }
    </style>

</head>

<body>
    <div class="page">
        <div class="content">

            <header class="header">
                <img class="logo"
                    src="assets/LOGO.png"
                    alt="Digital Bull Logo">

                <div class="invoice-date" runat="server" id="invoice_date">
                    Invoice Date : 
                </div>

                <div class="company">
                    <div class="company-name">
                        <span class="red">Digital</span>
                        <span class="blue">Bull</span>
                    </div>

                    <div class="company-info">
                        Mobile Plaza, 3rd Floor Golghar, Gorakhpur U.P<br>
                        Call or whatsApp&nbsp;&nbsp; +91 - 9044815507<br>
                        Website: www.digitalbull.in<br>
                        E-Mail: info@digitalbull.in
                    </div>
                </div>
            </header>

            <div class="separator">

                <img src="assets/h2.png"
                    alt="Header Design" />

            </div>

            <section class="bill-to" style="margin-bottom:25px;">
                <div class="bill-title">Bill To</div>
                <div class="client-name" runat="server" id="client_name">Kamla Devi Health Care Pvt Ltd</div>
                <div class="client-address" runat="server" id="client_address">
                    0-B, Gautam Buddha Marg, near Old Rto Complex, Ganeshganj, Aminabad, Lucknow, U P 226018
                </div>
            </section>

            <table class="invoice-table">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Month</th>
                        <th>Amount (₹)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td runat="server" id="service">Digital Marketing &amp; Branding</td>
                        <td runat="server" id="date">01 Jul 26</td>
                        <td runat="server" id="amount">₹5,000</td>
                    </tr>
                    <tr class="summary">
                        <td>Other works</td>
                        <td>Subtotal</td>
                        <td runat="server" id="subtotal">₹5,000</td>
                    </tr>
                    <tr class="payment">
                        <td></td>
                        <td>Current Payment</td>
                        <td runat="server" id="total">₹5,000</td>
                    </tr>
                </tbody>
            </table>

            <section class="payment-section">
                <div class="qr-box">
                    <img 
                        src="assets/cqr.png"
                        alt="UPI QR Code">
                </div>

                <div class="payment-info">
                    <div class="payment-title">Payment Info:</div>
                    <div class="payment-row">Name: <strong>DIGITAL BULL</strong></div>
                    <div class="payment-row">Account No: <strong>19200210004098</strong></div>
                    <div class="payment-row">IFSE Code: <strong>UCBA0001920</strong></div>
                    <div class="payment-row">Bank Name: <strong>UCO BANK</strong></div>
                </div>
            </section>

            <div class="thank-you">
                <span class="red">Thank</span>
                <span class="blue">You!!</span>
            </div>

            <img class="footer-image"
                src="assets/f2.png"
                alt="Digital circuit footer">

        </div>
    </div>
</body>
</html>