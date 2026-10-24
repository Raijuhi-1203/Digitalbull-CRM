using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Staff_edit_work : System.Web.UI.Page
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
            if (Session["name"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                BindCategory();
                SqlDataReader dr_data = mst.Select_Operation("select * from add_staff_work where id='" + Request.QueryString[0] + "'");
                if (dr_data.Read())
                {
                    details.Text = dr_data["work_details"].ToString();
                    wtime.Text = dr_data["working_time"].ToString();
                    dblclient.SelectedValue = dr_data["client_id"].ToString();
                }
                dr_data.Close();
            }
            
        }
    }

    private void BindCategory()
    {
        dblclient.Items.Clear();
        dblclient.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        String strQuery = "SELECT b.* FROM assign_client a left join client as b on a.client_id=b.business_name where a.staff_id='" + Session["name"].ToString() + "'";
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

    protected void btnsend_ServerClick(object sender, EventArgs e)
    {
        if (details.Text.Length > 0 && wtime.Text.Length > 0)
        {
            int success = mst.Edit_Work(Request.QueryString[0], dblclient.SelectedItem.Text, details.Text, wtime.Text);

            if (success > 0)
            {
                ShowMessage("Data has been updated.", MessageType.Success);
                Response.Redirect("manage-add-work.aspx");
            }
        }
        else
        {
            ShowMessage("All * field are required.", MessageType.Warning);
            
        }
    }

}