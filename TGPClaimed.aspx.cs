using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TGPClaimed : System.Web.UI.Page
{
    SqlConnection conn;
    static int formid = 7;
    static int userId = 0;
    static string url = "TGPClaimed.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection1();
        if (!IsPostBack) // VERY IMPORTANT!!
        {
            BindClaimedTimeFrameDropdown();
        }
    }

    private void BindClaimedTimeFrameDropdown()
    {
        
            string query = @"SELECT [TGCid], 
                                (CONVERT(varchar(10), [ClaimRangeFrom], 120) + ' To ' + 
                                 CONVERT(varchar(10), [ClaimRangeTo], 120)) AS ClaimRange
                         FROM [VM].[dbo].[TourGuideClaim]";

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            da.Fill(dt);

                DDLClaimedTimeFrame.DataSource = dt;
                DDLClaimedTimeFrame.DataTextField = "ClaimRange";  // Display this
                DDLClaimedTimeFrame.DataValueField = "TGCid";       // Save this
                DDLClaimedTimeFrame.DataBind();

                // Optional: Insert default item
                DDLClaimedTimeFrame.Items.Insert(0, new ListItem("-- Select Claim Range --", "0"));
            }
            catch (Exception ex)
            {
                // Handle errors here (logging, displaying, etc.)
                throw new ApplicationException("Error binding dropdown list.", ex);
            }
            finally
            {
                conn.Close();
            }
        }


    private void BindTourGuideClaimedReport(int TGCid)
    {

        using (SqlCommand cmd = new SqlCommand("sp_TourGuideClaimedReport", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TGCid", TGCid);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                da.Fill(dt);

                GVClaimedReport.DataSource = dt;
                GVClaimedReport.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the error appropriately
                throw new ApplicationException("Error binding GridView from stored procedure.", ex);
            }
            finally
            {
                conn.Close();
            }
        }
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        if (DDLClaimedTimeFrame.SelectedValue != "0")
        {
            BindTourGuideClaimedReport(Convert.ToInt32(DDLClaimedTimeFrame.SelectedValue));
        }
        else
        {
            WebMsgBox.Show("Please select Time Frame !");
            return;
        }
    }

    protected void BbtnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void ButtonExport_Click(object sender, EventArgs e)
    {
        GVClaimedReport.ShowHeader = true;
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=TourGuide_PointClaim.xls");
        Response.Charset = "";
        Response.ContentType = "MSP/vnd.ms-excel";

        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //gvTicketSale.HeaderRow.BackColor = Color.White;
            //foreach (TableCell cell in gvDeliveriesExporttoExcel.HeaderRow.Cells)
            //{
            //    cell.BackColor = gvDeliveriesExporttoExcel.HeaderStyle.BackColor;
            //}
            foreach (GridViewRow row in GVClaimedReport.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GVClaimedReport.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GVClaimedReport.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }
            GVClaimedReport.RenderControl(hw);

            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();


        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }


    int totalTickets = 0;
    decimal totalAmountClaimed = 0;
    protected void GVClaimedReport_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Sum NoOfTickets
            Label lblTickets = (Label)e.Row.FindControl("NoOfTickets");
            if (lblTickets != null && !string.IsNullOrEmpty(lblTickets.Text))
            {
                totalTickets += Convert.ToInt32(lblTickets.Text);
            }

            // Sum AmountClaimed
            Label lblAmount = (Label)e.Row.FindControl("AmountClaimed");
            if (lblAmount != null && !string.IsNullOrEmpty(lblAmount.Text))
            {
                totalAmountClaimed += Convert.ToDecimal(lblAmount.Text);
            }
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            // Show totals in footer
            Label lblTotalTickets = (Label)e.Row.FindControl("lblTotalTickets");
            Label lblTotalClaimedAmount = (Label)e.Row.FindControl("lblTotalClaimedAmount");

            if (lblTotalTickets != null)
            {
                lblTotalTickets.Text = totalTickets.ToString("N0"); // no decimal places
            }
            if (lblTotalClaimedAmount != null)
            {
                lblTotalClaimedAmount.Text = totalAmountClaimed.ToString("N2"); // 2 decimal places
            }
        }
    }
}