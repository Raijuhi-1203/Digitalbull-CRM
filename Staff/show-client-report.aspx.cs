using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Staff_show_client_report : System.Web.UI.Page
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
                name.InnerText = Request.QueryString[0];
                BindData();
            }

        }
    }

    private void BindData()
    {
        rptbinddata.DataSource = GetData("SELECT MAX(a.client_name) AS client_name,MAX(a.create_date) AS create_date,MAX(b.fb) AS fb,MAX(b.insta) AS insta,MAX(b.yt) AS yt,MAX(b.gmb) AS gmb,MAX(b.linkedin) as linkedin,MAX(b.twitter) as twitter,SUM(TRY_CAST(a.fb_views AS BIGINT)) AS fb_views,SUM(TRY_CAST(a.insta_views AS BIGINT)) AS insta_views,SUM(TRY_CAST(a.yt_views AS BIGINT)) AS yt_views,SUM(TRY_CAST(a.yt_subscriber AS BIGINT)) AS yt_subscriber,SUM(TRY_CAST(a.fb_likes AS BIGINT)) AS fb_likes,SUM(TRY_CAST(a.insta_likes AS BIGINT)) AS insta_likes,SUM(TRY_CAST(a.yt_likes AS BIGINT)) AS yt_likes,SUM(TRY_CAST(a.fb_cmt AS BIGINT)) AS fb_cmt,SUM(TRY_CAST(a.insta_cmt AS BIGINT)) AS insta_cmt,SUM(TRY_CAST(a.yt_cmt AS BIGINT)) AS yt_cmt,SUM(TRY_CAST(a.fb_followers AS BIGINT)) AS fb_followers,SUM(TRY_CAST(a.insta_followers AS BIGINT)) AS insta_followers,SUM(TRY_CAST(a.fb_group_share AS BIGINT)) AS fb_group_share,SUM(TRY_CAST(a.insta_group_share AS BIGINT)) AS insta_group_share,SUM(TRY_CAST(a.yt_group_share AS BIGINT)) AS yt_group_share,SUM(TRY_CAST(a.gmb_review AS BIGINT)) AS gmb_review,DATENAME(MONTH, MAX(a.create_date)) AS month_name FROM social_media_marketing_report a left join social_media_marketing as b on a.client_name=b.client_name WHERE MONTH(a.create_date) = MONTH(GETDATE()) and a.client_name='" + Request.QueryString[0] + "' group by a.client_name");
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