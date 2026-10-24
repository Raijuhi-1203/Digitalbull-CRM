using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_social_media : System.Web.UI.Page
{
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
            if (Session["admin_name"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }
            else
            {
                BindData();
            }

        }
    }

    private void BindData()
    {
        rptbinddata.DataSource = GetData("SELECT MAX(a.client_name) AS client_name,MAX(a.create_date) AS create_date,MAX(b.fb) AS fb,MAX(b.insta) AS insta,MAX(b.yt) AS yt,MAX(b.gmb) AS gmb,MAX(b.linkedin) as linkedin,MAX(b.twitter) as twitter,SUM(TRY_CAST(a.views2 AS BIGINT)) AS views2,SUM(TRY_CAST(a.subscribe2 AS BIGINT)) AS subscribe2,SUM(TRY_CAST(a.likes2 AS BIGINT)) AS likes2,SUM(TRY_CAST(a.cmt2 AS BIGINT)) AS cmt2,SUM(TRY_CAST(a.followers2 AS BIGINT)) AS followers2,SUM(TRY_CAST(a.group_share2 AS BIGINT)) AS group_share2,SUM(TRY_CAST(a.review2 AS BIGINT)) AS review2,DATENAME(MONTH, MAX(a.create_date)) AS month_name FROM social_media_marketing_report a left join social_media_marketing as b on a.client_name=b.client_name WHERE MONTH(a.create_date) = MONTH(GETDATE())");
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

    }

}