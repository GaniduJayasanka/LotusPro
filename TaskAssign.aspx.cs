using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TaskAssign : System.Web.UI.Page
{
    SqlConnection conn;

    private int TID;
    private int MTID;
    private int STID;
    private string Subject;
    private string TaskDescription;
    private int Status;
    private int Priority;
    private DateTime Request_Completion;
    private int CreateUser;
    private DateTime CreateDate;
    private int Ref_No;
    static int formid = 3;
    static int userId = 0;
    static string url = "TaskAssign.aspx";

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection();

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

        string Status = "Open";
        ClientScript.RegisterStartupScript(this.GetType(), "statusValue", "var statusValue = '" + Status + "';", true);

        GVLoadCreatedTask.DataSource = GVBind(Convert.ToInt32(lblUserID.Text));
        GVLoadCreatedTask.DataBind();
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
    private DataTable GVBind(int UserID)
    {
        DataTable dtGridView = new DataTable();

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("exec [load_CreatedTask] '"+ UserID + "','"+txtTaskRefNo.Text+"'", conn))
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }       

        conn.Close();
        return dtGridView;
    }



    //public DataTable SearchTask(string selectedStatus)
    //{
    //    int statusId;
    //    bool isAllSelected = false;

    //    if (!int.TryParse(selectedStatus, out statusId))
    //    {
    //        // Check if "All" is selected
    //        if (selectedStatus == "0")
    //        {
    //            isAllSelected = true;
    //        }
    //        else
    //        {
    //            return new DataTable();
    //        }
    //    }

    //    DataTable dataTable = new DataTable();

    //    using (SqlConnection connection = DB_Connect.GetConnection())
    //    {
    //        connection.Open();

    //        using (SqlCommand command = new SqlCommand("sp_SearchTask", connection))
    //        {
    //            command.CommandType = CommandType.StoredProcedure;

    //            // Handle the "All" case (when isAllSelected is true)
    //            if (isAllSelected)
    //            {
    //                // Don't filter by status when "All" is selected
    //                command.CommandText = "SELECT * FROM TaskCreate";
    //            }
    //            else
    //            {
    //                // Filter by the selected status
    //                command.Parameters.Add(new SqlParameter("@Status", statusId));
    //            }

    //            SqlDataAdapter adapter = new SqlDataAdapter(command);
    //            adapter.Fill(dataTable);
    //        }
    //    }

    //    return dataTable;
    //}


    protected void btnFind_Click(object sender, EventArgs e)
    {

        GVLoadCreatedTask.DataSource = GVBind(Convert.ToInt32(lblUserID.Text));
        GVLoadCreatedTask.DataBind();
        //string selectedStatusValue = DDLSearch.SelectedValue;
        //TaskAssign taskAssign = new TaskAssign();
        //DataTable taskCreate = taskAssign.SearchTask(selectedStatusValue);
        //GVLoadCreatedTask.DataSource = taskCreate;
        //GVLoadCreatedTask.DataBind();

    }


    public DataTable GetTaskDetailsByTID(int taskID)
    {
        DataTable dataTable = new DataTable();
        using (SqlConnection connection = DB_Connect.GetConnection())
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand("get_TaskDetailsById", connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@TID", taskID));
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataTable);
            }
        }

        return dataTable;
    }


    protected void btnView_Click(object sender, EventArgs e)
    {
        Button btnView = (Button)sender;
        GridViewRow grdRow = (GridViewRow)btnView.NamingContainer;

       
        Label TID = (Label)grdRow.FindControl("TID");
        Label RefNo = (Label)grdRow.FindControl("RefNo");
        Label StatusID = (Label)grdRow.FindControl("StatusID");
        //  Response.Redirect("BuyerInvVsDispatch.aspx?Buyer=" + BuyerName.Text + "&fromDate=" + DatePickerFromDate.Text + "&ToDate=" + DatePickerToDate.Text + "&BuyerID=" + BuyerID.Text + "&Orderno=" + lblOrderNo.Text + "&Status=" + drpdwnStatus.SelectedValue);
        Response.Write("<script>");
        Response.Write(String.Format("window.open('{0}','_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,resizable=yes,width=950px,height=650px')", ResolveUrl("ViewTaskDetails.aspx?TID=" + TID.Text+ "&RefNo=" + RefNo.Text + "&StatusID=" + StatusID.Text + "&UserID=" + lblUserID.Text)));
        Response.Write("</script>");
    }

    protected void BbtnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}