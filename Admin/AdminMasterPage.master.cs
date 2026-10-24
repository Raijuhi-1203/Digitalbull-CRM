using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_name"] == null)
        {
            Response.Redirect("admin-login.aspx?expired=1", false);
            Context.ApplicationInstance.CompleteRequest();
            return;
        }
        else
        {
            staff_name.InnerText = Session["admin_name"].ToString();
            staff_name2.InnerText = Session["admin_name"].ToString();
            staff_name3.InnerText = Session["admin_name"].ToString();
        }
    }

}
