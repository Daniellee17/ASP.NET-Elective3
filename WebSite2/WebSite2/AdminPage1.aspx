<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPage1.aspx.cs" Inherits="AdminPage1" %>

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

        .approvedBox {
            width: 450px;
            height: 590px;
            background: rgba(0, 0, 0, 0.4);
            color: #fff;
            top: 50%;
            left: 18%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            font-family: sans-serif;
        }



        h1 {
            margin: 0;
            padding: 0 0 16px;
            text-align: center;
            font-size: 19px;
        }



        .approvedBox p {
            margin: 0;
            padding: 0;
            font-size: 15px;
            color: #31BDC9;
        }

        .approvedBox input[type="text"] {
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

        .approvedBox input[type="password"] {
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

        .approvedBox input[type="submit"] {
            border: none;
            outline: none;
            height: 40px;
            background: rgba(0,0,0,0.3);
            color: #fff;
            font-size: 18px;
            border-radius: 0px;
        }

            .approvedBox input[type="submit"]:hover {
                cursor: pointer;
                background: #39dc79;
                color: #000;
            }

        .approvedBox a {
            text-decoration: none;
            font-size: 14px;
            color: #fff;
        }

            .approvedBox a:hover {
                color: #39dc79;
            }


        .pendingBox {
            width: 450px;
            height: 590px;
            background: rgba(0, 0, 0, 0.4);
            color: #fff;
            top: 50%;
            left: 46%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            font-family: sans-serif;
        }


            .pendingBox p {
                margin: 0;
                padding: 0;
                font-size: 15px;
                color: #31BDC9;
            }

            .pendingBox input[type="text"] {
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

            .pendingBox input[type="password"] {
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

            .pendingBox input[type="submit"] {
                border: none;
                outline: none;
                height: 40px;
                background: rgba(0,0,0,0.3);
                color: #fff;
                font-size: 18px;
                border-radius: 0px;
            }


                .pendingBox input[type="submit"]:hover {
                    cursor: pointer;
                    background: #39dc79;
                    color: #000;
                }

            .pendingBox a {
                text-decoration: none;
                font-size: 14px;
                color: #fff;
            }

                .pendingBox a:hover {
                    color: #39dc79;
                }



        .viewBox {
            width: 610px;
            height: 590px;
            background: rgba(0, 0, 0, 0.4);
            color: #fff;
            top: 50%;
            left: 78%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            font-family: sans-serif;
        }


            .viewBox p {
                margin: 0;
                padding: 0;
                font-size: 15px;
                color: #31BDC9;
            }

            .viewBox input[type="text"] {
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

            .viewBox input[type="password"] {
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

            .viewBox input[type="submit"] {
                border: none;
                outline: none;
                height: 40px;
                background: rgba(0,0,0,0.3);
                color: #fff;
                font-size: 18px;
                border-radius: 0px;
            }

                .viewBox input[type="submit"]:hover {
                    cursor: pointer;
                    background: #39dc79;
                    color: #000;
                }

            .viewBox a {
                text-decoration: none;
                font-size: 14px;
                color: #fff;
            }

                .viewBox a:hover {
                    color: #39dc79;
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
                        padding: 0 13px;
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
                    <asp:Label ID="LblName" runat="server" Text=" " ForeColor="WHITE" Font-Bold="false"></asp:Label>
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
                    <asp:LinkButton ID="LB_reg" runat="server" OnClick="LB_reg_Click">REGISTER</asp:LinkButton>
                </a></li>

                <li><a>
                    <asp:LinkButton ID="LB_login" runat="server" OnClick="LB_login_Click" Text="Login"></asp:LinkButton>

                </a></li>
            </ul>

        </nav>
        <div class="buttonDane">

            <asp:Button ID="BTN_Back" runat="server" Text="BACK" OnClick="BTN_Back_Click" />

        </div>


        <div class="approvedBox">

            <h1>APPROVED</h1>


            <asp:GridView ID="gvUsers" runat="server" CellPadding="5" ForeColor="Transparent" Font-Bold="false" GridLines="None" AutoGenerateColumns="false"
                ShowFooter="true"
                DataKeyNames="UserID"
                ShowHeaderWhenEmpty="true"
                OnRowCommand="gvUsers_RowCommand"
                OnRowUpdating="gvUsers_RowUpdating"
                OnRowDeleting="gvUsers_RowDeleting"
                Style="font-family: sans-serif; text-align: center; margin: auto; background: transparent; outline: none; height: 40px; font-size: 16px; position: center;">



                <AlternatingRowStyle BackColor="Transparent" ForeColor="White" />
                <EditRowStyle BackColor="Transparent" ForeColor="White" />

                <HeaderStyle BackColor="Transparent" ForeColor="#31BDC9" />
                <PagerStyle BackColor="Transparent" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="Transparent" ForeColor="white" Font-Size="15px" />
                <SelectedRowStyle BackColor="Transparent" Font-Bold="True" ForeColor="white" />

                <Columns>



                    <asp:TemplateField HeaderText="USERNAME" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="15px" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <asp:LinkButton Text='<%# Eval("Username") %>' runat="server" CommandName="View0"></asp:LinkButton>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" Text='<%# Eval("Username") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TYPE" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="15px" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Type") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtType" Text='<%# Eval("Type") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TOOLS" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="15px" HeaderStyle-Width="100px">

                        <ItemTemplate>

                            <asp:ImageButton ImageUrl="~/images/pend.png" runat="server" CommandName="Update" ToolTip="Edit" Width="16px" Height="16px" />
                            <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="16px" Height="16px" />

                        </ItemTemplate>

                    </asp:TemplateField>


                </Columns>
            </asp:GridView>

            <asp:TextBox ID="Tb1" runat="server" Text="" Visible="false" />


        </div>

        <div class="pendingBox">

            <h1>PENDING</h1>

            <asp:GridView ID="gvUsers1" runat="server" CellPadding="5" ForeColor="Transparent" GridLines="None" AutoGenerateColumns="false"
                ShowFooter="true"
                DataKeyNames="UserID"
                ShowHeaderWhenEmpty="true"
                OnRowCommand="gvUsers1_RowCommand"
                OnRowUpdating="gvUsers1_RowUpdating"
                OnRowDeleting="gvUsers1_RowDeleting"
                OnSelectedIndexChanged="gvUsers1_SelectedIndexChanged"
                Style="font-family: sans-serif; text-align: center; margin: auto; background: transparent; outline: none; height: 40px; font-size: 16px; position: center">



                <AlternatingRowStyle BackColor="Transparent" ForeColor="White" />
                <EditRowStyle BackColor="Transparent" ForeColor="White" />

                <HeaderStyle BackColor="Transparent" ForeColor="#31BDC9" />
                <PagerStyle BackColor="Transparent" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="Transparent" ForeColor="white" Font-Size="15px" />
                <SelectedRowStyle BackColor="Transparent" Font-Bold="True" ForeColor="white" />

                <Columns>

                    <asp:TemplateField HeaderText="USERNAME" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="15px" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <asp:LinkButton Text='<%# Eval("Username") %>' runat="server" CommandName="View1"></asp:LinkButton>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" Text='<%# Eval("Username") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TYPE" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="15px" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Type") %>' runat="server" />

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtType" Text='<%# Eval("Type") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TOOLS" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="15px" HeaderStyle-Width="100px">

                        <ItemTemplate>

                            <asp:ImageButton ImageUrl="~/images/approve.png" runat="server" CommandName="Update" ToolTip="Edit" Width="16px" Height="16px" />



                            <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="16px" Height="16px" />
                        </ItemTemplate>
                    </asp:TemplateField>



                </Columns>
            </asp:GridView>



        </div>


        <div class="viewBox">

            <h1>VIEW</h1>

            <p>Full Name</p>
            <asp:Label ID="LBL_FullName1" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />

            <p>Contact Number</p>
            <asp:Label ID="LBL_Contact1" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />


            <p>Username</p>
            <asp:Label ID="LBL_Username1" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />



            <p>Email Address</p>
            <asp:Label ID="LBL_Email1" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />
            <p>Password</p>
            <asp:Label ID="LBL_Password1" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />
            <p>Type</p>


            <asp:Label ID="LBL_Type1" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />
            <br />

            <p>Verified</p>


            <asp:Label ID="LBL_Verified1" runat="server" Text="Not logged in" Font-Size="16px"></asp:Label><br />



        </div>


    </form>
</body>


</html>
