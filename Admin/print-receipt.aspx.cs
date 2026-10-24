using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Admin_print_receipt : System.Web.UI.Page
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
            date.InnerText = DateTime.Now.ToString("dd-MMM-yyyy HH:mm tt");
            SqlDataReader dr_data = mst.Select_Operation("select * from client a left join package as b on a.package=b.name where a.id='" + Request.QueryString[0] + "'");
            if (dr_data.Read())
            {
                client_name.InnerText = dr_data["business_name"].ToString();
                email.InnerText = dr_data["official_mail"].ToString();
                mobileno.InnerText = dr_data["business_contact_number"].ToString();
                services.Text = dr_data["business_model"].ToString();
                package.InnerText = dr_data["package"].ToString();
                price.InnerText = dr_data["price"].ToString();
                address.InnerText = dr_data["address"].ToString();
            }
            dr_data.Close();

        }
    }


}