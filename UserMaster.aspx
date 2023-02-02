<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Mobile" DataSourceID="SqlDataSource1" CssClass="table table-active">
                <Fields>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" ReadOnly="True" SortExpression="Mobile" />
                    <asp:BoundField DataField="Pass" HeaderText="Pass" SortExpression="Pass" />
                    <asp:TemplateField HeaderText="Type" SortExpression="Type">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            
                        <asp:DropDownList ID="drpTpe" runat="server" SelectedValue='<%# Bind("type") %>' >
                            <asp:ListItem ></asp:ListItem>
                            <asp:ListItem Value="U">User</asp:ListItem>
                            <asp:ListItem Value="A">Admin</asp:ListItem>
                            </asp:DropDownList>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                    <asp:TemplateField HeaderText="branchid" SortExpression="branchid">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("branchid") %>'></asp:TextBox>

                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Office" DataValueField="Srno" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnstock %>" SelectCommand="SELECT [Srno], [Office] FROM [OfficeMas]"></asp:SqlDataSource>
                            <br />
                            <asp:DropDownList ID="drpbid"  OnInit="ASPxComboBox1_Init"  runat="server" DataSourceID="SqlDataSource2" DataTextField="branchname" DataValueField="Srno"    >
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cnstock %>" SelectCommand="SELECT [branchname], [Srno] FROM [branchmaster] WHERE ([id] = @id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("branchid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Srno" CssClass="table table-active" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" ReadOnly="True" SortExpression="Mobile" />
                    <asp:BoundField DataField="Pass" HeaderText="Pass" SortExpression="Pass" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                    <asp:TemplateField HeaderText="Branch" SortExpression="branchid">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("branchid") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                          <asp:DropDownList ID="drpbname"    runat="server" DataSourceID="SqlDataSource3" Enabled="false" DataTextField="branchname" DataValueField="Srno" SelectedValue='<%# Bind("branchid") %>'    >
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cnstock %>" SelectCommand="SELECT [branchname], [Srno] FROM [branchmaster]">
                              
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnstock %>" InsertCommand="INSERT INTO Users(Name,Mobile, Pass, Type, Active, branchid) VALUES (@Name,@Mobile, @Pass, @Type, @Active, @branchid)" SelectCommand="SELECT Srno,Name, Mobile, Pass, Type, Active, branchid FROM Users" DeleteCommand="delete from users where srno=@srno">
                <DeleteParameters>
                    <asp:Parameter Name="srno" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Mobile" />
                    <asp:Parameter Name="Pass" />
                    <asp:Parameter Name="Type" />
                    <asp:Parameter Name="Active" />
                    <asp:ControlParameter Name="branchid" ControlID="ctl00$ContentPlaceHolder1$DetailsView1$drpbid" Direction="Input" />
                                                                     
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>

