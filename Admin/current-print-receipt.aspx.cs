using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_current_print_receipt : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };

    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["admin_name"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }
            else
            {

                SqlDataReader dr_data = mst.Select_Operation("select * from payment a left join client as b on a.client_name=b.business_name where a.id='" + Request.QueryString[0] + "'");
                if (dr_data.Read())
                {
                    invoice_date.InnerText = "Invoice Date : " + dr_data["create_date"].ToString();
                    client_name.InnerText = dr_data["client_name"].ToString();
                    client_address.InnerText = dr_data["address"].ToString();
                    service.InnerText = dr_data["service_name"].ToString();
                    date.InnerText = dr_data["create_date"].ToString();
                    amount.InnerText = dr_data["amount"].ToString();
                    subtotal.InnerText = dr_data["amount"].ToString();
                    total.InnerText = dr_data["amount"].ToString();

                }
                dr_data.Close();

            }

        }
    }

}