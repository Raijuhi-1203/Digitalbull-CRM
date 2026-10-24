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
        rptbinddata.DataSource = GetData("SELECT * FROM assign_work  where staff_id='" + Session["name"].ToString() +"' order by id desc");
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
        if (e.CommandName == "Accept")
        {
            int itemId = Convert.ToInt32(e.CommandArgument);

            int success = mst.Status_Change_Work(itemId.ToString(), e.CommandName.ToString());

            if (success > 0)
            {
                ShowMessage("Assign Work Accept.", MessageType.Success);
                //Response.Write("<script>alert('Assign Work Accept.');</script>");
                BindData();
            }

        }
        if (e.CommandName == "Decline")
        {
            int itemId = Convert.ToInt32(e.CommandArgument);

            int success = mst.Status_Change_Work(itemId.ToString(), e.CommandName.ToString());

            if (success > 0)
            {
                ShowMessage("Assign Work Accept.", MessageType.Success);
               // Response.Write("<script>alert('Assign Work Accept.');</script>");
                BindData();
            }

        }
        if (e.CommandName == "Progress")
        {
            int itemId = Convert.ToInt32(e.CommandArgument);

            int success = mst.Status_Change_Work(itemId.ToString(), e.CommandName.ToString());

            if (success > 0)
            {
                ShowMessage("Assign Work in Progress.", MessageType.Success);
                //Response.Write("<script>alert('Assign Work in Progress.');</script>");
                BindData();
            }

        }
        if (e.CommandName == "Done")
        {
            int itemId = Convert.ToInt32(e.CommandArgument);

            int success = mst.Status_Change_Work(itemId.ToString(), e.CommandName.ToString());

            if (success > 0)
            {
                ShowMessage("Assign Work Done.", MessageType.Success);
                //Response.Write("<script>alert('Assign Work Done.');</script>");
                BindData();
            }

        }
    }

}