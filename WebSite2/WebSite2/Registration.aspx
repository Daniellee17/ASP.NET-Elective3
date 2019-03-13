<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

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

        .registerBox {
            width: 600px;
            height: 690px;
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
            width: 80px;
            height: 80px;
            border-radius: 50%;
            position: absolute;
            top: -40px;
            left: calc(50% - 50px);
        }


        h1 {
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 19px;
        }


        .registerBox p {
            margin: 0;
            padding: 0;
            font-size: 14px;
        }

        .registerBox input[type="text"] {
            margin-bottom: 15px;
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 13px;
            position: center;
        }

        .registerBox input[type="password"] {
            width: 40%;
            margin-bottom: 20px;
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 13px;
            position: center;
        }

        .registerBox input[type="submit"] {
            border: none;
            outline: none;
            height: 40px;
            background: #31BDC9;
            color: #fff;
            font-size: 18px;
            border-radius: 20px;
        }

            .registerBox input[type="submit"]:hover {
                cursor: pointer;
                background: #39dc79;
                color: #000;
            }

        .registerBox a {
            text-decoration: none;
            font-size: 13px;
            color: #fff;
        }

            .registerBox a:hover {
                color: #39dc79;
            }


        .generalLabel {
            top: 88.5%;
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

        .emailCheck {
            top: 52.8%;
            left: 70.3%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            font-family: sans-serif;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            font-family: sans-serif;
            font-size: 14px;
            color: aliceblue;
        }

        .passwordCheck {
            top: 61%;
            left: 74.9%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            font-family: sans-serif;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            font-family: sans-serif;
            font-size: 14px;
            color: aliceblue;
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
                    <asp:LinkButton ID="LB_my" runat="server" OnClick="LB_my_Click">MY ACCOUNT</asp:LinkButton>
                </a></li>
                <li><a>
                    <asp:LinkButton ID="LB_reg" runat="server" OnClick="LB_reg_Click" Text="REGISTER" Style="color: #31BDC9"> </asp:LinkButton>
                </a></li>
                <li><a>
                    <asp:LinkButton ID="LB_login" runat="server" OnClick="LB_login_Click" Text="Login"></asp:LinkButton>
                </a></li>
            </ul>
        </nav>




        <div class="generalLabel">

            <asp:Label ID="LBL" runat="server" Text=" "></asp:Label>

        </div>

        <div class="emailCheck">



            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Address!"
                ControlToValidate="TBemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>


        </div>
        <div class="passwordCheck">




            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Min. of 8, must be alphanumeric with special chars."
                ControlToValidate="TBpass" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$"></asp:RegularExpressionValidator>




        </div>





        <asp:HiddenField ID="hfUserID" runat="server" />

        <div class="registerBox">
            <img src="images/login2.jpg" class="avatar" />
            <h1>REGISTER</h1>

            <p>Full Name</p>
            <asp:TextBox ID="TBfn" runat="server" placeholder="First Name" Width="49%"></asp:TextBox>
            <asp:TextBox ID="TBln" runat="server" placeholder="Last Name" Width="49%"></asp:TextBox>
            <p>Contact Number</p>
            <asp:TextBox ID="TBcontact" runat="server" Width="100%"></asp:TextBox><br />
            <p>Username</p>
            <asp:TextBox ID="TBun" runat="server" placeholder="Must be unused" Width="100%"></asp:TextBox><br />
            <p>Email Address</p>
            <asp:TextBox ID="TBemail" runat="server" placeholder="Must be a valid email address" Width="100%"></asp:TextBox>
            <br />
            <p>Password</p>
            <asp:TextBox ID="TBpass" runat="server" TextMode="Password" placeholder="Must be min. of 8, alphanumeric with special character/s)" Width="100%"></asp:TextBox><br />
            <asp:TextBox ID="TBcpass" runat="server" TextMode="Password" placeholder="Confirm Password" Width="100%"></asp:TextBox><br />
            <asp:RadioButtonList ID="RadioButtonList1" RepeatDirection="Horizontal" Style="color: #31BDC9; font-family: sans-serif; font-size: 14px" runat="server" RepeatLayout="Flow">
                <asp:ListItem>Administrator</asp:ListItem>
                <asp:ListItem>Standard</asp:ListItem>
            </asp:RadioButtonList>



            <div style="font-size: 14px">
                <asp:CheckBox ID="CheckBox1" runat="server" />
                I have read and agree to the <a class="image-link" style="color: #31BDC9; font-family: sans-serif; font-size: 14px" href="images/tac.jpg">terms of service</a>

            </div>
            <br />

            <asp:Button ID="BTNsubmit" runat="server" OnClick="BTNsubmit_Click" Text="Submit" />

        </div>

    </form>
</body>


</html>
