using System;
using System.Configuration;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Web;
using System.IO;
using System.Web.UI;

public partial class OfficeWise : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;

    }
    
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
      
    }
   
    
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
  
  
    protected void Button1_Click(object sender, EventArgs e)
    {
      
    }
    

   
    protected void Button6_Click(object sender, EventArgs e)
    {
        try
        {
            string qry = "";
            foreach (System.Web.UI.WebControls.ListItem item in DropDownList4.Items)
            {
                if (item.Selected)
                {
                    qry += item.Value + ",";
                }
            }

            if (qry.Length > 0)
            {


                String myqry = "select OfficeMas.Office, branchmaster.branchname AS Branch ," + qry.Substring(0, qry.Length - 1) + " from OfficeMas INNER JOIN  branchmaster ON OfficeMas.Srno = branchmaster.id RIGHT OUTER JOIN  stock ON branchmaster.Srno = stock.branchid where stock.branchid='" + drpbid.SelectedValue+"' ";

                SqlDataSource1.SelectParameters.Clear();


                SqlDataSource1.SelectCommand = myqry;


                GridView1.DataBind();
            }
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }

    }



    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename="+drpbid.SelectedItem.Text+".pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        
        GridView1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4);
        pdfDoc.SetPageSize(new Rectangle(850f, 1100f));

        
        
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
        GridView1.AllowPaging = true;
        GridView1.DataBind();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("content-disposition", "attachment;filename=" + drpbid.SelectedItem.Text + ".xls");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        StringWriter swr = new StringWriter();
        HtmlTextWriter htmlwr = new HtmlTextWriter(swr);
        GridView1.AllowPaging = false;

        GridView1.RenderControl(htmlwr);
        Response.Output.Write(swr.ToString());
        Response.Flush();
        Response.End();
    }
}
