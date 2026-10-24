using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_add_client : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            if (Session["admin_name"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }
            else
            {
                BindCategory();
            }
            
        }
    }

    private void BindCategory()
    {
        dblpackage.Items.Clear();
        dblpackage.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        String strQuery = "SELECT * FROM package";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;

        try
        {
            con.Open();

            dblpackage.DataSource = cmd.ExecuteReader();
            dblpackage.DataTextField = "name";
            dblpackage.DataValueField = "name";
            dblpackage.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    protected void btnsend_ServerClick(object sender, EventArgs e)
    {
        if (address.Text.Length > 0 && name.Text.Length > 0 && mobileno.Text.Length > 0 && email.Text.Length > 0 && bname.Text.Length > 0 && eyear.Text.Length > 0 && bmob.Text.Length > 0 && omail.Text.Length > 0)
        {
            int success = mst.Add_Client(name.Text, mobileno.Text, email.Text, dob.Text, bname.Text, eyear.Text, bmob.Text, omail.Text,address.Text,fb.Text,insta.Text,linkedin.Text,x.Text,gmb.Text,web.Text,yt.Text,notes.Text,vision.Text,mision.Text,dblpackage.SelectedValue.ToString(),descp.Text);

            if (success > 0)
            {

                //Response.Write("<script>alert('Client Add.');</script>");
                ShowMessage("Data has been saved.", MessageType.Success);
                name.Text = string.Empty;
                mobileno.Text = string.Empty;
                email.Text = string.Empty;
                dob.Text = string.Empty;
                bname.Text = string.Empty;
                eyear.Text = string.Empty;
                bmob.Text = string.Empty;
                omail.Text = string.Empty;
                address.Text = string.Empty;
                fb.Text = string.Empty;
                insta.Text = string.Empty;
                linkedin.Text = string.Empty;
                gmb.Text = string.Empty;
                x.Text = string.Empty;
                web.Text = string.Empty;
                yt.Text = string.Empty;
                notes.Text = string.Empty;
                vision.Text= string.Empty; 
                mision.Text = string.Empty;
                dblpackage.SelectedIndex = 0;
                descp.Text = string.Empty;

            }
        }
        else
        {
            ShowMessage("All * field are required.", MessageType.Warning);
            //Response.Write("<script>alert('All field are required.');</script>");
        }
    }

    protected void dblpackage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dblpackage.SelectedItem.Text != null)
        {
            SqlDataReader dr_data = mst.Select_Operation("select * from package where name='" + dblpackage.SelectedItem.Text + "'");
            if (dr_data.Read())
            {
                descp.Text = dr_data["details"].ToString();
                
            }
            dr_data.Close();
        }
        else
        {
            ShowMessage("Please select package.", MessageType.Warning);
           // Response.Write("<script>alert('Select Package.');</script>");
        }
    }

}