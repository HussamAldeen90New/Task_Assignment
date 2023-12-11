<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TaskAssignment.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblUserDetails" runat="server" Text="" style="font-size: xx-large; font-weight: 700"></asp:Label>
            <br />
            <h3>
            <asp:Button ID="btnLogout" runat="server" Text="LogOut" OnClick="btnLogout_Click" Height="34px" style="font-size: x-large; font-weight: 700; text-align: center; margin-top: 2px" Width="115px" />
            </h3>
        </div>
    </form>
</body>
</html>
