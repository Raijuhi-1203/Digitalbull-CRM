using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Admin_view_client : System.Web.UI.Page
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
        int success = mst.Delete_Client(Request.QueryString[0]);

        if (success > 0)
        {
            Response.Write("<script>alert('Client deleted.');</script>");
            Response.Redirect("manage-client.aspx");
        }
    }

    protected void btndisable_ServerClick(object sender, EventArgs e)
    {
        int success = mst.Status_Change(Request.QueryString[0],"Inactive");

        if (success > 0)
        {
            Response.Write("<script>alert('Client disabled.');</script>");
            Response.Redirect("manage-client.aspx");
        }
    }

    protected void btnenable_ServerClick(object sender, EventArgs e)
    {
        int success = mst.Status_Change(Request.QueryString[0], "Active");

        if (success > 0)
        {
            Response.Write("<script>alert('Client enabled.');</script>");
            Response.Redirect("manage-client.aspx");
        }
    }

    protected void btnqutation_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("print-receipt.aspx?ref=" + Request.QueryString[0] +"");
    }

    protected void btnsaving_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("saving-print-receipt.aspx?ref=" + Request.QueryString[0] + "");
    }

    protected void btncurrent_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("current-print-receipt.aspx?ref=" + Request.QueryString[0] + "");
    }

}