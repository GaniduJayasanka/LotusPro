using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TGPReport : System.Web.UI.Page
{
    // string connectionString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
    SqlConnection conn;
    static string url = "TGPReport.aspx";
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
        Response.AddHeader("content-disposition", "attachment;filename=TourGuidePointsReport.xls");
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









}
