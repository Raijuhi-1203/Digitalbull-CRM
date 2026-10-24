using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Staff_logout : System.Web.UI.Page
{
    Master mst = new Master();
    string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        name = Session["name"].ToString();

        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();

        // Expire authentication cookie
        if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
        {
            Response.Cookies[FormsAuthentication.FormsCookieName].Expires =
                DateTime.Now.AddDays(-1);
        }

        // Prevent browser caching
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
        mst.Add_End_Attendance(name);
        // Redirect
        Response.Redirect("login.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

       

        //Response.Cookies.Clear();
        //Response.Redirect("login.aspx");
    }
}