<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StockEntry.aspx.cs" Inherits="StockEntry" Title="Stock Entry" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">
    function openModal() {
        $('#myModal').modal('show');
    }
</script>

    

         <div class="row">
              <div class="col-md-12">

                <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                    <h4 class="card-title">Enter Stock</h4>
                                    
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label">Category</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="Category"
                    DataValueField="Category" ondatabound="DropDownList1_DataBound" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" 
              
                  >
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem>-------------</asp:ListItem>
                </asp:DropDownList>
                                            **<asp:TextBox ID="TextBox8" runat="server" Width="125px"></asp:TextBox>
                                                    <asp:Button ID="Button3" runat="server" Visible="false"
                    onclick="Button3_Click" Text="+" />
               
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Make</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtMake" runat="server" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Model No.</label>
                                        <div class="col-sm-9">
                                              <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email1" class="col-sm-3 text-right control-label col-form-label">Sr. No.</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label"> Invoice No.</label>
                                        <div class="col-sm-9">
                                           <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Stock Register</label>
                                        <div class="col-sm-9">
                                           <asp:DropDownList ID="DropDownList5" runat="server" ondatabound="DropDownList1_DataBound" 
                    AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>Non-Consumable</asp:ListItem>
                    <asp:ListItem>Consumable</asp:ListItem>
                    <asp:ListItem>Both</asp:ListItem>
                    <asp:ListItem>
                    </asp:ListItem>
                </asp:DropDownList>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">  Ref. No. in Stock Register</label>
                                        <div class="col-sm-9">
                                           <asp:TextBox ID="TxtRefNo" runat="server" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Date of Purchase</label>
                                        <div class="col-sm-9">
                                          <asp:TextBox ID="txtdtPurchase" runat="server" Width="250px" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Warranty Period</label>
                                        <div class="col-sm-9">
                                           <asp:TextBox ID="txtWarrantyPeriod" runat="server"></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">AMC Period</label>
                                        <div class="col-sm-9">
                                           <asp:TextBox ID="txtAMCPeriod" runat="server" ></asp:TextBox>
                                        </div>
                                    </div>
                                        
                                 
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Purchased From</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
                                        </div>
                                    </div>


                                     <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Price</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
                                        </div>
                                    </div>
                                 
                                    
                                   


                                     <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Tehsil/Sub Tehsil</label>
                                        <div class="col-sm-9">
                                            
                                                <asp:DropDownList ID="DropDownList4" runat="server" >
                    <asp:ListItem>Thanesar</asp:ListItem>
                    <asp:ListItem>Shahabad</asp:ListItem>
                    <asp:ListItem>Pehowa</asp:ListItem>
                    <asp:ListItem>Ladwa</asp:ListItem>
                    <asp:ListItem>Ismailabad</asp:ListItem>
                    <asp:ListItem>Babain</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/assets/search.png" onclick="ImageButton1_Click"/>
                                        </div>
                                    </div>
                                     <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">office</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="drpOffice" runat="server" Width="125px" 
                    DataSourceID="SqlDataSource1" DataTextField="Office" 
                    DataValueField="Srno" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="drpOffice_SelectedIndexChanged"
                  >
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [Office], [Srno] FROM [OfficeMas]"></asp:SqlDataSource>
                <asp:TextBox ID="TextBox11" runat="server" Width="125px"></asp:TextBox>
                                                    <asp:Button ID="Button7" runat="server" 
                    onclick="Button7_Click" Text="+" Visible="False" />
                                        </div>
                                    </div>
                                     <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Installed at</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="drpBranch" runat="server" Width="125px" 
                    DataSourceID="SqlDataSource3" DataTextField="branchname" 
                    DataValueField="Srno" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                                            **<asp:TextBox ID="TextBox9" runat="server" Width="125px"></asp:TextBox>
                                                    <asp:Button ID="Button4" runat="server" 
                    onclick="Button4_Click" Text="+" Visible="False" />
                                        </div>
                                    </div>


                                     <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Status</label>
                                        <div class="col-sm-9">
                                             <asp:DropDownList ID="DropDownList3" runat="server" Width="250px">
                                                 <asp:ListItem></asp:ListItem>
                   <asp:ListItem>Working</asp:ListItem>
                    <asp:ListItem>Not Working</asp:ListItem>
                    <asp:ListItem>Write off</asp:ListItem>
                </asp:DropDownList>
                                        </div>
                                    </div>

                                     
                                     <div class="form-group row">
            <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Project</label>
                  <div class="col-sm-9">
            
                <asp:DropDownList ID="DrpProject" runat="server" Width="250px">
                    <asp:ListItem> </asp:ListItem>
                    <asp:ListItem>DITS</asp:ListItem>
                    <asp:ListItem>NIC</asp:ListItem>
                    <asp:ListItem>Land Record</asp:ListItem>
                    <asp:ListItem>DC Office</asp:ListItem>
                    <asp:ListItem>Transport</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                    
                </asp:DropDownList>
                      **</div>
        </div>                             <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label"> Specification</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" ></asp:TextBox>
                                        </div>
                                    </div>

                                     <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label"> Date of Installation</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TextBox6" runat="server" Width="250px" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                       <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label"> Issued To</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtissuedto" runat="server" Width="250px" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label"> Mobile</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtmobile" runat="server" Width="250px" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                   
                                         <asp:Button ID="Button1" runat="server" Text="Cancel" onclick="Button1_Click" CssClass="btn btn-primary"/>
                &nbsp;<asp:Button ID="Button2" runat="server"   onclick="Button2_Click" Text="Submit" CssClass="btn btn-success"/>
            &nbsp;<asp:Button ID="Button6" runat="server" onclick="Button6_Click" CssClass="btn btn-info"
                    Text=" Find " />
            &nbsp;<asp:Button ID="Button5" runat="server" onclick="Button5_Click" CssClass="btn btn-danger"
                    Text="Delete" />
                                    </div>
                                </div>
                            </div>
                       
            </div>
             </div>

    </div>
    
    
      <div class="table-responsive">    
  
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource4"  DataKeyNames="Srno,Officeid,branchid" CssClass="table table-bordered"
                    onselectedindexchanged="GridView1_SelectedIndexChanged1">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Srno" HeaderText="Srno" SortExpression="Srno" InsertVisible="False" ReadOnly="True">
                        </asp:BoundField>
                        <asp:BoundField DataField="stockregister" HeaderText="stockregister" 
                            SortExpression="stockregister" />
                        <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                        <asp:BoundField DataField="modelno" HeaderText="modelno" 
                            SortExpression="modelno" />
                        <asp:BoundField DataField="serialno" HeaderText="serialno" 
                            SortExpression="serialno" ReadOnly="True" />
                        <asp:BoundField DataField="invoice" HeaderText="invoice" 
                            SortExpression="invoice" />
                        <asp:BoundField DataField="RefNo" HeaderText="RefNo" SortExpression="RefNo" />
                        <asp:BoundField DataField="make" HeaderText="make" 
                            SortExpression="make" />
                        <asp:BoundField DataField="dop" HeaderText="dop" SortExpression="dop" />
                        <asp:BoundField DataField="dealer" HeaderText="dealer" 
                            SortExpression="dealer" />
                              <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="tehsil" HeaderText="tehsil" SortExpression="tehsil" />
                        <asp:BoundField DataField="installationdate" HeaderText="installationdate" 
                            SortExpression="installationdate" />
                        <asp:BoundField DataField="remarks" HeaderText="remarks" 
                            SortExpression="remarks" />
                        <asp:BoundField DataField="warrantyPeriod" HeaderText="warrantyPeriod" SortExpression="warrantyPeriod" />
                        <asp:BoundField DataField="AMCPeriod" HeaderText="AMCPeriod" SortExpression="AMCPeriod" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="branchname" HeaderText="branchname" SortExpression="branchname" />
                        <asp:BoundField DataField="Office" HeaderText="Office" SortExpression="Office" />
                        <asp:BoundField DataField="IssuedTo" HeaderText="IssuedTo" SortExpression="IssuedTo" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                    </Columns>
                    <HeaderStyle BackColor="#339966" />
                </asp:GridView>
          </div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cn %>" 
                    SelectCommand="SELECT stock.Srno, stock.stockregister, stock.category, stock.modelno, stock.serialno, stock.invoice, stock.RefNo, stock.make, stock.dop, stock.dealer, stock.price, stock.tehsil, stock.installationdate, stock.remarks, stock.warrantyPeriod, stock.AMCPeriod, stock.Status, branchmaster.branchname, OfficeMas.Office, stock.branchid, OfficeMas.Srno AS Officeid, stock.IssuedTo, stock.Mobile FROM stock INNER JOIN branchmaster ON stock.branchid = branchmaster.Srno INNER JOIN OfficeMas ON branchmaster.id = OfficeMas.Srno WHERE (stock.category = @category) ORDER BY stock.Srno DESC" 
                    DeleteCommand="delete from stock where srno=@srno">
                    <DeleteParameters>
                        <asp:Parameter Name="srno" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="category" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
            
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cn %>" 
        SelectCommand="SELECT distinct [Category] FROM [categorymaster]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cn %>" 
        SelectCommand="SELECT * FROM [branchmaster] WHERE (id = @id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="drpOffice" Name="id" PropertyName="SelectedValue" />
        </SelectParameters>
     </asp:SqlDataSource>

     <div class="container">
  
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Alert</h4>
        </div>
        <div class="modal-body">
          <div class="alert alert-success">
  <strong>Success!</strong> Your Record Save<strong>
      </strong>
</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
     
</div>
</asp:Content>

