using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff_login : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning }
    protected void ShowMessage(string Message, MessageType type)
    {
        string safeMessage = HttpUtility.JavaScriptStringEncode(Message);

        string script = "ShowMessage('" + safeMessage + "','" + type.ToString() + "');";

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Toast_" + Guid.NewGuid().ToString(), script, true);
    }

    Master mst = new Master();

    string id, name, email, mobileno, role;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (loginEmail.Text.Length > 0 && loginPassword.Text.Length > 0)
            {

                SqlDataReader get_data = mst.Select_Operation("Select * from staff where email='" + loginEmail.Text + "' ");
                if (get_data.Read())
                {
                    id = get_data["id"].ToString();
                    email = get_data["email"].ToString();
                    mobileno = get_data["mobileno"].ToString();
                    name = get_data["name"].ToString();
                    role = get_data["role"].ToString();

                    if (loginEmail.Text == email && loginPassword.Text == mobileno)
                    {
                        Session["id"] = id;
                        Session["email"] = email;
                        Session["mobileno"] = mobileno;
                        Session["name"] = name;
                        Session["role"] = role;
                        // Forms Authentication
                        FormsAuthentication.SetAuthCookie(email,false);
                        mst.Add_Attendance(name);
                        // Store toast message
                        Session["ToastMessage"] = "Login Successfully.";
                        Session["ToastType"] = "Success";

                        Response.Redirect("dashboard.aspx");
                        Context.ApplicationInstance.CompleteRequest();

                        

                    }
                    else
                    {
                        ShowMessage("Invaild Email & Password.", MessageType.Error);
                    }
                }

                get_data.Close();

            }
            else
            {
                ShowMessage("Please enter Email and Password.", MessageType.Error);
            }
        }
        catch (SqlException ex)
        {
            ShowMessage(ex.Message, MessageType.Error);
        }
    }
}