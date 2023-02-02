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

using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;

public partial class Print : System.Web.UI.Page
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
        SqlDataSource4.SelectCommand = "select * from stock where presentlocation='"+DropDownList2.Text+"'";
        GridView1.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
  
  
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("stockentry.aspx");
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


                String myqry = "select  OfficeMas.Office, branchmaster.branchname AS Branch ," + qry.Substring(0, qry.Length - 1) + " from OfficeMas INNER JOIN  branchmaster ON OfficeMas.Srno = branchmaster.id RIGHT OUTER JOIN  stock ON branchmaster.Srno = stock.branchid where srno >0 ";

                SqlDataSource4.SelectParameters.Clear();

                if (DropDownList1.SelectedIndex > 0)
                {
                    myqry += " and category=@category";

                    SqlDataSource4.SelectParameters.Add("category", DropDownList1.Text.Trim());
                }
                if (txtMake.Text.Trim().Length > 0)
                {
                    myqry += " and make=@make";
                    SqlDataSource4.SelectParameters.Add("make", txtMake.Text.Trim());

                }
                if (TextBox1.Text.Trim().Length > 0)
                {
                    myqry += " and model=@model";
                    SqlDataSource4.SelectParameters.Add("model", TextBox1.Text.Trim());

                }
                if (TextBox2.Text.Trim().Length > 0)
                {
                    myqry += " and serialno=@serialno";
                    SqlDataSource4.SelectParameters.Add("serialno", TextBox2.Text.Trim());

                }
                if (DropDownList6.SelectedIndex > 0)
                {

                    myqry += " and office=@office";
                    SqlDataSource4.SelectParameters.Add("office", DropDownList6.Text.Trim());
                }

                SqlDataSource4.SelectCommand = myqry;


                GridView1.DataBind();
            }
        }
        catch(Exception ex)
        {

            Response.Write(ex.Message);
        }
     }



    protected void Button7_Click(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count > 0)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Employees.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
#pragma warning disable CS0612 // Type or member is obsolete  
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
#pragma warning restore CS0612 // Type or member is obsolete  
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
         //   GridView1.AllowPaging = true;
           // GridView1.DataBind();
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("content-disposition", "attachment;filename="+DropDownList1.SelectedItem.Text+".xls");
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
