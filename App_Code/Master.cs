using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Protocols.WSTrust;
using System.Net;
using System.Web.UI.WebControls;

public class Master
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    
    public Master()
    {
        
    }

    public void PopulateCheckbox(CheckBoxList chk, string value_field, string text_field, string query)
    {
        DataSet ds = new DataSet();
        string cmdstr = query;
        SqlDataAdapter adp = new SqlDataAdapter(cmdstr, con);
        adp.Fill(ds);
        chk.DataSource = ds;
        chk.DataTextField = text_field;
        chk.DataValueField = value_field;
        chk.DataBind();
        con.Close();
    }

    public DataTable GetData(string query)
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
                    cmd.Dispose();
                }
            }
            con.Close();
            return dt;
        }
    }

    public SqlDataReader Delete_Operation(string query)
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader = null;
        try
        {
            con.Close();
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (reader);
    }

    public SqlDataReader Status_Operation(string query)
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader = null;
        try
        {
            con.Close();
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (reader);
    }

    public int Count_data(string query)
    {
        con.Close();
        con.Open();
        int data = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            data = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (data);
    }

    public SqlDataReader Select_Operation(string query)
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader = null;
        try
        {
            con.Close();
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (reader);
    }

    public void BindDropDown(DropDownList dbl_list, string valueField, string textField, string query)
    {
        dbl_list.Items.Clear();
        dbl_list.Items.Add(new ListItem("Please Select", ""));
        dbl_list.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        String strQuery = query;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;

        try
        {
            con.Open();

            dbl_list.DataSource = cmd.ExecuteReader();
            dbl_list.DataTextField = textField;
            dbl_list.DataValueField = valueField;
            dbl_list.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    public void PopulateGridview(string query, GridView grd_list)
    {
        DataTable dtbl = new DataTable();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.Connection = con;
        SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
        //  cmd.Parameters.AddWithValue("@search", txt_search.Text.Trim());
        sqlDa.Fill(dtbl);
        if (dtbl.Rows.Count > 0)
        {
            grd_list.DataSource = dtbl;
            grd_list.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            grd_list.DataSource = dtbl;
            grd_list.DataBind();

            grd_list.Rows[0].Cells.Clear();
            grd_list.Rows[0].Cells.Add(new TableCell());
            grd_list.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            grd_list.Rows[0].Cells[0].Text = "No Data Found ..!";
            grd_list.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }

        con.Close();

    }

    public void Bind_Checkbox(CheckBoxList chklist, string valueField, string textField, string query)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter adp = new SqlDataAdapter(query, con);
        adp.Fill(ds);
        chklist.DataSource = ds;
        chklist.DataTextField = textField;
        chklist.DataValueField = valueField;
        chklist.DataBind();
        con.Close();
    }

    public int Add_Staff(string name, string email, string mobileno, string role, string father_name, string mother_name, string alternate_contact_number, string address)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into staff(name,email,mobileno,role,father_name,mother_name,alternate_contact_number,address,create_date,create_time) values (@name,@email,@mobileno,@role,@father_name,@mother_name,@alternate_contact_number,@address,@create_date,@create_time) ";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@mobileno", mobileno);
            cmd.Parameters.AddWithValue("@role", role);
            cmd.Parameters.AddWithValue("@father_name", father_name);
            cmd.Parameters.AddWithValue("@mother_name", mother_name);
            cmd.Parameters.AddWithValue("@alternate_contact_number", alternate_contact_number);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@create_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@create_time", DateTime.Now.ToString("HH:mm:ss"));

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }
    
    public int Update_Staff(string id,string name, string email, string mobileno, string role, string father_name, string mother_name, string alternate_contact_number, string address)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update staff set name=@name,email=@email,mobileno=@mobileno,role=@role,father_name=@father_name,mother_name=@mother_name,alternate_contact_number=@alternate_contact_number,address=@address where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@mobileno", mobileno);
            cmd.Parameters.AddWithValue("@role", role);
            cmd.Parameters.AddWithValue("@father_name", father_name);
            cmd.Parameters.AddWithValue("@mother_name", mother_name);
            cmd.Parameters.AddWithValue("@alternate_contact_number", alternate_contact_number);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@id", id);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Delete_Staff(string id)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from staff where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Package(string name, string price, string details)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into package(name,price,details) values (@name,@price,@details)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@details", details);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Delete_Package(string id)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from package where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Client(string name, string mobileno, string email, string dob, string business_name, string establish, string business_contact_number, string official_mail, string address,string facebook,string instagram,string linkedin, string twitter, string gmb,string website,string youtube,string notes,string vision,string mision,string package,string business_model)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into client(c_status,name,mobileno,email,dob,business_name,establish,business_contact_number,official_mail,address,facebook,instagram,linkedin,twitter,gmb,website,youtube,notes,vision,mision,package,business_model,create_date,create_time) values (@c_status,@name,@mobileno,@email,@dob,@business_name,@establish,@business_contact_number,@official_mail,@address,@facebook,@instagram,@linkedin,@twitter,@gmb,@website,@youtube,@notes,@vision,@mision,@package,@business_model,@create_date,@create_time)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@c_status", "Active");
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@mobileno", mobileno);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@business_name", business_name);
            cmd.Parameters.AddWithValue("@establish", establish);
            cmd.Parameters.AddWithValue("@business_contact_number", business_contact_number);
            cmd.Parameters.AddWithValue("@official_mail", official_mail);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@facebook", facebook);
            cmd.Parameters.AddWithValue("@instagram", instagram);
            cmd.Parameters.AddWithValue("@linkedin", linkedin);
            cmd.Parameters.AddWithValue("@twitter", twitter);
            cmd.Parameters.AddWithValue("@gmb", gmb);
            cmd.Parameters.AddWithValue("@website", website);
            cmd.Parameters.AddWithValue("@youtube", youtube);
            cmd.Parameters.AddWithValue("@notes", notes);
            cmd.Parameters.AddWithValue("@vision", vision);
            cmd.Parameters.AddWithValue("@mision", mision);
            cmd.Parameters.AddWithValue("@package", package);
            cmd.Parameters.AddWithValue("@business_model", business_model);
            cmd.Parameters.AddWithValue("@create_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@create_time", DateTime.Now.ToString("HH:mm:ss"));

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Update_Client(string id,string name, string mobileno, string email, string dob, string business_name, string establish, string business_contact_number, string official_mail, string address,string facebook,string instagram,string linkedin, string twitter, string gmb,string website,string youtube,string notes,string vision,string mision,string package,string business_model)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update client set name=@name,mobileno=@mobileno,email=@email,dob=@dob,business_name=@business_name,establish=@establish,business_contact_number=@business_contact_number,official_mail=@official_mail,address=@address,facebook=@facebook,instagram=@instagram,linkedin=@linkedin,twitter=@twitter,gmb=@gmb,website=@website,youtube=@youtube,notes=@notes,vision=@vision,mision=@mision,package=@package,business_model=@business_model,create_date=@create_date,create_time=@create_time where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@mobileno", mobileno);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@business_name", business_name);
            cmd.Parameters.AddWithValue("@establish", establish);
            cmd.Parameters.AddWithValue("@business_contact_number", business_contact_number);
            cmd.Parameters.AddWithValue("@official_mail", official_mail);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@facebook", facebook);
            cmd.Parameters.AddWithValue("@instagram", instagram);
            cmd.Parameters.AddWithValue("@linkedin", linkedin);
            cmd.Parameters.AddWithValue("@twitter", twitter);
            cmd.Parameters.AddWithValue("@gmb", gmb);
            cmd.Parameters.AddWithValue("@website", website);
            cmd.Parameters.AddWithValue("@youtube", youtube);
            cmd.Parameters.AddWithValue("@notes", notes);
            cmd.Parameters.AddWithValue("@vision", vision);
            cmd.Parameters.AddWithValue("@mision", mision);
            cmd.Parameters.AddWithValue("@package", package);
            cmd.Parameters.AddWithValue("@business_model", business_model);
            cmd.Parameters.AddWithValue("@create_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@create_time", DateTime.Now.ToString("HH:mm:ss"));

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Delete_Client(string id)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from client where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Status_Change(string id,string status)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update client set c_status=@c_status where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@c_status", status);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Assign_Client(string staff_id, string client_id)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into assign_client (staff_id,client_id,statuss) values (@staff_id,@client_id,@statuss)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@staff_id", staff_id);
            cmd.Parameters.AddWithValue("@client_id", client_id);
            cmd.Parameters.AddWithValue("@statuss", "Pending");

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Delete_Assign_Client(string id)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from assign_client where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Assign_Work(string staff_id, string client_id, string work_details,string work_type)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into assign_work (work_type,staff_id,client_id,work_details,create_date,create_time) values (@work_type,@staff_id,@client_id,@work_details,@create_date,@create_time)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@staff_id", staff_id);
            cmd.Parameters.AddWithValue("@client_id", client_id);
            cmd.Parameters.AddWithValue("@work_details", work_details);
            cmd.Parameters.AddWithValue("@work_type", work_type);
            cmd.Parameters.AddWithValue("@create_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@create_time", DateTime.Now.ToString("HH:mm:ss"));

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Delete_Assign_Work(string id)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from assign_work where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Work(string staff_id, string client_id, string work_details, string working_time, string create_date, string create_time)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into add_staff_work (staff_id,client_id,work_details,working_time,create_date,create_time) values (@staff_id,@client_id,@work_details,@working_time,@create_date,@create_time)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@staff_id", staff_id);
            cmd.Parameters.AddWithValue("@client_id", client_id);
            cmd.Parameters.AddWithValue("@work_details", work_details);
            cmd.Parameters.AddWithValue("@working_time", working_time);
            cmd.Parameters.AddWithValue("@create_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@create_time", DateTime.Now.ToString("HH:mm:ss"));

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Edit_Work(string id, string client_id, string work_details, string working_time)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update add_staff_work set client_id=@client_id,work_details=@work_details,working_time=@working_time where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@client_id", client_id);
            cmd.Parameters.AddWithValue("@work_details", work_details);
            cmd.Parameters.AddWithValue("@working_time", working_time);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Status_Change_Client(string id, string status)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update assign_client set statuss=@statuss where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@statuss", status);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }
    
    public int Status_Change_Work(string id, string status)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update assign_work set statuss=@statuss where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@statuss", status);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_End_Attendance(string staff_name)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update attendance_log set end_date=@end_date,end_time=@end_time where staff_name=@staff_name and create_date=@create_date";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@staff_name", staff_name);
            cmd.Parameters.AddWithValue("@create_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@end_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@end_time", DateTime.Now.ToString("HH:mm:ss"));

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Attendance(string staff_name)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into attendance_log (staff_name,create_date,create_time) values (@staff_name,@create_date,@create_time)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@staff_name", staff_name);
            cmd.Parameters.AddWithValue("@create_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@create_time", DateTime.Now.ToString("HH:mm:ss"));

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Service(string service_name)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into services (service_name) values (@service_name)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@service_name", service_name);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Delete_Service(string id)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from services where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Payment(string client_name, string service_name, string amount)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into payment (client_name,service_name,amount,create_date,create_time) values (@client_name,@service_name,@amount,@create_date,@create_time)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@client_name", client_name);
            cmd.Parameters.AddWithValue("@service_name", service_name);
            cmd.Parameters.AddWithValue("@amount", amount);
            cmd.Parameters.AddWithValue("@create_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@create_time", DateTime.Now.ToString("HH:mm:ss"));

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Delete_Payment(string id)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from payment where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }


    public int Status_Change_SocilaMedia_Work(string id, string post_status,string create_time)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update layout_calender set post_status=@post_status,create_time=@create_time where id=@id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@post_status", post_status);
            cmd.Parameters.AddWithValue("@create_time", create_time);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Ticket_Reply(string ticket_id, string ticket_reply)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update client_ticket set ticket_reply=@ticket_reply,ticket_status=@ticket_status where ticket_id=@ticket_id";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@ticket_id", ticket_id);
            cmd.Parameters.AddWithValue("@ticket_reply", ticket_reply);
            cmd.Parameters.AddWithValue("@ticket_status", "Closed");

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }

    public int Add_Social_Media(string client_name, string views2, string subscribe2, string likes2, string cmt2, string followers2, string group_share2, string review2, string create_date, string create_time)
    {
        con.Close();
        con.Open();
        int RowsAffected = 0;
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into social_media_marketing_report (client_name,views2,subscribe2,likes2,cmt2,followers2,group_share2,review2,create_date,create_time) values (@client_name,@views2,@subscribe2,@likes2,@cmt2,@followers2,@group_share2,@review2,@create_date,@create_time)";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@client_name", client_name);
            cmd.Parameters.AddWithValue("@views2", views2);
            cmd.Parameters.AddWithValue("@subscribe2", subscribe2);
            cmd.Parameters.AddWithValue("@likes2", likes2);
            cmd.Parameters.AddWithValue("@cmt2", cmt2);
            cmd.Parameters.AddWithValue("@followers2", followers2);
            cmd.Parameters.AddWithValue("@group_share2", group_share2);
            cmd.Parameters.AddWithValue("@review2", review2);
            cmd.Parameters.AddWithValue("@create_date", create_date);
            cmd.Parameters.AddWithValue("@create_time", create_time);

            RowsAffected = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        return (RowsAffected);
    }


}