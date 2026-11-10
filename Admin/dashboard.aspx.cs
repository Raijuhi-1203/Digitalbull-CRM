using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_dashboard : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    public enum MessageType { Success, Error, Info, Warning }
    protected void ShowMessage(string Message, MessageType type)
    {
        string safeMessage = HttpUtility.JavaScriptStringEncode(Message);

        string script = "ShowMessage('" + safeMessage + "','" + type.ToString() + "');";

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Toast_" + Guid.NewGuid().ToString(), script, true);
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
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
            if (Session["admin_name"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }
            else
            {
                BindData();
                BindData2();
                BindData3();
                BindLowViewsClients();
                BindClient4();
            }
            
        }
    }

    private void BindClient4()
    {
        rptPendingWork.DataSource = GetData("SELECT lc.* FROM layout_calender lc INNER JOIN client c ON lc.client_name = c.business_name WHERE CAST(lc.post_date AS DATE) = CAST(GETDATE() AS DATE) AND  c.c_status = 'Active'");       
        rptPendingWork.DataBind();
    }

    private void BindData()
    {
        rptbinddata.DataSource = GetData("SELECT * FROM assign_work where create_date='"+ DateTime.Now.ToString("yyyy-MM-dd") +"'");
        rptbinddata.DataBind();
    }
    private void BindData2()
    {
        Repeater1.DataSource = GetData("SELECT * FROM client where c_status='Active'");
        Repeater1.DataBind();
    }
    private void BindData3()
    {
        staffreapeter.DataSource = GetData("SELECT * FROM staff");
        staffreapeter.DataBind();
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

    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void staffreapeter_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }


    private void BindLowViewsClients()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
            SELECT
                MAX(a.client_name) AS client_name,
                MAX(b.fb) AS fb,
                MAX(b.insta) AS insta,
                MAX(b.yt) AS yt,
                MAX(b.gmb) AS gmb,
                SUM(ISNULL(TRY_CONVERT(BIGINT, a.fb_views), 0))
                    AS total_views
            FROM social_media_marketing_report a left join social_media_marketing as b on a.client_name=b.client_name
            WHERE a.create_date >= DATEFROMPARTS(
                    YEAR(GETDATE()), MONTH(GETDATE()), 1)
              AND a.create_date < DATEADD(
                    MONTH, 1,
                    DATEFROMPARTS(
                        YEAR(GETDATE()), MONTH(GETDATE()), 1))
            GROUP BY a.client_name
            HAVING SUM(ISNULL(
                TRY_CONVERT(BIGINT, a.fb_views), 0)) < @MinViews
            ORDER BY total_views ASC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@MinViews", SqlDbType.BigInt).Value = 1000;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptLowViews.DataSource = dt;
                    rptLowViews.DataBind();
                }
            }
        }
    }

    protected void rptPendingWork_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        if (e.CommandName == "Progress")
        {
            // Update status to In Progress
        }
        else if (e.CommandName == "Schedule")
        {
            // Open scheduling process
        }
        else if (e.CommandName == "Done")
        {
            // Update status to Done
        }
    }

}