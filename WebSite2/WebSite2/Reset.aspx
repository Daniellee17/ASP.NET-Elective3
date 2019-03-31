<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reset.aspx.cs" Inherits="Reset" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background: url(images/bg3.png);
            background-size: cover;
        }

        
        .buttonDane input[type="submit"] {
            margin: 0;
            padding: 0;
            border: none;
            outline: none;
            height: 33px;
            width: 68px;
            left: 0%;
            position: absolute;
            background: rgba(0,0,0,0.3);
            color: #fff;
            font-size: 14px;
            margin-left: 5px;
            margin-top: 5px;
        }

            .buttonDane input[type="submit"]:hover {
                cursor: pointer;
                color: #262626;
                transition: .3s;
            }

        .resetBox {
            width: 550px;
            height: 570px;
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

        h1 {
            margin: 0;
            padding: 0 0 14px;
            text-align: center;
            font-size: 19px;
        }


        .resetBox p {
            margin: 0;
            padding: 0;
            font-size: 15px;
            color: #31BDC9;
        }

        .resetBox input[type="text"] {
            margin-bottom: 14px;
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 14px;
            position: center;
        }

        .resetBox input[type="password"] {
            width: 40%;
            margin-bottom: 14px;
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 14px;
            position: center;
        }

        .resetBox input[type="submit"] {
            border: none;
            outline: none;
            height: 40px;
            background: #31BDC9;
            color: #fff;
            font-size: 18px;
            border-radius: 14px;
        }

            .resetBox input[type="submit"]:hover {
                cursor: pointer;
                background: #39dc79;
                color: #000;
            }

        .resetBox a {
            text-decoration: none;
            font-size: 14px;
            color: #fff;
        }

            .resetBox a:hover {
                color: #39dc79;
            }


        .generalLabel {
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

        .passwordLabel {
            top: 59%;
            left: 73.5%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            font-family: sans-serif;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            font-family: sans-serif;
            font-size: 15px;
            color: aliceblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="generalLabel">

            <asp:Label ID="LBL" runat="server" Text=" "></asp:Label>

        </div>


        <div class="passwordLabel">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Min. of 8, must be alphanumeric with special chars." ControlToValidate="TBpass" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*$"></asp:RegularExpressionValidator>
        </div>


        <asp:HiddenField ID="hfUserID" runat="server" />

         <div class="buttonDane">

            <asp:Button ID="BTN_Back" runat="server" Text="BACK" OnClick="BTN_Back_Click" />

        </div>


        <div class="resetBox">
            <h1>UPDATE PASSWORD</h1>

            <p>Full Name</p>
            <asp:Label ID="LBL_FullName" runat="server" Text="Not logged in" Font-Size="14px"></asp:Label><br />
            <br />

            <p>Contact Number</p>
            <asp:Label ID="LBL_Contact" runat="server" Text="Not logged in" Font-Size="14px"></asp:Label><br />
            <br />


            <p>Username</p>
            <asp:Label ID="LBL_Username" runat="server" Text="Not logged in" Font-Size="14px"></asp:Label><br />
            <br />



            <p>Email Address</p>
            <asp:Label ID="LBL_Email" runat="server" Text="Not logged in" Font-Size="14px"></asp:Label><br />
            <br />



            <p>Password</p>
            <asp:TextBox ID="TBpass" runat="server" TextMode="Password" placeholder="Must be min. of 8, alphanumeric with special character/s)" Width="100%"></asp:TextBox>
            <asp:Label ID="LBL_Password" runat="server" Text="Not logged in" Font-Size="14px" Visible="false"></asp:Label><br />
            <asp:TextBox ID="TBcpass" runat="server" TextMode="Password" placeholder="Confirm password)" Width="100%"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Not logged in" Font-Size="14px" Visible="false"></asp:Label><br />


            <p>Type</p>


            <asp:Label ID="LBL_Type" runat="server" Text="Not logged in" Font-Size="14px"></asp:Label><br />


            <br />


            <asp:Button ID="BTNenter" runat="server" Text="Submit" OnClick="BTNenter_Click" />
            <asp:TextBox ID="Tb1" runat="server" Text="" Visible="false" />
        </div>

    </form>
</body>


</html>
