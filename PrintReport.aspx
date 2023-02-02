<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrintReport.aspx.cs" Inherits="Print" Title="Print" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">
    function openModal() {
        $('#myModal').modal('show');
         }
    
     </script>
  
         <div class="form-group row">
                                    <label class="col-md-3 m-t-15">Multiple Select</label>
                                    <div class="col-md-9">
                                        
                                    </div>
                                </div>
    

         <div class="row">
              <div class="col-md-12">

                <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                    <h4 class="card-title">Print Report</h4>
                                    
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label">Category</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="Category" 
                    DataValueField="Category" >
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem>-------------</asp:ListItem>
                </asp:DropDownList>
            
               
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
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">office</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownList6" runat="server" Width="125px" 
                    DataSourceID="SqlDataSource1" DataTextField="office" 
                    DataValueField="office" AutoPostBack="True" AppendDataBoundItems="true"
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [Office] FROM [OfficeMas]"></asp:SqlDataSource>
                
                                                    
                                        </div>
                                    </div>
                                     <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Installed at</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownList2" runat="server" Width="125px" 
                    DataSourceID="SqlDataSource3" DataTextField="branchname" 
                    DataValueField="branchname" AutoPostBack="True" 
                 >
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox9" runat="server" Width="125px"></asp:TextBox>
                                                   
                                        </div>
                                    </div>


                                     <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Status</label>
                                        <div class="col-sm-9">
                                             <asp:DropDownList ID="DropDownList3" runat="server" Width="250px">
                    <asp:ListItem>Working</asp:ListItem>
                    <asp:ListItem>Not Working</asp:ListItem>
                </asp:DropDownList>
                                        </div>
                                    </div>
                                    

                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Select Report Column</label>
                                        <div class="col-sm-9">
                                            
                                            <asp:ListBox ID="DropDownList4" runat="server"  CssClass="select2 form-control m-t-15"
                                                ClientIDMode="Static" SelectionMode="Multiple"
                    DataSourceID="SqlDataSource5" DataTextField="ColName" DataValueField="ColName">
                    
                </asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT COLUMN_NAME as [ColName] FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Stock'"></asp:SqlDataSource>
             
                                                    
                                        </div>
                                    </div>

                                
                                <div class="border-top">
                                    <div class="card-body">
                                   
                                         <asp:Button ID="Button1" runat="server" Text="Cancel" onclick="Button1_Click" CssClass="btn btn-primary"/>
               

            &nbsp;<asp:Button ID="Button6" runat="server" onclick="Button6_Click" CssClass="btn btn-info"
                    Text=" Find " />
           
                                    &nbsp;<asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Export Pdf" />
                                        &nbsp;<asp:Button ID="Button2" runat="server"  Text="Export Excel" OnClick="Button2_Click" />
           
                                    </div>
                                </div>
                            </div>
                       
            </div>
           </div>  
    
    
      <div class="table-responsive">    
  
                <asp:GridView ID="GridView1" runat="server" 
                    DataSourceID="SqlDataSource4" CssClass="table table-bordered"
                  >
                    <HeaderStyle BackColor="#339966" />
                </asp:GridView>
          </div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cn %>" 
                    SelectCommand="SELECT * FROM [Stock] where srno=0" 
                    DeleteCommand="delete from stock where srno=@srno">
                    <DeleteParameters>
                        <asp:Parameter Name="srno" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
            
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cn %>" 
        SelectCommand="SELECT distinct [Category] FROM [categorymaster]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cn %>" 
        SelectCommand="SELECT * FROM [branchmaster] WHERE ([office] = @office)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList6" Name="office" PropertyName="SelectedValue" Type="String" />
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
                  </div>
             </div>
   
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="assets/libs/flot/excanvas.js"></script>
    <script src="assets/libs/flot/jquery.flot.js"></script>
    <script src="assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="assets/libs/flot/jquery.flot.time.js"></script>
    <script src="assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="dist/js/pages/chart/chart-page-init.js"></script>

                <script>
                    //***********************************//
                    // For select 2
                    //***********************************//
                    $(".select2").select2();

                    /*colorpicker*/
                    $('.demo').each(function () {
                        //
                        // Dear reader, it's actually very easy to initialize MiniColors. For example:
                        //
                        //  $(selector).minicolors();
                        //
                        // The way I've done it below is just for the demo, so don't get confused
                        // by it. Also, data- attributes aren't supported at this time...they're
                        // only used for this demo.
                        //
                        $(this).minicolors({
                            control: $(this).attr('data-control') || 'hue',
                            position: $(this).attr('data-position') || 'bottom left',

                            change: function (value, opacity) {
                                if (!value) return;
                                if (opacity) value += ', ' + opacity;
                                if (typeof console === 'object') {
                                    console.log(value);
                                }
                            },
                            theme: 'bootstrap'
                        });

                    });
                    /*datwpicker*/
                    jQuery('.mydatepicker').datepicker();
                    jQuery('#datepicker-autoclose').datepicker({
                        autoclose: true,
                        todayHighlight: true
                    });
                    var quill = new Quill('#editor', {
                        theme: 'snow'
                    });

                </script>
      
</asp:Content>

