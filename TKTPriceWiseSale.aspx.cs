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

public partial class TKTPriceWiseSale : System.Web.UI.Page
{
    SqlConnection conn;
    static string url = "TKTPriceWiseSale.aspx";
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

    protected void btnFind_Click(object sender, EventArgs e)
    {
        gvTicketSale.DataSource = GVBind();
        gvTicketSale.DataBind();
    }

    private DataTable GVBind()
    {
        DataTable dtGridView = new DataTable();
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("exec [VM].[dbo].sp_TicketSaleSummary_ValueWise '" + BasicDatePickerFromDate.Text + "','" + BasicDatePickerFromDate.Text + "' ", conn))
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
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
        Response.AddHeader("content-disposition", "attachment;filename=Ticket_SaleSummary.xls");
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
    int TotalTicketSold = 0;
    protected void gvTicketSale_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int TicketSold = int.Parse(((Label)e.Row.FindControl("lblTicketSold")).Text.Trim());

            TotalTicketSold += TicketSold;            
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotalTicketSold = (Label)e.Row.FindControl("lblTotalTicketSold");
            lblTotalTicketSold.Text = TotalTicketSold.ToString("N0");

            
        }
    }
}