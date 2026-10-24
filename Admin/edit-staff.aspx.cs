using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_edit_staff : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning }
    protected void ShowMessage(string Message, MessageType type)
    {
        string safeMessage = HttpUtility.JavaScriptStringEncode(Message);

        string script = "ShowMessage('" + safeMessage + "','" + type.ToString() + "');";

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Toast_" + Guid.NewGuid().ToString(), script, true);
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
        if (name.Text.Length > 0 && email.Text.Length > 0 && mobileno.Text.Length > 0 && fname.Text.Length > 0 && mname.Text.Length > 0 && alternate_no.Text.Length > 0)
        {
            int success = mst.Update_Staff(Request.QueryString[0],name.Text, email.Text, mobileno.Text, dblrole.SelectedItem.Text, fname.Text, mname.Text, alternate_no.Text, address.Text);

            if (success > 0)
            {
                ShowMessage("Data has been updated.", MessageType.Success);
               // Response.Write("<script>alert('Staff Updated.');</script>");
                Response.Redirect("manage-staff.aspx");
            }
        }
        else
        {
            ShowMessage("All * field are required.", MessageType.Warning);
           // Response.Write("<script>alert('All field are required.');</script>");
        }
    }

}