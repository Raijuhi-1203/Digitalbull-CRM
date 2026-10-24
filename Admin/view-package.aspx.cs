using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Admin_view_package : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    Master mst = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["admin_name"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }
            else
            {
                SqlDataReader dr_data = mst.Select_Operation("select * from package where id='" + Request.QueryString[0] + "'");
                if (dr_data.Read())
                {
                    name.Text = dr_data["name"].ToString();
                    price.Text = dr_data["price"].ToString();
                    details.Text = dr_data["details"].ToString();
                }
                dr_data.Close();
            }
            
        }
    }

    protected void btnsend_ServerClick(object sender, EventArgs e)
    {
        int success = mst.Delete_Package(Request.QueryString[0]);

        if (success > 0)
        {
            Response.Write("<script>alert('Package delete.');</script>");
            Response.Redirect("manage-package.aspx");
        }
    }


}