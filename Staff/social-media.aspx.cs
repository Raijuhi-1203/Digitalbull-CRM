using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff_social_media : System.Web.UI.Page
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
        if (review.Text.Length > 0 && gshare.Text.Length > 0 && follower.Text.Length > 0 && views.Text.Length > 0 && subscribe.Text.Length > 0 && like.Text.Length > 0 && cmt.Text.Length > 0)
        {
            int success = mst.Add_Social_Media(dblclient.SelectedItem.Text, views.Text, subscribe.Text, like.Text, cmt.Text, follower.Text, gshare.Text, review.Text, DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("HH:mm:ss"));

            if (success > 0)
            {
                ShowMessage("Data have been saved.", MessageType.Success);

                views.Text = string.Empty;
                subscribe.Text = string.Empty;
                like.Text = string.Empty;
                subscribe.Text = string.Empty;
                cmt.Text = string.Empty;
                follower.Text = string.Empty;
                gshare.Text = string.Empty;
                review.Text = string.Empty;
                dblclient.SelectedIndex = 0;
            }
        }
        else
        {
            ShowMessage("Data have been saved.", MessageType.Warning);
        }
    }
}