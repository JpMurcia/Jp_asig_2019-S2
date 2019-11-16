using Ext.Net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, DirectEventArgs e)
    {
        // Do some Authentication...

        // Then user send to application
        Response.Redirect("Desktop.aspx");
    }
}