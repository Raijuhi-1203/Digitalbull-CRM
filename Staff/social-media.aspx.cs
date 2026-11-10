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
        if (gmbreview.Text.Length > 0 && fbgshare.Text.Length > 0 && instagshare.Text.Length > 0 && ytgshare.Text.Length > 0 && fbfollower.Text.Length > 0 && instafollower.Text.Length > 0 && fbviews.Text.Length > 0 && instaviews.Text.Length > 0 && ytviews.Text.Length > 0 && ytsubscribe.Text.Length > 0 && fblike.Text.Length > 0 && instalike.Text.Length > 0 && ytlike.Text.Length > 0 && fbcmt.Text.Length > 0 && instacmt.Text.Length > 0 && ytcmt.Text.Length > 0)
        {
            int success = mst.Add_Social_Media(dblclient.SelectedItem.Text, fbviews.Text, instaviews.Text, ytviews.Text, ytsubscribe.Text, fblike.Text, instalike.Text, ytlike.Text, fbcmt.Text, instacmt.Text, ytcmt.Text, fbfollower.Text, instafollower.Text, ytgshare.Text, fbgshare.Text, instagshare.Text, gmbreview.Text, DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("HH:mm:ss"));

            if (success > 0)
            {
                ShowMessage("Data have been saved.", MessageType.Success);

                fbviews.Text = string.Empty;
                instaviews.Text = string.Empty;
                ytviews.Text = string.Empty;
                ytsubscribe.Text = string.Empty;
                fblike.Text = string.Empty;
                instalike.Text = string.Empty;
                ytlike.Text = string.Empty;
                fbcmt.Text = string.Empty;
                instacmt.Text = string.Empty;
                ytcmt.Text = string.Empty;
                fbfollower.Text = string.Empty;
                instafollower.Text = string.Empty;
                ytgshare.Text = string.Empty;
                fbgshare.Text = string.Empty;
                instagshare.Text = string.Empty;
                gmbreview.Text = string.Empty;
                dblclient.SelectedIndex = 0;
            }
        }
        else
        {
            ShowMessage("Data have been saved.", MessageType.Warning);
        }
    }
}