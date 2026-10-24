using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_edit_client : System.Web.UI.Page
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

                SqlDataReader dr_data = mst.Select_Operation("select * from client where id='" + Request.QueryString[0] + "'");
                if (dr_data.Read())
                {
                    name.Text = dr_data["name"].ToString();
                    email.Text = dr_data["email"].ToString();
                    mobileno.Text = dr_data["mobileno"].ToString();
                    dob.Text = dr_data["dob"].ToString();
                    bname.Text = dr_data["business_name"].ToString();
                    eyear.Text = dr_data["establish"].ToString();
                    bmob.Text = dr_data["business_contact_number"].ToString();
                    omail.Text = dr_data["official_mail"].ToString();
                    fb.Text = dr_data["facebook"].ToString();
                    insta.Text = dr_data["instagram"].ToString();
                    linkedin.Text = dr_data["linkedin"].ToString();
                    gmb.Text = dr_data["gmb"].ToString();
                    x.Text = dr_data["twitter"].ToString();
                    web.Text = dr_data["website"].ToString();
                    yt.Text = dr_data["youtube"].ToString();
                    notes.Text = dr_data["notes"].ToString();
                    vision.Text = dr_data["vision"].ToString();
                    mision.Text = dr_data["mision"].ToString();
                    dblpackage.SelectedValue = dr_data["package"].ToString();
                    descp.Text = dr_data["business_model"].ToString();
                    address.Text = dr_data["address"].ToString();
                }
                dr_data.Close();
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
            int success = mst.Update_Client(Request.QueryString[0], name.Text, mobileno.Text, email.Text, dob.Text, bname.Text, eyear.Text, bmob.Text, omail.Text, address.Text, fb.Text, insta.Text, linkedin.Text, x.Text, gmb.Text, web.Text, yt.Text, notes.Text, vision.Text, mision.Text, dblpackage.SelectedValue.ToString(), descp.Text);

            if (success > 0)
            {

                //Response.Write("<script>alert('Client updated.');</script>");
                ShowMessage("Data has been updated.", MessageType.Success);
                Response.Redirect("manage-client.aspx");
                
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
            Response.Write("<script>alert('Select Package.');</script>");
        }
    }

}