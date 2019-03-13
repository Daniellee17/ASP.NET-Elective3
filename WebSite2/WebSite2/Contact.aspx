<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

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
            background: url(images/bg3.png);
            background-size: cover;
        }


        * {
            margin: 0;
            padding: 0;
        }

        .wrapper {
            margin: 0 auto;
            width: 70%;
        }

        .contactBox {
            width: 510px;
            height: 360px;
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

        .contactBox p {
            margin: 0;
            padding: 0;
            font-size: 12px;
             color: #31BDC9;
        }

        .contactBox input {
            width: 100%;
            margin-bottom: 20px;
        }

            .contactBox input[type="text"], input[type="password"] {
                border: none;
                border-bottom: 1px solid #fff;
                background: transparent;
                outline: none;
                height: 40px;
                color: #fff;
                font-size: 13px;
            }

            .contactBox input[type="submit"] {
                border: none;
                outline: none;
                height: 40px;
                background: #31BDC9;
                color: #fff;
                font-size: 18px;
                border-radius: 20px;
            }

                .contactBox input[type="submit"]:hover {
                    cursor: pointer;
                    background: #39dc79;
                    color: #000;
                }

        .contactBox a {
            text-decoration: none;
            font-size: 12px;
            color: #fff;
        }

            .contactBox a:hover {
                color: #39dc79;
            }


        
        .generalLabel {
              top: 71%;
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
            font-size: 18px;
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
                    <asp:LinkButton ID="LB_my" runat="server" OnClick="LB_my_Click">MY ACCOUNT</asp:LinkButton>
                </a></li>
                <li><a>
                    <asp:LinkButton ID="LB_reg" runat="server" OnClick="LB_reg_Click" Text="REGISTER"> </asp:LinkButton>
                </a></li>

                  <li><a>
                    <asp:LinkButton ID="LB_contact" runat="server" OnClick="LB_contact_Click" Text="CONTACT"  Style="color: #31BDC9"> </asp:LinkButton>
                </a></li>


                <li><a>
                    <asp:LinkButton ID="LB_login" runat="server" OnClick="LB_login_Click" Text="Login"></asp:LinkButton>
                </a></li>
            </ul>
        </nav>



         <div class="contactBox">
            <img src="images/phone.png" class="avatar" />
            <h1>CONTACT US</h1>

            
            <p>Company</p>
            <asp:Label ID="LBL_Name" runat="server" Text="A.G.E" Font-Size="16px"></asp:Label><br />
            <br />

            <p>Address</p>
            <asp:Label ID="LBL_Address" runat="server" Text="East Tower, One Archers Place, Taft Avenue, Malate Manile" Font-Size="16px"></asp:Label><br />
            <br />

            <p>Contact Number</p>
            <asp:Label ID="LBL_Contact" runat="server" Text="+639985333809" Font-Size="16px"></asp:Label><br />
            <br />

            <p>Email</p>
            <asp:Label ID="LBL_Email" runat="server" Text="danielleespiritu17@gmail.com" Font-Size="16px"></asp:Label><br />
            <br />









        </div>
       
        <div class="generalLabel">

            <asp:Label ID="LBLerror" runat="server" Text=""></asp:Label>



        </div>
    </form>
</body>
</html>
