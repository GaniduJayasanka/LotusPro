using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TaskCreate : System.Web.UI.Page
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
    static string url = "TaskCreate.aspx";
    static int formid = 2;
    static int userId = 0;


    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection();


        if (!Page.IsPostBack)
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


            GVTaskCreate.DataSource = GVBind();
            GVTaskCreate.DataBind();
            DDLStatus.SelectedValue = "1";
            DDLStatus.Enabled = false;

            // Bind the MainTaskList dropdown
            BindmainTaskList();
            BindDepartment();

            //// Generate the reference number and display it on the web page
            //string referenceNumber = GenerateReferenceNumber();
            //lblFormattedRefno.Text = referenceNumber;

            //// Display today's date as the CreateDate in the web form
            // lblFormattedCreateDate.Text = DateTime.Today.ToString("yyyy-MM-dd");

            BasicDatePicker.SelectedDate = DateTime.Today;
            BasicDatePicker.Enabled = false;

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


    private DataTable GVBind()
    {
        DataTable dtGridView = new DataTable();

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }       

        using (SqlCommand cmd = new SqlCommand("[HelpDesk].[dbo].[get_CreatedTask] '"+DDLMainTask.SelectedValue+ "','" + DDLSubTask.SelectedValue + "','"+txtSubject.Text+"'", conn))
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
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

    protected void BindDepartment()
    {
        SqlCommand cmd = new SqlCommand("Exec sp_getalldepartments");
        cmd.Connection = conn;

        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        DataTable dt = new DataTable();
        cmd.CommandTimeout = 5000;
        dt.Load(cmd.ExecuteReader());
        conn.Close();

        DDlDepartment.DataSource = dt;
        DDlDepartment.DataTextField = "Name";
        DDlDepartment.DataValueField = "DepartmentId";
        DDlDepartment.DataBind();
        DDlDepartment.Items.Insert(0, new ListItem(String.Empty, String.Empty));
    }

    protected void BindsubTaskList(int MTID)
    {
        SqlCommand cmd = new SqlCommand("Exec sp_getSubTaskList '"+MTID+"'  ");
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



    //protected void DDLStatus_SelectedIndexChanged(object sender, EventArgs e)
    //{
        
    //   // UpdateStatusText();
    //}



    //Create Task

    private void InsertCreateTask(int MTID, int STID, string Subject, string TaskDescription, int Status, int Priority, DateTime Request_Completion, int CreateUser, DateTime CreateDate, int Ref_No)
    {
        conn = DB_Connect.GetConnection();
        using (SqlCommand cmd = new SqlCommand("[HelpDesk].[dbo].[sp_TaskCreate]", conn))
        {
            
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MTID", SqlDbType.Int).Value = int.Parse(DDLMainTask.SelectedValue);
            cmd.Parameters.Add("@STID", SqlDbType.Int).Value = DDLSubTask.SelectedValue;
            cmd.Parameters.Add("@Subject", SqlDbType.VarChar).Value = txtSubject.Text;
            cmd.Parameters.Add("@TaskDescription", SqlDbType.VarChar).Value = TextBox1.Text;
            cmd.Parameters.Add("@Status", SqlDbType.Int).Value = int.Parse(DDLStatus.SelectedValue);
            cmd.Parameters.Add("@Priority", SqlDbType.Int).Value = int.Parse(DDLPriority.SelectedValue);
            cmd.Parameters.Add("@RequestCompletion", SqlDbType.DateTime).Value = CompletedDate.SelectedValue;
            cmd.Parameters.Add("@CreateUser", SqlDbType.Int).Value = int.Parse(lblUserID.Text);
            cmd.Parameters.Add("@DeptID", SqlDbType.Int).Value = DDlDepartment.SelectedValue;


            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }
            try
            {
                cmd.CommandTimeout = 6000000;
                cmd.ExecuteNonQuery();
                WebMsgBox.Show("Successfully Saved !");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

                BindmainTaskList();
                GVTaskCreate.DataSource = GVBind();
                GVTaskCreate.DataBind();

                DDLMainTask.SelectedValue = "";
                DDLSubTask.SelectedValue = "";
                txtSubject.Text = "";
                //DDLStatus.SelectedValue = "";
                DDLPriority.SelectedValue = "";
                TextBox1.Text = "";               
                CompletedDate.SelectedValue = "";
               
            }

        }
    }




    protected void SaveBtn_Click(object sender, EventArgs e)
    {
        if (DDLMainTask.SelectedValue == "0")
        {
            WebMsgBox.Show("Please select Main Task");
            return;
        }
        if (DDLSubTask.SelectedValue == "0")
        {
            WebMsgBox.Show("Please fill Sub Task");
            return;
        }
        if (txtSubject.Text == "")
        {
            WebMsgBox.Show("Please fill Subject");
            return;
        }
        if (TextBox1.Text == "0")
        {
            WebMsgBox.Show("Please fill Task Description");
            return;
        }
        if (DDLStatus.SelectedValue == "0")
        {
            WebMsgBox.Show("Please fill Status");
            return;
        }
        if(DDLPriority.SelectedValue == "0")
        {
            WebMsgBox.Show("Please fill Priority");
            return;
        }
        if (DDlDepartment.SelectedValue == "0")
        {
            WebMsgBox.Show("Please fill Department");
            return;
        }
        if (CompletedDate.Text == "0")
        {
            WebMsgBox.Show("Please fill Complete Date");
            return;
        }

        // Check if the selected date is a back date
        if (CompletedDate.SelectedDate < DateTime.Today)
        {
            WebMsgBox.Show("Please select a valid date in the future for the completion date.");
            return;
        }



        SaveBtn.Enabled = true;
        InsertCreateTask(MTID, STID, Subject, TaskDescription, Status, Priority, Request_Completion, CreateUser, CreateDate, Ref_No);

        DDLStatus.SelectedIndex = 0;
        DDLPriority.SelectedIndex = 0;

        // Re-disable BasicDatePicker after the task is saved
        BasicDatePicker.Enabled = false;
    }


    //Get Created Task Details for Search Created Tasks
    private DataTable SearchCreatedTask(string mainTaskID, string subTaskID, string subject, DateTime requestCompletion)
    {
        DataTable dtSearchResults = new DataTable();

        using (SqlConnection conn = DB_Connect.GetConnection())
        {
            conn.Open();

            using (SqlCommand cmd = new SqlCommand("get_CreatedTask", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Option", 0); // Assuming 0 for the option to get all columns

                // Pass the filter parameters to the stored procedure
                cmd.Parameters.AddWithValue("@MainTaskID", mainTaskID);
                cmd.Parameters.AddWithValue("@SubTaskID", subTaskID);
                cmd.Parameters.AddWithValue("@Subject", subject);
                cmd.Parameters.AddWithValue("@RequestCompletion", requestCompletion);

                cmd.CommandTimeout = 180;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dtSearchResults);
            }
        }

        return dtSearchResults;
    }


    protected void FindBtn_Click(object sender, EventArgs e)
    {
        GVTaskCreate.DataSource = GVBind();
        GVTaskCreate.DataBind();
        //DataTable dtSearchResults = SearchCreatedTask(DDLMainTask.SelectedValue, DDLSubTask.SelectedValue, txtSubject.Text, BasicDatePicker.SelectedDate);

        //GVTaskCreate.DataSource = dtSearchResults;
        //GVTaskCreate.DataBind();
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

    protected void ResetBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void LinkBtnRef_No_Click(object sender, EventArgs e)
    {
        LinkButton btnView = (LinkButton)sender;
        GridViewRow grdRow = (GridViewRow)btnView.NamingContainer;


        Label TID = (Label)grdRow.FindControl("TID");
        Label RefNo = (Label)grdRow.FindControl("RefNo");
        Label StatusID = (Label)grdRow.FindControl("StatusID");
        //  Response.Redirect("BuyerInvVsDispatch.aspx?Buyer=" + BuyerName.Text + "&fromDate=" + DatePickerFromDate.Text + "&ToDate=" + DatePickerToDate.Text + "&BuyerID=" + BuyerID.Text + "&Orderno=" + lblOrderNo.Text + "&Status=" + drpdwnStatus.SelectedValue);
        Response.Write("<script>");
        Response.Write(String.Format("window.open('{0}','_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,resizable=yes,width=950px,height=650px')", ResolveUrl("TaskDetails.aspx?TID=" + TID.Text + "&RefNo=" + RefNo.Text + "&StatusID=" + StatusID.Text + "&UserID=" + lblUserID.Text)));
        Response.Write("</script>");
    }
}