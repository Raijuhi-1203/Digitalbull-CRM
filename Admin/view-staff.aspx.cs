using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_view_staff : System.Web.UI.Page
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
                SqlDataReader dr_data = mst.Select_Operation("select * from staff where id='" + Request.QueryString[0] + "'");
                if (dr_data.Read())
                {
                    name.Text = dr_data["name"].ToString();
                    email.Text = dr_data["email"].ToString();
                    mobileno.Text = dr_data["mobileno"].ToString();
                    dblrole.SelectedValue = dr_data["role"].ToString();
                    fname.Text = dr_data["father_name"].ToString();
                    mname.Text = dr_data["mother_name"].ToString();
                    alternate_no.Text = dr_data["alternate_contact_number"].ToString();
                    address.Text = dr_data["address"].ToString();
                }
                dr_data.Close();
            }
            
        }
    }

    protected void btnsend_ServerClick(object sender, EventArgs e)
    {
        int success = mst.Delete_Staff(Request.QueryString[0]);

        if (success > 0)
        {
            Response.Write("<script>alert('Staff delete.');</script>");
            Response.Redirect("manage-staff.aspx");
        }
    }
}