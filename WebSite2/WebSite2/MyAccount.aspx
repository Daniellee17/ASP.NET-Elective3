<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        @font-face {
            src: url(fonts/MarckScript-Regular.ttf);
            font-family: marc;
        }

        @font-face {
            src: url(fonts/BungeeInline-Regular.ttf);
            font-family: bunge;
        }

        body {
            margin: 0;
            padding: 0;
            background: url(images/bg3.png);
            background-size: cover;
        }

        .login-box {
            width: 540px;
            height: 550px;
            background: rgba(0, 0, 0, 0.4);
            color: #fff;
            top: 50%;
            left: 50%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            font-family: sans-serif;
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            position: absolute;
            top: -50px;
            left: calc(50% - 50px);
        }

        h1 {
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 19px;
        }

        .login-box p {
            margin: 0;
            padding: 0;
            font-size: 15px;
            color: #31BDC9;
        }

        .login-box input[type="text"] {
            margin-bottom: 16px;
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
            position: center;
        }

        .login-box input[type="password"] {
            width: 40%;
            margin-bottom: 16px;
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
            position: center;
        }

        .login-box input[type="submit"] {
            border: none;
            outline: none;
            height: 40px;
            background: #31BDC9;
            color: #fff;
            font-size: 16px;
            border-radius: 16px;
        }

            .login-box input[type="submit"]:hover {
                cursor: pointer;
                background: #39dc79;
                color: #000;
            }

        .login-box a {
            text-decoration: none;
            font-size: 14px;
            color: #fff;
        }

            .login-box a:hover {
                color: #39dc79;
            }


        .subtitle {
            top: 82%;
            left: 50%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            font-family: sans-serif;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            font-family: sans-serif;
            font-size: 16px;
            color: red;
        }

        nav {
            top: 0;
            left: 0;
            width: 100%;
            height: 63px;
            background: rgba(0,0,0,0.3);
            padding: 0 100px;
            box-sizing: border-box;
        }

            nav .brand h2 {
                padding: 0;
                margin: 0;
                color: #fff;
                float: left;
                height: 100%;
                line-height: 65px;
                font-family: marc;
                font-size: 20px;
            }

            nav ul {
                float: right;
                display: flex;
                margin: 0;
                padding: 0;
            }

                nav ul li {
                    list-style: none;
                }

                    nav ul li a {
                        position: relative;
                        display: block;
                        height: 32px;
                        line-height: 0px;
                        padding: 0 16px;
                        box-sizing: border-box;
                        color: #fff;
                        text-decoration: none;
                        text-transform: uppercase;
                        transition: .3s;
                        font-family: sans-serif;
                        font-size: 14px;
                    }

        ul li a:hover {
            color: #262626;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <nav>

            <div class="brand">
                <h2>
                    <asp:Label ID="LblName" runat="server" Text=" " ForeColor="White" Font-Bold="false"></asp:Label>
                </h2>
            </div>

            <ul>
                <li><a>
                    <asp:LinkButton ID="LB_home" runat="server" OnClick="LB_home_Click">HOME</asp:LinkButton>
                </a></li>
                <li><a>
                    <asp:LinkButton ID="LB_my" runat="server" OnClick="LB_my_Click" Style="color: #31BDC9">MY ACCOUNT</asp:LinkButton>
                </a></li>
                <li><a>
                    <asp:LinkButton ID="LB_reg" runat="server" OnClick="LB_reg_Click">REGISTER</asp:LinkButton>
                </a></li>
                <li><a>
                    <asp:LinkButton ID="LB_login" runat="server" OnClick="LB_login_Click" Text="Login"></asp:LinkButton>
                </a></li>
            </ul>

        </nav>




        <div class="subtitle">

            <asp:Label ID="LBL" runat="server" Text=" "></asp:Label>

        </div>




        <asp:HiddenField ID="hfUserID" runat="server" />

        <div class="login-box">

            <h1>ACCOUNT OVERVIEW</h1>

            <p>Full Name</p>
            <asp:Label ID="LBL_FullName" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />




            <p>Contact Number</p>
            <asp:Label ID="LBL_Contact" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />


            <p>Username</p>
            <asp:Label ID="LBL_Username" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />



            <p>Email Address</p>
            <asp:Label ID="LBL_Email" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />



            <p>Password</p>
            <asp:Label ID="LBL_Password" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />

            <p>Type</p>


            <asp:Label ID="LBL_Type" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />


            <br />
            <br />
           

            <asp:Button ID="BTNreset" runat="server" Text="Reset Password" OnClientClick=" JSalert();" OnClick="BTNreset_Click" />



            <script type="text/javascript">
                function JSalert() {
                    alert("You've reset your password!" + "\r\n" + "\r\n" + "Please log out to enter your new password");
                }
            </script>

            <asp:Button ID="BTNchange" runat="server" Text="Change Password" OnClick="BTNchange_Click" />
            <asp:Button ID="BTNAccounts" runat="server" Text="Accounts" OnClick="BTNAccounts_Click" Style="background-color: red" Font-Bold="false" ForeColor="WHITE" Visible="false" />
            <asp:Button ID="BTNGrid" runat="server" Text="MasterDB" Style="background-color: red" Font-Bold="false" ForeColor="WHITE" OnClick="BTNGrid_Click" Visible="false" />
            <asp:TextBox ID="Tb1" runat="server" Text="" Visible="false" />
        </div>

    </form>
</body>


</html>
