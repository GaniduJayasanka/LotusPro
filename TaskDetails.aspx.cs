using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class TaskDetails : System.Web.UI.Page
{
    SqlConnection conn;
    private const int StatusPending = 1;
    private const int StatusRejected = 4;


    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection();
        if (!IsPostBack)
        {
            if (Request.QueryString["TID"] != null)
            {
                lblTaskRef.Text = Request.QueryString["RefNo"];
                lblTID.Text = Request.QueryString["TID"];
                lblUserID.Text = Request.QueryString["UserID"];
                lblStatusID.Text = Request.QueryString["StatusID"];

               
                getTaskDetails();
                
            }
        }
    }

    public void getTaskDetails()
    {
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = new SqlCommand("exec sp_getTicketDetails '" + lblTID.Text + "'", conn);

        try
        {
            SqlDataReader dr1 = newCmd.ExecuteReader();
            while (dr1.Read())
            {
                if ((dr1["MainTask"].ToString()) != "")
                {
                    lblTaskRef.Text = dr1["Ref_No"].ToString();
                    lblMainTask.Text = dr1["MainTask"].ToString();
                    lblSubTask.Text = dr1["SubTask"].ToString();
                    lblSubject.Text = dr1["Subject"].ToString();
                    lblStatus.Text = dr1["Status"].ToString();
                    lblPriority.Text = dr1["Priority"].ToString();
                    lblTaskDescription.Text = dr1["TaskDescription"].ToString();
                    lblReqUser.Text = dr1["CreateUser"].ToString();
                    lblReqDate.Text = dr1["CreateDate"].ToString();
                }

            }
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            string msg = "Retreive Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            conn.Close();
        }
    }




  

}