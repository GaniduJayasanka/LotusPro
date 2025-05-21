using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TaskCategory : System.Web.UI.Page
{
    SqlConnection conn;
    private string MainTask;
    private string SubTask;
    static string url = "TaskCategory.aspx";
    static int formid = 1;
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

            GVTask.DataSource = GVBind();
            GVTask.DataBind();

            // Bind the MainTask dropdown
            BindMainTask();
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

    public DataTable GVBind()
    {
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }

        DataTable dtGridView = new DataTable();
        SqlCommand cmd = new SqlCommand("[HelpDesk].[dbo].[sp_load_MainTask] '"+DDLmainTask.SelectedValue+"'", conn);
        cmd.CommandTimeout = 180;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dtGridView);

        if (dtGridView.Rows.Count == 0)
        {
            return dtGridView;
        }

        conn.Close();
        return dtGridView;
    }




    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (txtmainTask.Text == "")
        {
            WebMsgBox.Show("Please fill Main Task !");
            return;
        }

        MainTask = lblmaintask.Text;
        InsertMainTask(MainTask);
        BtnSave.Enabled = true;
    }


    private void InsertMainTask(string mainTask)
    {
        conn = DB_Connect.GetConnection();
        using (SqlCommand cmd = new SqlCommand("[HelpDesk].[dbo].[sp_Insert_MainTask]", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MainTask", SqlDbType.VarChar).Value = txtmainTask.Text;

            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
                txtmainTask.Text = "";

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

            }

        }
    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }


   


    private void GetMainTask()
    {
        //conn = DB_Connect.GetConnection();
        //using (SqlCommand cmd = new SqlCommand("[HelpDesk].[dbo].[]", conn))
    }


    //Insert Sub Task


   protected void BindMainTask()
    {
        SqlCommand cmd = new SqlCommand("Exec sp_getMainTask");
        cmd.Connection = conn;

        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        DataTable dt = new DataTable();
        cmd.CommandTimeout = 5000;
        dt.Load(cmd.ExecuteReader());
        conn.Close();

        DDLmainTask.DataSource = dt;
        DDLmainTask.DataTextField = "MainTask";
        DDLmainTask.DataValueField = "MTID";
        DDLmainTask.DataBind();
        DDLmainTask.Items.Insert(0, new ListItem(String.Empty, String.Empty));
    }

    private void InsertSubTask(string subTask)
    {
        conn = DB_Connect.GetConnection();
        using (SqlCommand cmd = new SqlCommand("[HelpDesk].[dbo].[sp_InsertSubTask]", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MTID", SqlDbType.Int).Value = DDLmainTask.SelectedValue;
            cmd.Parameters.Add("@SubTask", SqlDbType.VarChar).Value = txtSubTask.Text;
           

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
                BindMainTask();
                GVTask.DataSource = GVBind();
                GVTask.DataBind();

                txtSubTask.Text = "";
            }

        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
      
        if (DDLmainTask.SelectedValue == "0")
        {
            WebMsgBox.Show("Please select Main Task");
            return;
        }
        if (txtSubTask.Text == "")
        {
            WebMsgBox.Show("Please fill Sub Task");
            return;
        }

        BtnSave.Enabled = true;
        InsertSubTask(SubTask);

    }

    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void ButtonFind_Click(object sender, EventArgs e)
    {
        GVTask.DataSource = GVBind();
        GVTask.DataBind();
    }
}
