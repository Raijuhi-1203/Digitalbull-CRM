using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_staff_summary : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
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
                SqlDataReader dr_data = mst.Select_Operation("select * from staff where name='" + Request.QueryString[0] + "'");
                if (dr_data.Read())
                {
                    name.InnerText = dr_data["name"].ToString();
                    role.InnerText = "Team Member • " + dr_data["role"].ToString();
                    

                }
                dr_data.Close();

                BindData();
            }
        }
    }

    private void BindData()
    {
        rptbinddata.DataSource = GetData("SELECT * FROM add_staff_work where staff_id='" + Request.QueryString[0] + "'");
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

    protected void dt_TextChanged(object sender, EventArgs e)
    {
        rptbinddata.DataSource = GetData("SELECT * FROM add_staff_work where staff_id='" + Request.QueryString[0] + "' and create_date='"+ dt.Text +"'");
        rptbinddata.DataBind();
    }

}