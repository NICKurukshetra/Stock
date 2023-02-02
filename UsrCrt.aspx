<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UsrCrt.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Mobile" DataSourceID="SqlDataSource1" Height="50px" Width="125px" AllowPaging="True">
                <Fields>
                    <asp:BoundField DataField="Srno" HeaderText="Srno" InsertVisible="False" ReadOnly="True" SortExpression="Srno" />
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" ReadOnly="True" SortExpression="Mobile" />
                    <asp:BoundField DataField="Pass" HeaderText="Pass" SortExpression="Pass" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                    <asp:BoundField DataField="branchid" HeaderText="branchid" SortExpression="branchid" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Mobile" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Srno" HeaderText="Srno" InsertVisible="False" ReadOnly="True" SortExpression="Srno" />
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" ReadOnly="True" SortExpression="Mobile" />
                    <asp:BoundField DataField="Pass" HeaderText="Pass" SortExpression="Pass" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                    <asp:BoundField DataField="branchid" HeaderText="branchid" SortExpression="branchid" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnstock %>" InsertCommand="INSERT INTO Users(Mobile, Pass, Type, Active, branchid) VALUES (@Mobile, @Pass, @Type, @Active, @branchid)" SelectCommand="SELECT Srno, Mobile, Pass, Type, Active, branchid FROM Users">
                <InsertParameters>
                    <asp:Parameter Name="Mobile" />
                    <asp:Parameter Name="Pass" />
                    <asp:Parameter Name="Type" />
                    <asp:Parameter Name="Active" />
                    <asp:Parameter Name="branchid" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
