using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TKTDetailNVoid : System.Web.UI.Page
{
    SqlConnection conn;
    static int formid = 7;
    static int userId = 0;
    static string url = "TKTDetailNVoid.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection1();

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
                Server.Transfer("~/TKTHome.aspx", true);
            }
        }
    }

    public void GetTicketDetail()
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        string sql = " exec VM.[lotusTest].sp_GetBarcodeDetails '" + txtTicketNo.Text + "' ";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {
            lblTicketCategory.Text = dr["ProjectName"].ToString();
            lblTktType.Text = dr["TicketType"].ToString();
            //lblNoOfTickets.Text = dr["NoOfTickets"].ToString();
            //lblBillDateNTime.Text = dr["BillDateNTime"].ToString();
            //lblBilledUser.Text = dr["UserName"].ToString();
            //lblBillAmount.Text = dr["TotBillAmount"].ToString();
            //txtTktNo.Text = txtTicketNo.Text;


           

        }

        conn.Close();
    }

    public void GetBillHeaderDetail()
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        string sql = " exec [VM].[lotusTest].sp_GetTicketDetailHistory '" + txtTicketNo.Text+ "' ";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {
            lblBillID.Text = dr["BillId"].ToString();
            lblBillNo.Text = dr["BillNo"].ToString();
            lblNoOfTickets.Text = dr["NoOfTickets"].ToString();
            lblBillDateNTime.Text = dr["BillDateNTime"].ToString();
            lblBilledUser.Text = dr["UserName"].ToString();
            lblBillAmount.Text = dr["TotBillAmount"].ToString();
            txtTktNo.Text = txtTicketNo.Text;

        }
        dr.Close();
        conn.Close();
    }

    public void ClearLables()
    {

        lblBillID.Text = "";
            lblBillNo.Text = "";
        lblNoOfTickets.Text = "";
        lblBillDateNTime.Text = "";
        lblBilledUser.Text = "";
        lblBillAmount.Text = "";
        txtTktNo.Text = "";
        lblTicketCategory.Text = "";
        lblTktType.Text = "";

        DataTable ds = new DataTable();
        ds = null;
        GVBillDetail.DataSource = ds;
        GVBillDetail.DataBind();

        DataTable dst = new DataTable();
        dst = null;
        GVTktUsageHistory.DataSource = dst;
        GVTktUsageHistory.DataBind();

    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        BtnVoid.Enabled = true;
        ClearLables();

        GetBillHeaderDetail();
        GetTicketDetail();

        GVTktUsageHistory.DataSource = GVBind();
        GVTktUsageHistory.DataBind();

        GVBillDetail.DataSource = GVBillDetailBind();
        GVBillDetail.DataBind();

        if (GVTktUsageHistory.Rows.Count > 0)
        {
            BtnVoid.Enabled = false;
        }
        if (GVBillDetail.Rows.Count == 0)
        {
            BtnVoid.Enabled = false;
        }
    }


    protected void BbtnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    private DataTable GVBind()
    {
        DataTable dtGridView = new DataTable();

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("exec  VM.[lotusTest].[SP_GetTicketUsageHistory] '"+txtTicketNo.Text+"'", conn))
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
    }

    private DataTable GVBillDetailBind()
    {
        DataTable dtGridView = new DataTable();

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("SELECT TicketNo ,Amount   FROM [VM].[lotusTest].BillDetail WHERE BillID='"+lblBillID.Text+"' ", conn))
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
    }

    private void ExecuteInsert()
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        string sql = "Exec VM.[lotusTest].[sp_VoidATicket] '" + txtTicketNo.Text + "','" + lblBillID.Text + "','" + txtVoidReason.Text + "','" + lblUserID.Text + "'";

        try
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            string msg = "Insert Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            conn.Close();
        }
    }
    protected void BtnVoid_Click(object sender, EventArgs e)
    {
        ExecuteInsert();
    }
}