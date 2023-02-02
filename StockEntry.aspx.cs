using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
public partial class StockEntry : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       if(Button2.Text.ToUpper()=="SUBMIT")
        {
            SqlCommand cmdsave = new SqlCommand("insert into stock (stockregister, category, modelno, serialno, invoice, RefNo, make, dop, dealer, price, tehsil, branchid, installationdate, remarks, warrantyPeriod, AMCPeriod, Status,project,issuedto,mobile) values (@stockregister, @category, @modelno, @serialno, @invoice, @RefNo, @make, @dop, @dealer, @price, @tehsil, @branchid, @installationdate, @remarks, @warrantyPeriod, @AMCPeriod, @Status,@project,@issuedto,@mobile)", con);
            cmdsave.Parameters.Add("@stockregister", SqlDbType.VarChar, 150).Value = DropDownList5.Text;
            cmdsave.Parameters.Add("@category", SqlDbType.VarChar, 150).Value = DropDownList1.Text;
            cmdsave.Parameters.Add("@modelno", SqlDbType.VarChar, 50).Value = TextBox1.Text;
            cmdsave.Parameters.Add("@serialno", SqlDbType.VarChar, 50).Value = TextBox2.Text;
            cmdsave.Parameters.Add("@invoice", SqlDbType.VarChar, 50).Value = TextBox10.Text;
            cmdsave.Parameters.Add("@refno", SqlDbType.VarChar, 50).Value = TxtRefNo.Text;
            cmdsave.Parameters.Add("@make", SqlDbType.VarChar, 50).Value = txtMake.Text;
            cmdsave.Parameters.Add("@dop", SqlDbType.VarChar, 10).Value = txtdtPurchase.Text;
            cmdsave.Parameters.Add("@dealer", SqlDbType.VarChar, 250).Value = TextBox4.Text;
            cmdsave.Parameters.Add("@price", SqlDbType.VarChar, 50).Value = TextBox5.Text;
            cmdsave.Parameters.Add("@tehsil", SqlDbType.VarChar, 50).Value = DropDownList4.Text;
            cmdsave.Parameters.Add("@branchid", SqlDbType.VarChar, 50).Value = drpBranch.SelectedValue;
            
            cmdsave.Parameters.Add("@installationdate", SqlDbType.VarChar, 10).Value = TextBox6.Text;
            cmdsave.Parameters.Add("@remarks", SqlDbType.VarChar, 500).Value = TextBox7.Text;
            cmdsave.Parameters.Add("@warrantyPeriod", SqlDbType.VarChar, 50).Value = txtWarrantyPeriod.Text;
            cmdsave.Parameters.Add("@AMCPeriod", SqlDbType.VarChar, 500).Value = txtAMCPeriod.Text;
            cmdsave.Parameters.Add("@status", SqlDbType.VarChar, 500).Value = DropDownList3.Text;
            cmdsave.Parameters.Add("@project", SqlDbType.VarChar, 500).Value = DrpProject.Text;
            cmdsave.Parameters.Add("@issuedto", SqlDbType.VarChar).Value = txtissuedto.Text;
            cmdsave.Parameters.Add("@mobile", SqlDbType.NVarChar).Value = txtmobile.Text;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmdsave.ExecuteNonQuery();
            cmdsave.Parameters.Clear();
            cmdsave.Dispose();
            con.Close();
            //Response.Redirect("stockEntry.aspx");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }
       if (Button2.Text.ToUpper() == "UPDATE")
       {
           SqlCommand cmdUpdate = new SqlCommand("update stock set stockregister=@stockregister, category=@category, modelno=@modelno, serialno=@serialno, invoice=@invoice, RefNo=@RefNo, make=@make, dop=@dop, dealer=@dealer, price=@price, tehsil=@tehsil, branchid=@branchid, installationdate=@installationdate, remarks=@remarks, warrantyPeriod=@warrantyPeriod, AMCPeriod=@AMCPeriod, Status=@Status,project=@project,issuedto=@issuedto,mobile=@mobile where srno=@srno", con);
           cmdUpdate.Parameters.Add("@stockregister", SqlDbType.VarChar, 150).Value = DropDownList5.Text;
           cmdUpdate.Parameters.Add("@category", SqlDbType.VarChar, 150).Value = DropDownList1.Text;
           cmdUpdate.Parameters.Add("@modelno", SqlDbType.VarChar, 50).Value = TextBox1.Text;
           cmdUpdate.Parameters.Add("@serialno", SqlDbType.VarChar, 50).Value = TextBox2.Text;
           cmdUpdate.Parameters.Add("@invoice", SqlDbType.VarChar, 50).Value = TextBox10.Text;
           cmdUpdate.Parameters.Add("@refno", SqlDbType.VarChar, 50).Value = TxtRefNo.Text;
           cmdUpdate.Parameters.Add("@make", SqlDbType.VarChar, 50).Value = txtMake.Text;
           cmdUpdate.Parameters.Add("@dop", SqlDbType.VarChar, 10).Value = txtdtPurchase.Text;
           cmdUpdate.Parameters.Add("@dealer", SqlDbType.VarChar, 250).Value = TextBox4.Text;
           cmdUpdate.Parameters.Add("@price", SqlDbType.VarChar, 50).Value = TextBox5.Text;
           cmdUpdate.Parameters.Add("@tehsil", SqlDbType.VarChar, 50).Value = DropDownList4.Text;
            //cmdUpdate.Parameters.Add("@office", SqlDbType.VarChar, 50).Value = drpOffice.Text;
            cmdUpdate.Parameters.Add("@branchid", SqlDbType.NVarChar).Value = drpBranch.SelectedValue;
         
            cmdUpdate.Parameters.Add("@installationdate", SqlDbType.VarChar, 10).Value = TextBox6.Text;
           cmdUpdate.Parameters.Add("@remarks", SqlDbType.VarChar, 500).Value = TextBox7.Text;
           cmdUpdate.Parameters.Add("@warrantyPeriod", SqlDbType.VarChar, 50).Value = txtWarrantyPeriod.Text;
           cmdUpdate.Parameters.Add("@AMCPeriod", SqlDbType.VarChar, 500).Value = txtAMCPeriod.Text;
           cmdUpdate.Parameters.Add("@status", SqlDbType.VarChar, 500).Value = DropDownList3.Text;
           cmdUpdate.Parameters.Add("@project", SqlDbType.VarChar, 500).Value = DrpProject.Text;
           cmdUpdate.Parameters.Add("@srno", SqlDbType.Int).Value = Convert.ToInt32(Label1.Text);
            cmdUpdate.Parameters.Add("@issuedto", SqlDbType.VarChar).Value = txtissuedto.Text;
            cmdUpdate.Parameters.Add("@mobile", SqlDbType.NVarChar).Value = txtmobile.Text;
            if (con.State == ConnectionState.Closed)
           {
               con.Open();
           }
           cmdUpdate.ExecuteNonQuery();
           cmdUpdate.Parameters.Clear();
           cmdUpdate.Dispose();
           con.Close();
           
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
           // Response.Redirect("stockEntry.aspx");
        }

    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
      
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TextBox8.Text != "")
        {
            SqlCommand cmdsave = new SqlCommand("insert into categorymaster (category) values (@category)", con);
            cmdsave.Parameters.Add("@category", SqlDbType.VarChar, 150).Value = TextBox8.Text;
             if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmdsave.ExecuteNonQuery();
            cmdsave.Parameters.Clear();
            cmdsave.Dispose();
            con.Close();
        }
        DropDownList1.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (TextBox9.Text != "" & drpOffice.Text != "")
        {
            SqlCommand cmdsave = new SqlCommand("insert into branchmaster (office,branchname) values (@office,@branchname)", con);
            cmdsave.Parameters.Add("@office", SqlDbType.VarChar, 150).Value = drpOffice.Text;
            cmdsave.Parameters.Add("@branchname", SqlDbType.VarChar, 150).Value = TextBox9.Text;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmdsave.ExecuteNonQuery();
            cmdsave.Parameters.Clear();
            cmdsave.Dispose();
            con.Close();
        }
        drpBranch.DataBind();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //SqlDataSource4.SelectCommand = "SELECT stock.Srno, stock.stockregister, stock.category, stock.modelno, stock.serialno, stock.invoice, stock.RefNo, stock.make, stock.dop, stock.dealer, stock.price, stock.tehsil, stock.installationdate, stock.remarks, stock.warrantyPeriod, stock.AMCPeriod, stock.Status, branchmaster.branchname, OfficeMas.Office, stock.branchid, OfficeMas.Srno AS Officeid,stock.IssuedTo, stock.Mobile FROM stock INNER JOIN branchmaster ON stock.branchid = branchmaster.Srno INNER JOIN OfficeMas ON branchmaster.id = OfficeMas.Srno WHERE (stock.branchid = " + drpBranch.SelectedValue + ") ORDER BY stock.Srno DESC";
        //GridView1.DataBind();

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //SqlDataSource4.SelectCommand = "select * from stock where category='" + DropDownList1.Text + "'";
        //GridView1.DataBind();
    }
  
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        SqlDataAdapter ad1 = new SqlDataAdapter("select * from stock where srno=@srno", con);
        ad1.SelectCommand.Parameters.Add("@srno", SqlDbType.Int).Value = Convert.ToInt32(GridView1.SelectedDataKey[0].ToString());
        DataSet ds1 = new DataSet();
        ad1.Fill(ds1);
        if (ds1.Tables[0].Rows[0]["stockregister"] != null) { DropDownList5.Text = ds1.Tables[0].Rows[0]["stockregister"].ToString(); }
        if (ds1.Tables[0].Rows[0]["category"] != null) DropDownList1.Text = ds1.Tables[0].Rows[0]["category"].ToString();
        if (ds1.Tables[0].Rows[0]["modelno"] != null) TextBox1.Text = ds1.Tables[0].Rows[0]["modelno"].ToString();
        if (ds1.Tables[0].Rows[0]["serialno"] != null) TextBox2.Text = ds1.Tables[0].Rows[0]["serialno"].ToString();
        if (ds1.Tables[0].Rows[0]["invoice"] != null) TextBox10.Text = ds1.Tables[0].Rows[0]["invoice"].ToString();
        if (ds1.Tables[0].Rows[0]["refno"] != null) TxtRefNo.Text = ds1.Tables[0].Rows[0]["refno"].ToString();
        if (ds1.Tables[0].Rows[0]["make"] != null) txtMake.Text = ds1.Tables[0].Rows[0]["make"].ToString();
     
        if (ds1.Tables[0].Rows[0]["dealer"] != null) TextBox4.Text = ds1.Tables[0].Rows[0]["dealer"].ToString();
        if (ds1.Tables[0].Rows[0]["price"] != null) TextBox5.Text = ds1.Tables[0].Rows[0]["price"].ToString();
        if (ds1.Tables[0].Rows[0]["tehsil"] != null) DropDownList4.Text = ds1.Tables[0].Rows[0]["tehsil"].ToString();
        //if (ds1.Tables[0].Rows[0]["office"] != null) drpOffice.Text = ds1.Tables[0].Rows[0]["office"].ToString();
       
        if (ds1.Tables[0].Rows[0]["installationdate"] != null) TextBox6.Text = ds1.Tables[0].Rows[0]["installationdate"].ToString();
        if (ds1.Tables[0].Rows[0]["remarks"] != null) TextBox7.Text = ds1.Tables[0].Rows[0]["remarks"].ToString();
        if (ds1.Tables[0].Rows[0]["warrantyPeriod"] != null) txtWarrantyPeriod.Text = ds1.Tables[0].Rows[0]["warrantyPeriod"].ToString();
        if (ds1.Tables[0].Rows[0]["AMCPeriod"] != null) txtAMCPeriod.Text = ds1.Tables[0].Rows[0]["AMCPeriod"].ToString();
        if (ds1.Tables[0].Rows[0]["status"] != null) DropDownList3.Text = ds1.Tables[0].Rows[0]["status"].ToString();
        if (ds1.Tables[0].Rows[0]["srno"] != null) Label1.Text = ds1.Tables[0].Rows[0]["srno"].ToString();
        if (ds1.Tables[0].Rows[0]["project"] != null) DrpProject.Text = ds1.Tables[0].Rows[0]["project"].ToString();
        if (ds1.Tables[0].Rows[0]["issuedto"] != null) txtissuedto.Text = ds1.Tables[0].Rows[0]["issuedto"].ToString();
        if (ds1.Tables[0].Rows[0]["mobile"] != null) txtmobile.Text = ds1.Tables[0].Rows[0]["mobile"].ToString();
        

        //Response.Write(ds1.Tables[0].Rows[0]["presentlocation"]);
        if (ds1.Tables[0].Rows[0]["branchid"] != null && ds1.Tables[0].Rows[0]["branchid"].ToString() != string.Empty)
        { drpOffice.SelectedValue = GridView1.SelectedDataKey[1].ToString(); drpBranch.DataBind(); drpBranch.SelectedValue = GridView1.SelectedDataKey[2].ToString(); }


        if (ds1.Tables[0].Rows[0]["dop"] != null) txtdtPurchase.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0]["dop"]).ToString("yyyy-MM-dd");
        Button2.Text = "Update";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("stockentry.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
          SqlCommand cmdDel = new SqlCommand("delete from stock where srno=@srno", con);
            cmdDel.Parameters.Add("@srno", SqlDbType.Int).Value = Convert.ToInt32(Label1.Text);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmdDel.ExecuteNonQuery();
            cmdDel.Parameters.Clear();
            cmdDel.Dispose();
            con.Close();
            Response.Redirect("stockentry.aspx");
      }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlDataSource4.SelectCommand = "select * from stock where tehsil is null or tehsil=''";
        GridView1.DataBind();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        String qry = "SELECT stock.Srno, stock.stockregister, stock.category, stock.modelno, stock.serialno, stock.invoice, stock.RefNo, stock.make, stock.dop, stock.dealer, stock.price, stock.tehsil, stock.installationdate, stock.remarks, stock.warrantyPeriod, stock.AMCPeriod, stock.Status, branchmaster.branchname, OfficeMas.Office, stock.branchid, OfficeMas.Srno AS Officeid,stock.IssuedTo, stock.Mobile FROM stock INNER JOIN branchmaster ON stock.branchid = branchmaster.Srno INNER JOIN OfficeMas ON branchmaster.id = OfficeMas.Srno WHERE  stock.Srno>0 ";
        if (DropDownList1.SelectedIndex > 0)
        {
           qry=qry+" and stock.category = '" + DropDownList1.SelectedItem.Text + "' ";
        }

        if (drpOffice.Text.Length > 0 && drpBranch.Text.Length>0)
        {
            qry  = qry+ " and stock.branchid = " + drpBranch.SelectedValue + " ";
        }
        if (DrpProject.Text.Length > 0)
        {
            qry = qry + " and stock.project = '" + DrpProject.SelectedValue + "' ";
        }

        if (DropDownList3.Text.Length > 0)
        {
            qry = qry + " and stock.status = '" + DropDownList3.SelectedValue + "' ";
        }



        SqlDataSource4.SelectCommand =  qry;
        GridView1.DataBind();
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        
            if (TextBox11.Text != "")
            {
                SqlCommand cmdsave = new SqlCommand("insert into officemas (office) values (@branchname)", con);
                cmdsave.Parameters.Add("@branchname", SqlDbType.VarChar, 150).Value = TextBox11.Text;
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmdsave.ExecuteNonQuery();
                cmdsave.Parameters.Clear();
                cmdsave.Dispose();
                con.Close();
            }
            drpBranch.DataBind();
        
    }

    protected void drpOffice_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}
