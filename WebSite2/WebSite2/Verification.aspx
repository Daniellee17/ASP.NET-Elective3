<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Verification.aspx.cs" Inherits="Verification" %>

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

        .verificationBox {
            width: 300px;
            height: 390px;
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


        .verificationBox p {
            margin: 0;
            padding: 0;
            font-size: 15px;
            color: #31BDC9;
        }

        .verificationBox input[type="text"] {
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

        .verificationBox input[type="password"] {
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

        .verificationBox input[type="submit"] {
            border: none;
            outline: none;
            height: 40px;
            background: #31BDC9;
            color: #fff;
            font-size: 18px;
            border-radius: 14px;
            margin-top: 5px;
        }

            .verificationBox input[type="submit"]:hover {
                cursor: pointer;
                background: #39dc79;
                color: #000;
            }

        .verificationBox a {
            text-decoration: none;
            font-size: 14px;
            color: #fff;
        }

            .verificationBox a:hover {
                color: #39dc79;
            }


        .generalLabel {
            top: 68%;
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


        

        <asp:HiddenField ID="hfUserID" runat="server" />

        <div class="verificationBox">
            <h1>VERIFICATION</h1>

          

            <p>Email Address</p>
            <asp:Label ID="LBL_Email" runat="server" Text="" Font-Size="14px"></asp:Label><br />
            <br />
                   <p>Contact Number</p>
            <asp:Label ID="LBL_Contact" runat="server" Text="Not logged in" Font-Size="14px"></asp:Label><br />
            <br />



            

            <asp:Button ID="BTNemail" runat="server" Text="Send to Email" OnClick="BTNemail_Click" Width ="100%" />
            
            
            <asp:Button ID="BTNsms" runat="server" Text="Send to SMS" OnClick="BTNsms_Click" Width ="100%" />
           
            
            <asp:TextBox ID="TBverify" runat="server" Text="" visible ="false" Width ="100%" placeholder="Verification code"/>
              <asp:Button ID="BTNreset" runat="server" Text="Reset" OnClick="BTNreset_Click" Visible ="false" Width ="49%"/>
            <asp:Button ID="BTNsubmit" runat="server" Text="Submit" OnClick="BTNsubmit_Click" Visible ="false" Width ="49%"/>
     
            <asp:TextBox ID="Tb1" runat="server" Text="" Visible="false" />
            
              <asp:Button ID="BTNcancel" runat="server" Text="Cancel" OnClick="BTNcancel_Click" Visible ="true" Width="100%"/>
        </div>

    </form>
</body>


</html>
