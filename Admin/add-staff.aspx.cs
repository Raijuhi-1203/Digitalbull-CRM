using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Admin_add_staff : System.Web.UI.Page
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

            }
        }
    }

    protected void btnsend_ServerClick(object sender, EventArgs e)
    {
        if (name.Text.Length > 0 && email.Text.Length > 0 && mobileno.Text.Length > 0 && fname.Text.Length > 0 && mname.Text.Length > 0 && alternate_no.Text.Length > 0)
        {
            int success = mst.Add_Staff(name.Text, email.Text, mobileno.Text,dblrole.SelectedItem.Text, fname.Text, mname.Text, alternate_no.Text, address.Text);

            if (success > 0)
            {
                ShowMessage("Data has been saved", MessageType.Success);
               // Response.Write("<script>alert('Staff Add.');</script>");

                name.Text = string.Empty;
                email.Text = string.Empty;
                mobileno.Text = string.Empty;
                fname.Text = string.Empty;
                mname.Text = string.Empty;
                alternate_no.Text = string.Empty;
                address.Text = string.Empty;
                dblrole.SelectedIndex = 0;

            }
        }
        else
        {
            ShowMessage("All * field are required.", MessageType.Warning);
            //Response.Write("<script>alert('All field are required.');</script>");
        }
    }
}