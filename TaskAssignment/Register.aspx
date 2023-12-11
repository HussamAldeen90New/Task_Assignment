<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TaskAssignment.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfUseID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label Text="Username" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtUsername" runat="server" />
                        <asp:Label Text="*" runat="server" ForeColor="Red" />
                    </td>

                </tr>

                <tr>
                    <td>
                        <asp:Label Text="Email" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtEmail" runat="server" />
                        <asp:Label Text="*" runat="server" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label Text="Password" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                        <asp:Label Text="*" runat="server" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Confirm Password" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
                        <asp:Label Text="*" runat="server" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td colspan="2">
                        <asp:Button Text="Submit" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td colspan="2">
                        <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" />
                    </td>
                </tr>

                <tr>
                    <td> </td>
                    <td colspan="2">
                        <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" />
                    </td>
                </tr>

                <tr>
                    <td> </td>
                    <td colspan="2">
                        <asp:Label Text="Already a member?" ID="AlreadyHaveAccount" runat="server" ForeColor="Blue" />
                    
                        <asp:Button Text="Login" ID="btnLogin2" runat="server" OnClick="btnLogin2_Click" BorderStyle="Dashed"/>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
