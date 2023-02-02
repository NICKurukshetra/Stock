<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebQuery.aspx.cs" Inherits="WebQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Check" />
        <asp:Button ID="Button2" runat="server"  Text="Submit" 
            onclick="Button2_Click" />
        <asp:TextBox ID="TextBox1" runat="server" Rows="4" TextMode="MultiLine" 
            Width="100%"></asp:TextBox>
    
    </div>
    <asp:GridView ID="GridView1" runat="server" Width="100%">
    </asp:GridView>
    </form>
</body>
</html>
