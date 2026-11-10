using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff_layout_calender : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

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
                dt.Text = DateTime.Now.ToString("dd MMM yyyy");
                BindClient2();
            }
        }
    }

    private void BindClient2()
    {
        //Repeater3.DataSource = GetData("SELECT * FROM layout_calender WHERE post_date = CAST(GETDATE() AS DATE)");
        Repeater3.DataSource = GetData("SELECT lc.* FROM layout_calender lc INNER JOIN client c ON lc.client_name = c.business_name WHERE CAST(lc.post_date AS DATE) = CAST(GETDATE() AS DATE) AND  c.c_status = 'Active'");
        // rptStaff.DataSource = GetData("SELECT * FROM layout_calender where staff_id='" + Session["name"].ToString() +"'");
        Repeater3.DataBind();
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

    protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        
    }

    protected void dt_TextChanged(object sender, EventArgs e)
    {
        string selectedDate = dt.Text.Trim();

        if (!string.IsNullOrEmpty(selectedDate))
        {
            DateTime dateValue;

            if (DateTime.TryParse(selectedDate, out dateValue))
            {
                string formattedDate = dateValue.ToString("yyyy-MM-dd");

                Repeater3.DataSource = GetData("SELECT lc.* FROM layout_calender lc INNER JOIN client c ON lc.client_name = c.business_name WHERE CAST(lc.post_date AS DATE) = '"+ formattedDate +"' AND  c.c_status = 'Active'");
                // Repeater3.DataSource = GetData("SELECT * FROM layout_calender WHERE post_date = '"+ formattedDate +"'");
                Repeater3.DataBind();

            }
        }
    }

    protected string GetStatusClass(string status)
    {
        switch (status.ToLower())
        {
            case "pending":
                return "pill pending";

            case "in progress":
                return "pill inprogress";

            case "done":
                return "pill done";

            case "scheduled":
                return "pill schedule";

            default:
                return "pill default";
        }
    }

    protected string GetStatusIcon(string status)
    {
        switch (status.ToLower())
        {
            case "pending":
                return "⏳";

            case "in progress":
                return "▶";

            case "done":
                return "✓";

            case "scheduled":
                return "◷";

            default:
                return "✦";
        }
    }

}