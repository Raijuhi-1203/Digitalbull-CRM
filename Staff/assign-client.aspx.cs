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

public partial class Admin_assign_client : System.Web.UI.Page
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
                BindData();
            }
        }
    }

    private void BindData()
    {
        rptbinddata.DataSource = GetData("SELECT * FROM assign_client where staff_id='" + Session["name"].ToString() +"'");
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
        if (e.CommandName == "View")
        {
            string itemId = e.CommandArgument.ToString();
            Response.Redirect("view-client.aspx?ref="+ itemId +"");
        }
        if (e.CommandName == "Accept")
        {
            int itemId = Convert.ToInt32(e.CommandArgument);

            int success = mst.Status_Change_Client(itemId.ToString(), e.CommandName.ToString());

            if (success > 0)
            {
                ShowMessage("Assign Client Accept.", MessageType.Success);
                //Response.Write("<script>alert('Assign Client Accept.');</script>");
                BindData();
            }

        }
        if (e.CommandName == "Decline")
        {
            int itemId = Convert.ToInt32(e.CommandArgument);

            int success = mst.Status_Change_Client(itemId.ToString(), e.CommandName.ToString());

            if (success > 0)
            {
                ShowMessage("Assign Client Decline.", MessageType.Success);
               // Response.Write("<script>alert('Assign Client Decline.');</script>");
                BindData();
            }

        }
    }

}