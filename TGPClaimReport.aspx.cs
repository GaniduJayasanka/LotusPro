using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TGPClaimnReport : System.Web.UI.Page
{
    //string connectionString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;

    SqlConnection conn;
    static string url = "TGPClaimnReport.aspx";
    static int formid = 8;
    static int userId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection1();

        if (!IsPostBack && Session["LoggedInUserName"] != null)
        {
            lblUser.Text = Session["LoggedInUserName"].ToString();
        }
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtFromDate.Text) || string.IsNullOrWhiteSpace(txtToDate.Text))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMissingDates",
                "alert('⚠️ Please select both From Date and To Date.');", true);
            gvTGPReport.DataSource = null;
            gvTGPReport.DataBind();
            return;
        }

        DateTime fromDate = DateTime.Parse(txtFromDate.Text);
        DateTime toDate = DateTime.Parse(txtToDate.Text);

        if (fromDate > toDate)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertInvalidRange",
                "alert('🚫 From Date cannot be after To Date.');", true);
            gvTGPReport.DataSource = null;
            gvTGPReport.DataBind();
            return;
        }

        DataTable dt = GetTourGuidePointsReport(fromDate, toDate);
        gvTGPReport.DataSource = dt;
        gvTGPReport.DataBind();

        // ✅ Store in session for export
        Session["TGPData"] = dt;

        if (dt.Rows.Count == 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertNoData",
                "alert('📭 No data found for the selected date range.');", true);
        }
    }



    private DataTable GetTourGuidePointsReport(DateTime fromDate, DateTime toDate)
    {
        string query = "EXEC GetTourGuidePointsReport @FromDate, @ToDate";

       
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@FromDate", fromDate.Date);
                cmd.Parameters.AddWithValue("@ToDate", toDate.Date);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
        
    }

    protected void btnExportTGExcel_Click(object sender, EventArgs e)
    {
        DataTable dt = Session["TGPData"] as DataTable;

        if (dt == null || dt.Rows.Count == 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertNoExportData",
                "alert('📂 No data available to export. Please view the report first.');", true);
            return;
        }

        GridView exportGrid = new GridView();
        exportGrid.AutoGenerateColumns = false;

        foreach (DataControlField col in gvTGPReport.Columns)
        {
            if (col is BoundField)
            {
                BoundField bfOriginal = (BoundField)col;

                BoundField bf = new BoundField
                {
                    DataField = bfOriginal.DataField,
                    HeaderText = bfOriginal.HeaderText
                };

                if (bf.DataField == "NICNo" || bf.DataField == "AccountNo")
                {
                    bf.ItemStyle.CssClass = "textmode";
                }

                exportGrid.Columns.Add(bf);
            }
        }


        exportGrid.DataSource = dt;
        exportGrid.DataBind();

        exportGrid.HeaderStyle.BackColor = System.Drawing.Color.Black;
        exportGrid.HeaderStyle.ForeColor = System.Drawing.Color.White;
        exportGrid.HeaderStyle.Font.Bold = true;

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=TourGuidePointsClaimReport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";

        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            string style = @"<style>
                            .textmode { mso-number-format:'\@'; }
                            .report-header { text-align:center; font-weight:bold; font-size:32px; color:#1a237e; }
                            .sub-header { text-align:center; font-size:28px; font-weight:bold; color:#424242; }
                         </style>";
            Response.Write(style);

            string fromDate = txtFromDate.Text.Trim();
            string toDate = txtToDate.Text.Trim();

            sw.WriteLine("<table style='width:100%;'>");
            sw.WriteLine("<tr><td colspan='10' class='report-header'>Tour Guide Points Report</td>");
            sw.WriteLine(string.Format("<td colspan='3' style='text-align:right; font-weight:bold;'>From: {0} <br /> To: {1}</td></tr>", fromDate, toDate));
            sw.WriteLine("<tr><td colspan='13' class='sub-header'>Colombo Lotus Tower</td></tr>");
            sw.WriteLine("<tr><td colspan='13'>&nbsp;</td></tr>");
            sw.WriteLine("</table>");

            exportGrid.RenderControl(hw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }






    public override void VerifyRenderingInServerForm(Control control)
    {
        // Required for exporting GridView
    }


    protected void gvTGPReport_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    string claimedStatus = DataBinder.Eval(e.Row.DataItem, "ClaimedStatus").ToString();

        //    // Find the "Claim" button cell, it's the second to last column
        //    int claimButtonColumnIndex = gvTGPReport.Columns.Count - 2;  // Adjust for the button column

        //    // Hide the Claim button if the status is "Claimed"
        //    Button btnClaim = (Button)e.Row.Cells[claimButtonColumnIndex].FindControl("btnClaim");

        //    if (claimedStatus == "Claimed")
        //    {
        //        btnClaim.Visible = false;
        //    }
        //    else
        //    {
        //        btnClaim.Visible = true;
        //    }
        //}
    }


    protected void gvTGPReport_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //if (e.CommandName == "Claim")
        //{
        //    int TGHid = Convert.ToInt32(e.CommandArgument);

        //    DateTime fromDate;
        //    DateTime toDate;

        //    // Validate From Date and To Date fields
        //    if (!DateTime.TryParse(txtFromDate.Text, out fromDate) || !DateTime.TryParse(txtToDate.Text, out toDate))
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "dateValidation", "alert('⚠️ Please select a valid date range.');", true);
        //        return;
        //    }

         

        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand("sp_ClaimTourGuidePoints", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@TGHid", TGHid);
        //        cmd.Parameters.AddWithValue("@FromDate", fromDate);
        //        cmd.Parameters.AddWithValue("@ToDate", toDate);
              

        //        con.Open();
        //        int rowsAffected = cmd.ExecuteNonQuery();
        //        con.Close();

        //        if (rowsAffected > 0)
        //        {
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "claimSuccess", "alert('✅ Claim processed successfully.');", true);
        //        }
        //        else
        //        {
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertAlreadyClaimed", "alert('✅ Claim processed successfully');", true);
        //        }

        //        // Reload your grid to refresh the claim status
        //        btnView_Click(null, null);
        //    }
        //}
    }


    int insertedId = 0;
    public int InsertTourGuideClaim(int claimedUserId, DateTime claimRangeFrom, DateTime claimRangeTo, decimal claimedAmount)
    {
        
            using (SqlCommand command = new SqlCommand("sp_InsertTourGuideClaim", conn))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add parameters
                command.Parameters.AddWithValue("@ClaimedUserID", claimedUserId);
                command.Parameters.AddWithValue("@ClaimRangeFrom", claimRangeFrom);
                command.Parameters.AddWithValue("@ClaimRangeTo", claimRangeTo);
                command.Parameters.AddWithValue("@ClaimedAmount", claimedAmount);

            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                // Use ExecuteScalar to get the returned identity value
                object result = command.ExecuteScalar();
                if (result != null)
                {
                    insertedId = Convert.ToInt32(result);
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error inserting tour guide claim.", ex);
            }
            finally
            {
                conn.Close();
            }
        }

        return insertedId;
    }

  
   
        
    


    protected void BtnClaim_Click(object sender, EventArgs e)
    {

        DateTime fromDate;
        DateTime toDate;
        decimal TotAmount = 0;

        // Validate From Date and To Date fields
        if (!DateTime.TryParse(txtFromDate.Text, out fromDate) || !DateTime.TryParse(txtToDate.Text, out toDate))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "dateValidation", "alert('⚠️ Please select a valid date range.');", true);
            return;
        }


        int claimId = InsertTourGuideClaim(userId, fromDate, toDate, TotAmount);
        lblClaimId.Text =  claimId.ToString();

      

        foreach (GridViewRow row in gvTGPReport.Rows)
        {
            // Skip if it's not a DataRow (optional if footer/header exist)
            if (row.RowType == DataControlRowType.DataRow)
            {
                // Read BoundField values
                string TGHid = row.Cells[0].Text.Trim();


                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("sp_ClaimTourGuidePoints", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TGHid", TGHid);
                    cmd.Parameters.AddWithValue("@FromDate", fromDate);
                    cmd.Parameters.AddWithValue("@ToDate", toDate);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@TGClaimId", lblClaimId.Text);



                int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();

                

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "claimSuccess", "alert('✅ Claim processed successfully.');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertAlreadyClaimed", "alert('✅ Claim processed successfully');", true);
                    }

                    // Reload your grid to refresh the claim status
                    btnView_Click(null, null);
                }

            
        }
    }



}








