
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Staff_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>DigitalBull | Your Digital Partner</title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <style>
        .password-wrapper {
            position: relative;
        }

        .password-input {
            padding-right: 45px;
        }

        .password-toggle {
            position: absolute;
            top: 50%;
            right: 12px;
            transform: translateY(-50%);
            border: 0;
            background: transparent;
            color: #777;
            font-size: 18px;
            cursor: pointer;
            padding: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .password-toggle:hover {
                color: #0d6efd;
            }

            .password-toggle:focus {
                outline: none;
                box-shadow: none;
            }
    </style>

    <script>
        function togglePassword() {

            var password = document.getElementById('<%= loginPassword.ClientID %>');
            var icon = document.getElementById('passwordIcon');

            if (password.type === "password") {

                password.type = "text";

                icon.classList.remove("bi-eye");
                icon.classList.add("bi-eye-slash");

            } else {

                password.type = "password";

                icon.classList.remove("bi-eye-slash");
                icon.classList.add("bi-eye");
            }
        }
    </script>

</head>
<body class="auth-body">

    <div>
       
        <main class="auth-page">

            <section class="auth-card">
                <a class="auth-brand" href="#"><span class="brand-icon">
                    <img src="assets/digital-bull-logo.webp" alt="DigitalBull">
                </span><span><strong>Staff Login</strong><small>Sign in to your workspace.</small></span></a>

                <form runat="server" class="needs-validation" novalidate>

                    <div class="mb-3">
                        <label class="form-label" for="loginEmail">Email address</label>
                        <asp:TextBox runat="server" TextMode="Email" class="form-control" ID="loginEmail" required></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <div class="d-flex justify-content-between">
                            <label class="form-label" for="loginPassword">Password</label>
                        </div>

                        <div class="password-wrapper">
                            <asp:TextBox
                                runat="server"
                                TextMode="Password"
                                class="form-control password-input"
                                ID="loginPassword"
                                required>
                            </asp:TextBox>

                            <button
                                type="button"
                                class="password-toggle"
                                onclick="togglePassword()"
                                aria-label="Show password">
                                <i class="bi bi-eye" id="passwordIcon"></i>
                            </button>
                        </div>
                    </div>

                    <button id="btnlogin" runat="server" onserverclick="btnlogin_ServerClick" class="btn btn-primary w-100" type="submit"><i class="bi bi-box-arrow-in-right" aria-hidden="true"></i>Sign In</button>
                </form>

            </section>
        </main>
    </div>


    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>
