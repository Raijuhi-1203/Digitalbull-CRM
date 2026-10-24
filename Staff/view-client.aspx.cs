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

public partial class Admin_view_client : System.Web.UI.Page
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
            
            SqlDataReader dr_data = mst.Select_Operation("select * from client where business_name='" + Request.QueryString[0] + "'");
            if (dr_data.Read())
            {
                
                bname.Text = dr_data["business_name"].ToString();
                eyear.Text = dr_data["establish"].ToString();
                bmob.Text = dr_data["business_contact_number"].ToString();
                omail.Text = dr_data["official_mail"].ToString();
                fb.Text = dr_data["facebook"].ToString();
                insta.Text = dr_data["instagram"].ToString();
                linkedin.Text = dr_data["linkedin"].ToString();
                gmb.Text = dr_data["gmb"].ToString();
                x.Text = dr_data["twitter"].ToString();
                web.Text = dr_data["website"].ToString();
                yt.Text = dr_data["youtube"].ToString();
                notes.Text = dr_data["notes"].ToString();
                vision.Text = dr_data["vision"].ToString();
                mision.Text = dr_data["mision"].ToString();
                dblpackage.Text = dr_data["package"].ToString();
                descp.Text = dr_data["business_model"].ToString();
                address.Text = dr_data["address"].ToString();
            }
            dr_data.Close();
        }

    }

}