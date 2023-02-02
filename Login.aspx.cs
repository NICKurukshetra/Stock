using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["cnstock"].ConnectionString;
        Session.Clear();

    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        //Session["uid"] = "A";
       // Response.Redirect("Stockentry.aspx");


        SqlDataAdapter adp = new SqlDataAdapter("select * from users where mobile=@user", con);
        adp.SelectCommand.Parameters.Add("@user", System.Data.SqlDbType.VarChar, 50).Value = txtid.Text;
        DataSet ds = new DataSet();
        try
        {

            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["pass"].ToString() == txtpwd.Text && ds.Tables[0].Rows[0]["type"].ToString()=="A")
            {
                Session["uid"] = ds.Tables[0].Rows[0]["mobile"].ToString();

                lblerror.Text = "";
                ds.Dispose();
                adp.Dispose();
                con.Close();

                Response.Redirect("Stockentry.aspx");



            }

            {

                lblerror.Text = "Invalid userid or password";

            }
            ds.Dispose();
            adp.Dispose();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }
        finally { ds.Dispose(); adp.Dispose(); con.Close(); }

    }
}