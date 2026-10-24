using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_assign_work : System.Web.UI.Page
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
                BindStaff();
                BindData();
            }
            
        }
    }

    private void BindStaff()
    {
        dblstaff.Items.Clear();
        dblstaff.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        String strQuery = "SELECT * FROM staff";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;

        try
        {
            con.Open();

            dblstaff.DataSource = cmd.ExecuteReader();
            dblstaff.DataTextField = "name";
            dblstaff.DataValueField = "name";
            dblstaff.DataBind();
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

    private void BindClient()
    {
        dblclient.Items.Clear();
        dblclient.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        String strQuery = "SELECT * FROM client where c_status='Active'";
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
        int success = mst.Add_Assign_Work(dblstaff.SelectedValue.ToString(), dblclient.SelectedValue.ToString(),details.Text, dblwork.SelectedItem.Text);

        if (success > 0)
        {
            ShowMessage("Data has been assigned.", MessageType.Success);
            //Response.Write("<script>alert('Work Assign.');</script>");
            BindData();
            dblstaff.SelectedIndex = 0;
            dblclient.SelectedIndex = 0;
            dblwork.SelectedIndex = 0;
            details.Text = string.Empty;

        }
    }

    private void BindData()
    {
        rptbinddata.DataSource = GetData("SELECT * FROM assign_work");
        rptbinddata.DataBind();
    }

    private DataTable GetData(string query)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }

    protected void rptbinddata_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int itemId = Convert.ToInt32(e.CommandArgument);

            int success = mst.Delete_Assign_Work(itemId.ToString());

            if (success > 0)
            {
                ShowMessage("Data has been deleted.", MessageType.Success);
                Response.Write("<script>alert('Assign Client Deleted.');</script>");
                BindData();
            }

        }
    }

}