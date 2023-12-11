<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TaskAssignment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfUseID" runat="server" />
            <div class="auto-style2">
                <strong><span class="auto-style1">Login</span></strong></div>
            <table style="margin:auto;border:5px solid white">
                <tr>
                    <td>
                        <asp:Label Text="Username" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtUsername" runat="server" />
                    </td>

                </tr>

                <tr>
                    <td>
                        <asp:Label Text="Password" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                    </td>
                </tr>

                <tr>
                    <td> </td>
                    <td colspan="2">
                        <asp:Button Text="Login" ID="btnLogin" runat="server" OnClick="btnLogin_Click" />
                    </td>
                </tr>

                <tr>
                    <td> </td>
                    <td colspan="2">
                        <asp:Button Text="Sign Up" ID="btnSignup" runat="server" OnClick="btnSignup_Click" />
                    </td>
                </tr>

                <tr>
                    <td> </td>
                    <td colspan="2">
                        <asp:Label  ID="lblErrorMessage" runat="server" Text="The User Name or Password is Incorrect" ForeColor="Red" />
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
