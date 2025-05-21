using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompletedTasks : System.Web.UI.Page
{
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection();
        if (!IsPostBack)
        {
            int userId = GetLoggedInUserId(); // Get the logged-in user's ID
            BindmainTaskList();
            LoadCompletedTasks(4);
        }
    }

    protected void BindmainTaskList()
    {
        SqlCommand cmd = new SqlCommand("Exec sp_getMainTaskList");
        cmd.Connection = conn;

        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        DataTable dt = new DataTable();
        cmd.CommandTimeout = 5000;
        dt.Load(cmd.ExecuteReader());
        conn.Close();

        DDLMainTask.DataSource = dt;
        DDLMainTask.DataTextField = "MainTask";
        DDLMainTask.DataValueField = "MTID";
        DDLMainTask.DataBind();
        DDLMainTask.Items.Insert(0, new ListItem(String.Empty, String.Empty));
    }

    protected void BindsubTaskList(int MTID)
    {
        SqlCommand cmd = new SqlCommand("Exec sp_getSubTaskList '" + MTID + "'  ");
        cmd.Connection = conn;

        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        DataTable dt = new DataTable();
        cmd.CommandTimeout = 5000;
        dt.Load(cmd.ExecuteReader());
        conn.Close();

        DDLSubTask.DataSource = dt;
        DDLSubTask.DataTextField = "SubTask";
        DDLSubTask.DataValueField = "STID";
        DDLSubTask.DataBind();
        DDLSubTask.Items.Insert(0, new ListItem(String.Empty, String.Empty));
    }

    private int GetLoggedInUserId()
    {
        // Retrieve the logged-in user's ID from the session or other storage mechanism
        return Convert.ToInt32(Session["UserId"]);
    }


    //Get Completed task using relevant UserId.
    /// /////////////////////////////////////////////////////////////////////
    /// 
    private DataTable GVBind(int taskID)
    {
        DataTable dtGridView = new DataTable();

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("[HelpDesk].[dbo].[GetCompletedTasksByUserId]", conn))
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


    /// ///////////////////////////////////////////////////////////////////////////////////////////
    



    private void LoadCompletedTasks(int userId)
    {
        try
        {
            using (SqlConnection connection = DB_Connect.GetConnection())
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("FindAllTask", connection)) // Modify this query
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MTID", DDLMainTask.SelectedValue);
                    command.Parameters.AddWithValue("@STID", DDLSubTask.SelectedValue);
                    command.Parameters.AddWithValue("@status", DDLSearch.SelectedValue);
                    command.Parameters.AddWithValue("@TaskRef_No", txtTaskRefNo.Text);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        gvCompletedTasks.DataSource = dt;
                        gvCompletedTasks.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }
    }


    protected void gvCompletedTasks_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ViewDetails")
        {
            int taskID = Convert.ToInt32(e.CommandArgument);
            // Redirect to the task details page with the selected task ID
            Response.Redirect("ViewTaskDetails.aspx?TaskID=" + taskID);
        }
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

    protected void btnFind_Click(object sender, EventArgs e)
    {
        LoadCompletedTasks(4);
    }

    protected void BbtnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void ButtonExport_Click(object sender, EventArgs e)
    {

    }

    protected void DDLMainTask_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLMainTask.SelectedValue != "")
        {
            int MTID = Convert.ToInt32(DDLMainTask.SelectedValue);
            BindsubTaskList(MTID);
        }
        else
        {
            BindsubTaskList(0);
        }
    }

    protected void gvCompletedTasks_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                string StatusID = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "StatusID"));
            string RequestCompletion = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "RequestCompletion"));
            int x = Int32.Parse(StatusID);

            DateTime currentDate = DateTime.Now;
            Label dateLabel = e.Row.FindControl("RequestCompletion") as Label;
            DateTime templateDate;
            if (DateTime.TryParse(dateLabel.Text, out templateDate))
            {
                // Compare the current date with the template date
                int comparisonResult = DateTime.Compare(currentDate, templateDate);



                if (x == 2 ) 
                {
                    if (comparisonResult > 0)
                            {
                        e.Row.BackColor = Color.FromName("#ff8080");
                    }
                }
                if (x == 3)
                {
                    e.Row.BackColor = Color.FromName("#80ffaa");
                }
                if (x == 4)
                {
                    e.Row.BackColor = Color.FromName("#fceec0");
                }
            }

        }
        }
}