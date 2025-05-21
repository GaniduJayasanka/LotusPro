using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
  SqlConnection conn;
  protected void Page_Load(object sender, EventArgs e)
    {
    conn = DB_Connect.GetConnection1();
    if (!IsPostBack)
    {
      getERPSaledetails();
      //BindChartPlanVSActual_Magamall();
      //BindChartPlanVSActual_Bambalapitiya();
      //BindGrid_MonthWiseSale();
    }
    }

  public void getERPSaledetails()
  {

    if (conn.State.ToString() == "Closed")
    {
      conn.Open();
    }
    SqlCommand newCmd = new SqlCommand("exec [VM].[dbo].sp_MainDashboardDetails", conn);

    try
    {
      SqlDataReader dr1 = newCmd.ExecuteReader();
      while (dr1.Read())
      {
        decimal LocalTicketCount;
        decimal BambaSale;
        decimal TotalNoOfTickets_Today;
        decimal TotalNoOfSale_Today;
        decimal MegaMallPercentage;
        decimal ForiegnTicketCount;

                //MegaMallSale = decimal.Parse(dr1["MegaMallSale"].ToString(), System.Globalization.NumberStyles.Currency);
                //lblMegaMallSale.Text = MegaMallSale.ToString("#,##0.00");

                //BambaSale = decimal.Parse(dr1["BambaSale"].ToString(), System.Globalization.NumberStyles.Currency);
                //lblBambaSale.Text = BambaSale.ToString("#,##0.00");

        TotalNoOfTickets_Today = decimal.Parse(dr1["TotalNoOfTickets"].ToString(), System.Globalization.NumberStyles.Currency);
        lblTodayTotalNoOfTickets.Text = TotalNoOfTickets_Today.ToString("#,##0");

        TotalNoOfSale_Today = decimal.Parse(dr1["TotalNoOfSale"].ToString(), System.Globalization.NumberStyles.Currency);
                lblTotalNoOfSale_Today.Text = TotalNoOfSale_Today.ToString("#,##0");

                LocalTicketCount = decimal.Parse(dr1["LocalTicketCount"].ToString(), System.Globalization.NumberStyles.Currency);
                lblLocalTicketCount.Text = LocalTicketCount.ToString("#,##0.00");

                ForiegnTicketCount = decimal.Parse(dr1["ForiegnTicketCount"].ToString(), System.Globalization.NumberStyles.Currency);
                lblForiegnTicketCount.Text = ForiegnTicketCount.ToString("#,##0.00");

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

  //protected void BindChartPlanVSActual_Magamall()
  //{

  //  SqlCommand cmd = new SqlCommand("Exec sp_TargetvsActualSale_MegaMall");
  //  cmd.Connection = conn;
  //  if (conn.State.ToString() == "Closed")
  //  {
  //    conn.Open();
  //  }
  //  DataTable dt = new DataTable();

  //  dt.Load(cmd.ExecuteReader());
  //  conn.Close();

  //  List<string> columns = new List<string>();
  //  columns.Add("TargetQty");
  //  columns.Add("ActualQty");
  //  string[] x = (from p in dt.AsEnumerable()
  //                select p.Field<string>("Floor")).Distinct().ToArray();
  //  for (int i = 0; i < columns.Count; i++)
  //  {
  //    int[] y = (from p in dt.AsEnumerable()
  //               select p.Field<int>(columns[i])).ToArray();
  //    ChartMegaMallSale.Series.Add(new Series(columns[i]));
  //    ChartMegaMallSale.Series[columns[i]].IsValueShownAsLabel = true;
  //    ChartMegaMallSale.Series["TargetQty"].Color = System.Drawing.Color.Orange;
  //    if (i > 0)
  //    {
  //      ChartMegaMallSale.Series["ActualQty"].Color = System.Drawing.Color.DarkOliveGreen;
  //    }
  //    ChartMegaMallSale.Series[columns[i]].ChartType = SeriesChartType.Column;
  //    ChartMegaMallSale.Series[columns[i]].Points.DataBindXY(x, y);
  //    //ChartMegaMallSale.Series[columns[1]].Points[0].Color = Color.Green;
  //    //ChartMegaMallSale.Series[columns[2]].Points[1].Color = Color.Red;
  //    ChartMegaMallSale.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
  //    ChartMegaMallSale.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;
  //    ChartMegaMallSale.Legends[0].Enabled = true;

  //    // ChartMegaMallSale.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
  //  }
  //  ChartMegaMallSale.Legends[0].Enabled = true;
   


  //}

  //protected void BindChartPlanVSActual_Bambalapitiya()
  //{

  //  SqlCommand cmd = new SqlCommand("Exec sp_TargetvsActualSale_Bamba");
  //  cmd.Connection = conn;
  //  if (conn.State.ToString() == "Closed")
  //  {
  //    conn.Open();
  //  }
  //  DataTable dt = new DataTable();

  //  dt.Load(cmd.ExecuteReader());
  //  conn.Close();

  //  List<string> columns = new List<string>();
  //  columns.Add("TargetQty");
  //  columns.Add("ActualQty");
  //  string[] x = (from p in dt.AsEnumerable()
  //                select p.Field<string>("Floor")).Distinct().ToArray();
  //  for (int i = 0; i < columns.Count; i++)
  //  {
  //    int[] y = (from p in dt.AsEnumerable()
  //               select p.Field<int>(columns[i])).ToArray();
  //    ChartBambalapitiyaSale.Series.Add(new Series(columns[i]));
  //    ChartBambalapitiyaSale.Series[columns[i]].IsValueShownAsLabel = true;
  //    ChartBambalapitiyaSale.Series["TargetQty"].Color = System.Drawing.Color.Orange;
  //    if (i > 0)
  //    {
  //      ChartBambalapitiyaSale.Series["ActualQty"].Color = System.Drawing.Color.DarkOliveGreen;
  //    }
  //    ChartBambalapitiyaSale.Series[columns[i]].ChartType = SeriesChartType.Column;
  //    ChartBambalapitiyaSale.Series[columns[i]].Points.DataBindXY(x, y);
  //    ChartBambalapitiyaSale.ChartAreas["ChartArea2"].AxisX.MajorGrid.Enabled = false;
  //    ChartBambalapitiyaSale.ChartAreas["ChartArea2"].AxisY.MajorGrid.Enabled = false;
  //    ChartBambalapitiyaSale.Legends[0].Enabled = true;
      
  //    // ChartMegaMallSale.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
  //  }
  //  ChartBambalapitiyaSale.Legends[0].Enabled = true;



  //}

  private static DataTable GetData(string query)
  {
    SqlConnection conn = DB_Connect.GetConnection();

    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
    {
      DataTable dt = new DataTable();
      sda.SelectCommand.CommandTimeout = 800000;
      sda.Fill(dt);
      return dt;
    }

  }
  //protected void BindGrid_MonthWiseSale()
  //{


  //  //Fetch the Statistical data from database.
  //  string query = "exec [HOFERP].[dbo].[sp_MonthWiseSale_LineChart]";
  //  DataTable dt = GetData(query);

  //  //Get the DISTINCT Countries.
  //  List<string> countries = (from p in dt.AsEnumerable()
  //                            select p.Field<string>("Location")).Distinct().ToList();

  //  //Loop through the Countries.
  //  foreach (string country in countries)
  //  {

  //    //Get the Year for each Country.
  //    string[] x = (from p in dt.AsEnumerable()
  //               where p.Field<string>("Location") == country
  //              // orderby p.Field<string>("MonthName") ascending
  //               select p.Field<string>("MonthName")).ToArray();

  //    //Get the Total of Orders for each Country.
  //    int[] y = (from p in dt.AsEnumerable()
  //               where p.Field<string>("Location") == country
  //              // orderby p.Field<string>("MonthName") ascending
  //               select p.Field<int>("QTY")).ToArray();

  //    //Add Series to the Chart.
  //    Chart2.Series.Add(new Series(country));
  //    Chart2.Series[country].IsValueShownAsLabel = true;
  //    Chart2.Series[country].BorderWidth = 2;
  //    Chart2.Series[country].ChartType = SeriesChartType.Line;
  //    Chart2.Series[country].Points.DataBindXY(x, y);
  //    Chart2.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
  //    Chart2.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;
  //    Chart2.ChartAreas["ChartArea1"].AxisX.Title = "Month";
  //    Chart2.ChartAreas["ChartArea1"].AxisX.LabelStyle.Angle = 90;
  //    //  Chart1.ChartAreas["ChartArea1"].AxisY.Title = "Production Qty";
  //  }

  //  Chart2.Legends[0].Enabled = true;
  //}

}
