using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Admin_view_payment : System.Web.UI.Page
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
                BindClient();
                BindService();

                SqlDataReader dr_data = mst.Select_Operation("select * from payment where id='" + Request.QueryString[0] + "'");
                if (dr_data.Read())
                {
                    amount.Text = dr_data["amount"].ToString();
                    dblclient.SelectedValue = dr_data["client_name"].ToString();
                    dblservice.SelectedValue = dr_data["service_name"].ToString();
                }
                dr_data.Close();

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
        int success = mst.Delete_Payment(Request.QueryString[0]);

        if (success > 0)
        {
            Response.Write("<script>alert('Payment deleted.');</script>");
            Response.Redirect("manage-client.aspx");
        }
    }


    protected void btnsaving_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("saving-print-receipt.aspx?ref="+ Request.QueryString[0] + "");
    }

    protected void btncurrent_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("current-print-receipt.aspx?ref="+ Request.QueryString[0] + "");
    }

}