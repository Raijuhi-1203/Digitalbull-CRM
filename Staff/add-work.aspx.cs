using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

public partial class Staff_add_work : System.Web.UI.Page
{
    public enum MessageType { Success,Error,Info,Warning }
    protected void ShowMessage(string Message, MessageType type)
    {
        string safeMessage = HttpUtility.JavaScriptStringEncode(Message);

        string script = "ShowMessage('" +safeMessage +"','" +type.ToString() +"');";

        ScriptManager.RegisterStartupScript(this,this.GetType(),"Toast_" + Guid.NewGuid().ToString(),script,true);
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
        String strQuery = "SELECT b.* FROM assign_client a left join client as b on a.client_id=b.business_name where a.staff_id='" + Session["name"].ToString() +"'";
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
            int success = mst.Add_Work(Session["name"].ToString(), dblclient.SelectedItem.Text, details.Text, wtime.Text, DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("HH:mm:ss"));

            if (success > 0)
            {
                ShowMessage("Data have been saved.", MessageType.Success);

                details.Text = string.Empty;
                wtime.Text = string.Empty;
                dblclient.SelectedIndex = 0;
            }
        }
        else
        {
            ShowMessage("Data have been saved.", MessageType.Warning);
        }
    }

}