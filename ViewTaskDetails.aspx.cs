using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ViewTaskDetails : System.Web.UI.Page
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

                if (lblStatusID.Text == "1")
                {
                    BtnApprove.Enabled = true;
                    BtnDisapprove.Enabled = true;
                }
                else
                {
                    BtnApprove.Enabled = false;
                    BtnDisapprove.Enabled = false;
                }
                // lblTID.Text = "11";
                getTaskDetails();
                BindUserList();
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



   
    protected void BindUserList()
    {
        SqlCommand cmd = new SqlCommand("Exec LotusPro.dbo.sp_UserList");
        cmd.Connection = conn;

        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        DataTable dt = new DataTable();
        cmd.CommandTimeout = 5000;
        dt.Load(cmd.ExecuteReader());
        conn.Close();

        DDLUser.DataSource = dt;
        DDLUser.DataTextField = "UserName";
        DDLUser.DataValueField = "UserId";
        DDLUser.DataBind();
        DDLUser.Items.Insert(0, new ListItem(String.Empty, String.Empty));
    }
     

    protected void BtnApprove_Click(object sender, EventArgs e)
    {
        using (SqlCommand cmd = new SqlCommand("", conn))
        {
            cmd.CommandText = "exec HelpDesk.dbo.sp_InsertTaskAssign'" + lblTID.Text + "'  ," + DDLUser.SelectedValue + ","+ lblUserID.Text + "";

            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();

            conn.Close();
        }       
            WebMsgBox.Show("Successfully Approved !");

        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);

    }

    protected void BtnDisapprove_Click(object sender, EventArgs e)
    {
        using (SqlCommand cmd = new SqlCommand("", conn))
        {
            cmd.CommandText = "exec HelpDesk.dbo.sp_InsertTaskRejection'" + lblTID.Text + "'  ,0," + lblUserID.Text + "";

            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();

            conn.Close();
        }
        WebMsgBox.Show("Successfully Disapproved !");

        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
    }
}