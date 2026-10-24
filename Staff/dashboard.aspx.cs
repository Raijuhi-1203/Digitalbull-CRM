using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_dashboard : System.Web.UI.Page
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
        if (Session["name"] == null)
        {
            Response.Redirect("~/Staff/login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
            return;
        }

        if (!IsPostBack)
        {
            if (Session["ToastMessage"] != null)
            {
                string message = Session["ToastMessage"].ToString();
                string type = Session["ToastType"].ToString();

                ShowMessage(message, MessageType.Success);

                Session.Remove("ToastMessage");
                Session.Remove("ToastType");
            }

            if (Session["name"] == null)
            {
                Response.Redirect("~/Staff/login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            else
            {
                SqlDataReader dr_data1 = mst.Select_Operation("select role from staff where name='" + Session["name"].ToString() + "'");
                if (dr_data1.Read())
                {
                    if (dr_data1["role"].ToString() == "Manager")
                    {
                        pending_work.Visible = true;
                        today_work.Visible = true;
                    }
                    else if (dr_data1["role"].ToString() == "Social Media Manager")
                    {
                        pending_work.Visible = true;
                        today_work.Visible = true;
                    }
                    else
                    {
                        pending_work.Visible = false;
                        today_work.Visible = false;
                    }
                    dr_data1.Close();
                }

                SqlDataReader dr_data = mst.Select_Operation("SELECT count(*) as num FROM assign_client where staff_id='" + Session["name"].ToString() + "'");
                if (dr_data.Read())
                {
                    total.InnerText = "Total Assign Client = " + dr_data["num"].ToString();
                    dr_data.Close();
                }

                dt.InnerText = DateTime.Now.ToString("dd MMM yyyy");
                BindData();
                BindData2();
                BindClient();
                BindClient2();
            }
        }
    }

    private void BindClient()
    {
       // Repeater2.DataSource = GetData("SELECT * FROM layout_calender where post_date='"+DateTime.Now.ToString("yyyy-MM-dd")+"'");
        Repeater2.DataSource = GetData("SELECT lc.* FROM layout_calender lc INNER JOIN client c ON lc.client_name = c.business_name WHERE CAST(lc.post_date AS DATE) = CAST(GETDATE() AS DATE) AND  c.c_status = 'Active'");
        // rptStaff.DataSource = GetData("SELECT * FROM layout_calender where staff_id='" + Session["name"].ToString() +"'");
        Repeater2.DataBind();
    }

    private void BindClient2()
    {
        Repeater3.DataSource = GetData("SELECT lc.* FROM layout_calender lc INNER JOIN client c ON lc.client_name = c.business_name WHERE lc.post_date >= DATEADD(day, -30, CAST(GETDATE() AS DATE)) AND lc.post_date < CAST(GETDATE() AS DATE) and (lc.post_status='Pending' or lc.post_status='In progress' or lc.post_status='Scheduled') AND  c.c_status = 'Active'");
       // Repeater3.DataSource = GetData("SELECT * FROM layout_calender WHERE post_date >= DATEADD(day, -30, CAST(GETDATE() AS DATE)) AND post_date < CAST(GETDATE() AS DATE) and (post_status='Pending' or post_status='In progress' or post_status='Scheduled')");
        Repeater3.DataBind();
    }

    private void BindData()
    {
        rptbinddata.DataSource = GetData("SELECT * FROM assign_work where staff_id='" + Session["name"].ToString() + "' and create_date='"+ DateTime.Now.ToString("yyyy-MM-dd")+"'");
        rptbinddata.DataBind();
    }
    
    private void BindData2()
    {
        Repeater1.DataSource = GetData("SELECT a.* FROM client a left join assign_client as b on a.business_name=b.client_id where b.staff_id='" + Session["name"].ToString() +"'");
        Repeater1.DataBind();
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
        if (Session["name"] == null)
        {
            Response.Redirect("~/Staff/login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
            return;
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                BindData();
                BindData2();
                BindClient();
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
                BindData();
                BindData2();
                BindClient();
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
                BindData();
                BindData2();
                BindClient();
                BindClient2();
            }
        }
    }

    protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (Session["name"] == null)
        {
            Response.Redirect("~/Staff/login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
            return;
        }
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
                BindData();
                BindData2();
                BindClient();
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
                BindData();
                BindData2();
                BindClient();
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
                BindData();
                BindData2();
                BindClient();
                BindClient2();
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