using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        
    }
    protected void ASPxComboBox1_Init(object sender, EventArgs e)
    {
        DropDownList control = (DropDownList)sender;
        System.Diagnostics.Debug.WriteLine(control.UniqueID); // It can be ASPxPanel1$ASPxComboBox1, ASPxGridView1$Title$ASPxComboBox1, etc.  
    }
}