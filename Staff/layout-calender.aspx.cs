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
            if (Session["name"] == null)
            {
                Response.Redirect("login.aspx");
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
        if (e.CommandName == "Progress")
        {
            string[] args = e.CommandArgument.ToString().Split('|');
            string id = args[0];
            string name = args[1];

            int success = mst.Status_Change_SocilaMedia_Work(id, "In progress", DateTime.Now.ToString("HH:mm:ss"));
            int success1 = mst.Add_Work(Session["name"].ToString(), name, name + " Create engaging branded content using posts, reels, videos, event creatives, and carousels.", "1.30 hrs", DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("HH:mm:ss"));

            if (success > 0)
            {
                ShowMessage("Data have been updated.", MessageType.Success);
                
                BindClient2();
            }
        }
        if (e.CommandName == "Schedule")
        {
            string[] args = e.CommandArgument.ToString().Split('|');
            string id = args[0];
            string name = args[1];
            int success = mst.Status_Change_SocilaMedia_Work(id, "Scheduled", DateTime.Now.ToString("HH:mm:ss"));
            int success1 = mst.Add_Work(Session["name"].ToString(), name, name + " Schedule.", "10 min", DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("HH:mm:ss"));

            if (success > 0)
            {
                ShowMessage("Data have been updated.", MessageType.Success);
                
                BindClient2();
            }
        }
        if (e.CommandName == "Done")
        {
            string id = e.CommandArgument.ToString();
            int success = mst.Status_Change_SocilaMedia_Work(id, "Done", DateTime.Now.ToString("HH:mm:ss"));

            if (success > 0)
            {
                ShowMessage("Data have been updated.", MessageType.Success);
                
                BindClient2();
            }
        }
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