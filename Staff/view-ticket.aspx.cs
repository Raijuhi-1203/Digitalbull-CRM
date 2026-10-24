using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff_view_ticket : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };

    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
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
                SqlDataReader dr_data = mst.Select_Operation("select * from client_ticket where ticket_id='" + Request.QueryString[0] + "'");
                if (dr_data.Read())
                {
                    ticket_id.Text = dr_data["ticket_id"].ToString();
                    dblproblem.SelectedValue = dr_data["ticket_type"].ToString();
                    subject.Text = dr_data["ticket_title"].ToString();
                    descp.Text = dr_data["ticket_message"].ToString();
                    reply.Text = dr_data["ticket_reply"].ToString();
                }
                dr_data.Close();
            }

        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (reply.Text.Length > 0)
        {
            int success = mst.Ticket_Reply(Request.QueryString[0], reply.Text);

            if (success > 0)
            {
                ShowMessage("Data have been saved.", MessageType.Success);
                Response.Redirect("client-ticket.aspx");
               
            }
        }
        else
        {
            ShowMessage("Data have been saved.", MessageType.Warning);
        }
    }


}