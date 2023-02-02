using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class WebQuery : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["cnstock"].ConnectionString;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text.ToString().Trim() == "Singla@" + DateTime.Now.ToString("ddHH"))
        {
            SqlDataAdapter ad1 = new SqlDataAdapter(TextBox1.Text, con);
            DataSet ds1 = new DataSet();
            ad1.Fill(ds1);
            GridView1.DataSource = ds1.Tables[0];
            GridView1.DataBind();
        }
        else
        {
            TextBox1.Text = "Notok";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            if (TextBox2.Text.ToString().Trim() == "Singla@" + DateTime.Now.ToString("ddHH"))
            {
                SqlCommand cmdUpdate = new SqlCommand(TextBox1.Text, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmdUpdate.ExecuteNonQuery();
                cmdUpdate.Parameters.Clear();
                con.Close();
                cmdUpdate.Dispose();
                TextBox2.Text = "ok";
            }
            else
            {
                TextBox2.Text = "NotOK";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}