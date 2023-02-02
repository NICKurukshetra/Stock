<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ItemWiseStock.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-bordered" BackColor="#CCCCCC" ForeColor="White" RepeatColumns="10" RepeatDirection="Horizontal">
        <ItemTemplate>
          <a href='ItemWiseStock.aspx?ID=<%# Eval("category")%>'> <%# Eval("category") %><br />
           <%# Eval("Tot") %>
          </a>
           

        </ItemTemplate>
    </asp:DataList>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-bordered" DataKeyNames="serialno">
        <Columns>
            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
            <asp:BoundField DataField="modelno" HeaderText="modelno" SortExpression="modelno" />
            <asp:BoundField DataField="serialno" HeaderText="serialno" SortExpression="serialno" ReadOnly="True" />
            <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
            <asp:BoundField DataField="dealer" HeaderText="dealer" SortExpression="dealer" />
            <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="tehsil" HeaderText="tehsil" SortExpression="tehsil" />
            <asp:BoundField DataField="branchname" HeaderText="branchname" SortExpression="branchname" />
            <asp:BoundField DataField="Office" HeaderText="Office" SortExpression="Office" />
        </Columns>
        <HeaderStyle BackColor="#009999" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cnstock %>" SelectCommand="SELECT stock.category, stock.modelno, stock.serialno, stock.make, stock.dealer, stock.remarks, stock.Status, stock.tehsil, branchmaster.branchname, OfficeMas.Office FROM stock INNER JOIN branchmaster ON stock.branchid = branchmaster.Srno INNER JOIN OfficeMas ON branchmaster.id = OfficeMas.Srno WHERE (stock.category = @category)">
        <SelectParameters>
            <asp:QueryStringParameter Name="category" QueryStringField="ID" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnstock %>" SelectCommand="SELECT COUNT(*) AS Tot, category FROM stock GROUP BY category order by category"></asp:SqlDataSource>
</asp:Content>

