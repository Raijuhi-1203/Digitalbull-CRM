using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_add_payment : System.Web.UI.Page
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
                BindClient();
                BindService();
            }

        }
    }

    private void BindClient()
    {
        dblclient.Items.Clear();
        dblclient.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        String strQuery = "SELECT * FROM client";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;

        try
        {
            con.Open();

            dblclient.DataSource = cmd.ExecuteReader();
            dblclient.DataTextField = "business_name";
            dblclient.DataValueField = "business_name";
            dblclient.DataBind();
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

    private void BindService()
    {
        dblservice.Items.Clear();
        dblservice.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        String strQuery = "SELECT * FROM services";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;

        try
        {
            con.Open();

            dblservice.DataSource = cmd.ExecuteReader();
            dblservice.DataTextField = "service_name";
            dblservice.DataValueField = "service_name";
            dblservice.DataBind();
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
        if (amount.Text.Length > 0)
        {
            int success = mst.Add_Payment(dblclient.SelectedItem.Text, dblservice.SelectedItem.Text, amount.Text);

            if (success > 0)
            {

                //Response.Write("<script>alert('PAyment Add.');</script>");
                ShowMessage("Data has been saved", MessageType.Success);
                amount.Text = string.Empty;
                dblclient.SelectedIndex = 0;
                dblservice.SelectedIndex = 0;

            }
        }
        else
        {
            ShowMessage("All * field are required.", MessageType.Warning);
            //Response.Write("<script>alert('All field are required.');</script>");
        }
    }

}