using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ToDoList : System.Web.UI.Page
{
    SqlConnection conn;
    static int formid = 4;
    static int userId = 0;
    static string url = "ToDoList.aspx";

    protected void Page_Load(object sender, EventArgs e)
    {

        conn = DB_Connect.GetConnection();

        if (!IsPostBack)
        {
            userId = Convert.ToInt32(Request.QueryString["UserID"]);
            if (userId == 0)
            {
                Server.Transfer("~/Login_Common.aspx?url=" + url + "", true);
            }

            if (Session["UserID"].ToString() == null || userId == null)
            {
                Server.Transfer("~/Login_Common.aspx?url=" + url + "", true);
            }
            else
            {
                if (!User_Check.Check(Convert.ToInt32(Session["UserID"].ToString()), formid))
                {
                    WebMsgBox.Show("Sorry! you do not have enough privilages to perform this action.");
                    Server.Transfer("~/helpdesk.aspx", true);
                }
            }

            lblUserID.Text = userId.ToString();
            GetUser(userId);
            LoadToDoList(Convert.ToInt32(lblUserID.Text));
            
        }
    }

    public void GetUser(int id)
    {
        SqlConnection conn = DB_Connect.GetConnection();
        conn.Open();

        string sql = " SELECT [UserName],[Email] ,[Password]"
                   + "   FROM [LotusPro].[dbo].[SystemUsers] "
                   + " WHERE [UserID] = " + id + " ";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {

            lblUser.Text = dr["UserName"].ToString();


        };

        conn.Close();
    }
    private DataTable GVBind(int taskID)
    {
        DataTable dtGridView = new DataTable();

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("[HelpDesk].[dbo].[GetUpdatedTaskDetails]", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TaskID", taskID); // Use the provided taskID
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
    }


    private void LoadToDoList(int userId)
    {
        try
        {
            using (SqlConnection connection = DB_Connect.GetConnection())
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("GetInProgressTasksByUserID", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserId", userId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        gvToDoList.DataSource = dt;
                        gvToDoList.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }



    }




    protected void gvToDoList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ImageButton btnStart = (ImageButton)e.Row.FindControl("btnStart");
            ImageButton btnComplete = (ImageButton)e.Row.FindControl("btnComplete");
            Label StatusID = (Label)e.Row.FindControl("StatusID");

            if (StatusID.Text == "2")
            {
                btnStart.Enabled = true;
                btnComplete.Enabled = false;

            }
            else if (StatusID.Text == "3")
            {
                btnStart.Enabled = false;
                btnComplete.Enabled = true;
            }
            else
            {
                btnStart.Enabled = false;
                btnComplete.Enabled = false;
            }
        }
    }




    protected void btnStart_Click(object sender, ImageClickEventArgs e)
    {   
        ImageButton btnStart = (ImageButton)sender;
        GridViewRow row = (GridViewRow)btnStart.NamingContainer;

        int taskID = Convert.ToInt32(gvToDoList.DataKeys[row.RowIndex].Value);
        using (SqlCommand cmd = new SqlCommand("", conn))
        {
            cmd.CommandText = "exec HelpDesk.dbo.sp_UpdateTaskCreate '3'  ," + taskID + "";

            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();

            conn.Close();
        }
        WebMsgBox.Show("Successfully Approved !");
        LoadToDoList(Convert.ToInt32(lblUserID.Text));

    }


    protected void btnComplete_Click(object sender, ImageClickEventArgs e)
    {        
        ImageButton btnComplete = (ImageButton)sender;
        GridViewRow row = (GridViewRow)btnComplete.NamingContainer;
        int taskID = Convert.ToInt32(gvToDoList.DataKeys[row.RowIndex].Value);
        using (SqlCommand cmd = new SqlCommand("", conn))
        {
            cmd.CommandText = "exec HelpDesk.dbo.sp_UpdateTaskCreate '4'  ," + taskID + "";
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        WebMsgBox.Show("Successfully Completed !");
        LoadToDoList(Convert.ToInt32(lblUserID.Text));

    }



    private string GetTaskStatus(int taskID)
    {
        string status = string.Empty;

        try
        {
            using (SqlConnection connection = DB_Connect.GetConnection())
            {
                connection.Open();

                string selectQuery = "SELECT Status FROM TaskCreate WHERE TID = @TID";
                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@TID", taskID);

                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        status = result.ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error retrieving task status: " + ex.ToString());
        }

        return status;
    }





    protected void LinkBtnRef_No_Click(object sender, EventArgs e)
    {
        LinkButton link = (LinkButton)sender;
        GridViewRow row = (GridViewRow)link.NamingContainer;

        Label TID = row.FindControl("lblToDoListTID") as Label;
        LinkButton RefNo = row.FindControl("LinkBtnRef_No") as LinkButton;
        Label StatusID = row.FindControl("StatusID") as Label;

        Response.Write("<script>");
        Response.Write(String.Format("window.open('{0}','_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,resizable=yes,width=950px,height=650px')", ResolveUrl("TaskDetails.aspx?TID=" + TID.Text + "&RefNo=" + RefNo.Text + "&StatusID=" + StatusID.Text + "&UserID=" + lblUserID.Text)));
        Response.Write("</script>");
    }
}
