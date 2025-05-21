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

public partial class TKTScanCount : System.Web.UI.Page
{
    SqlConnection conn;
    static string url = "TKTScanCount.aspx";
    static int formid = 8;
    static int userId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection1();

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
                    Server.Transfer("~/AdminPanel.aspx", true);
                }


            }
        }
    }


    private DataTable GVBind()
    {
        DataTable dtGridView = new DataTable();
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("exec [VM].[dbo].sp_TicketScanSummary '" + BasicDatePickerFromDate.Text + "','" + BasicDatePickerToDate.Text + "' ", conn))
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        gvTicketSale.DataSource = GVBind();
        gvTicketSale.DataBind();
    }

    protected void BbtnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void ButtonExport_Click(object sender, EventArgs e)
    {
        gvTicketSale.ShowHeader = true;
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Ticket_ScanSummary.xls");
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
            foreach (GridViewRow row in gvTicketSale.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = gvTicketSale.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = gvTicketSale.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }
            gvTicketSale.RenderControl(hw);

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


    int TotalNoofVisitors = 0;
    int TotalLocalAdult = 0;
    int TotalLocalChild = 0;
    int TotalForeignAdult = 0;
    int TotalForeignKids = 0;
    int TotalFastPass = 0;
    protected void gvTicketSale_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int NoOfVisitors = int.Parse(((Label)e.Row.FindControl("lblNoOfVisitors")).Text.Trim());
            int LocalAdult = int.Parse(((Label)e.Row.FindControl("lblLocalAdult")).Text.Trim());
            int LocalChild = int.Parse(((Label)e.Row.FindControl("lblLocalChild")).Text.Trim());
            int ForeignAdult = int.Parse(((Label)e.Row.FindControl("lblForeignAdult")).Text.Trim());
            int ForeignKids = int.Parse(((Label)e.Row.FindControl("lblForeignKids")).Text.Trim());
            int FastPass = int.Parse(((Label)e.Row.FindControl("lblFastPass")).Text.Trim());

            TotalNoofVisitors += NoOfVisitors;
            TotalLocalAdult += LocalAdult;
            TotalLocalChild += LocalChild;
            TotalForeignAdult += ForeignAdult;
            TotalForeignKids += ForeignKids;
            TotalFastPass += FastPass;
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotalNoOfVisitors = (Label)e.Row.FindControl("lblTotalNoOfVisitors");
            lblTotalNoOfVisitors.Text = TotalNoofVisitors.ToString("N0");

            Label lblTotalLocalAdult = (Label)e.Row.FindControl("lblTotalLocalAdult");
            lblTotalLocalAdult.Text = TotalLocalAdult.ToString("N0");

            Label lblTotalLocalChild = (Label)e.Row.FindControl("lblTotalLocalChild");
            lblTotalLocalChild.Text = TotalLocalChild.ToString("N0");

            Label lblTotalForeignAdult = (Label)e.Row.FindControl("lblTotalForeignAdult");
            lblTotalForeignAdult.Text = TotalForeignAdult.ToString("N0");

            Label lblTotalForeignKids = (Label)e.Row.FindControl("lblTotalForeignKids");
            lblTotalForeignKids.Text = TotalForeignKids.ToString("N0");

            Label lblTotalFastPass = (Label)e.Row.FindControl("lblTotalFastPass");
            lblTotalFastPass.Text = TotalFastPass.ToString("N0");


        }

    }
}