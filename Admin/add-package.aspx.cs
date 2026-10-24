using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_add_package : System.Web.UI.Page
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
        if (name.Text.Length > 0 && price.Text.Length > 0 && details.Text.Length > 0)
        {
            int success = mst.Add_Package(name.Text, price.Text, details.Text);

            if (success > 0)
            {

                //Response.Write("<script>alert('Package Add.');</script>");
                ShowMessage("Data has been saved", MessageType.Success);
                name.Text = string.Empty;
                price.Text = string.Empty;
                details.Text = string.Empty;

            }
        }
        else
        {
            ShowMessage("All * field are required.", MessageType.Warning);
            //Response.Write("<script>alert('All field are required.');</script>");
        }
    }
}