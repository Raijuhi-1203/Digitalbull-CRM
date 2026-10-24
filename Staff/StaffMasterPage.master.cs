using System;
using System.Data.SqlClient;

public partial class Staff_StaffMasterPage : System.Web.UI.MasterPage
{
    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        {
            Response.Redirect("login.aspx?expired=1", false);
            Context.ApplicationInstance.CompleteRequest();
            return;
        }
        if (!IsPostBack)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login.aspx?expired=1", false);
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
                        lcalender.Visible = true;
                        llcalender.Visible = true;
                        socialmedia.Visible = false;
                    }
                    else if (dr_data1["role"].ToString() == "Social Media Manager")
                    {
                        lcalender.Visible = true;
                        llcalender.Visible = true;
                        socialmedia.Visible = false;
                        socialmediareport.Visible = false;
                    }
                    else if (dr_data1["role"].ToString() == "Social Media Executive")
                    {
                        socialmedia.Visible = true;
                        socialmediareport.Visible = true;
                        lcalender.Visible = false;
                        llcalender.Visible = false;
                        ticket.Visible = false;
                    }
                    else
                    {
                        socialmedia.Visible = false;
                        socialmediareport.Visible = false;
                        lcalender.Visible = false;
                        llcalender.Visible = false;
                        ticket.Visible = false;
                    }
                    dr_data1.Close();
                }

                staff_name.InnerText = Session["name"].ToString();
                staff_name2.InnerText = Session["name"].ToString();
                staff_name3.InnerText = Session["name"].ToString();
            }
            
        }
    }

}
