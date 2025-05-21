using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Globalization;

/// <summary>
/// Summary description for DB_Access
/// </summary>
public class DB_Access
{
    SqlConnection conn;
    SqlConnection connITInventry;
    SqlConnection PayRoll;
    SqlConnection Test;
    //SqlConnection Test2;
    

	public DB_Access()
	{
        conn = DB_Connect.GetConnection();
       connITInventry = DB_Connect.GetConnection();
       PayRoll = DB_Connect.GetConnection();
       Test = DB_Connect.GetConnection();
      // Test2 = DB_Connect.GetConnection8();
	}


    public DataTable getAllDocTypes()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("DCID", typeof(string));
        dt.Columns.Add("DocumentType", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT DCID,DocumentType FROM Commercial.dbo.DocumentCategory Where Active=1";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["DCID"], dr["DocumentType"]);

        }
        conn.Close();
        return dt;
    }

    public DataTable getAllItems()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("CompanyID", typeof(string));
        dt.Columns.Add("CompanyCode", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT [CompanyCode],[CompanyID]  FROM [Temporary_Despatch].[dbo].[Company]";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["CompanyID"], dr["CompanyCode"]);
        }
        conn.Close();
        return dt;
    }

    public DataTable getAllDeptCodeNew()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ID", typeof(string));
        dt.Columns.Add("DeptName", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT  [ID] ,[DeptName]  FROM [MerchandisingHO].[dbo].[DepartmentNew] ORDER BY [DeptName]";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["ID"], dr["DeptName"]);
        }
        conn.Close();
        return dt;
    }


    public DataTable getAllSeasonCodeNew()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Season", typeof(string));
      
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT Season  FROM [MerchandisingHO].[dbo].DEV_SEASON ORDER BY Season";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["Season"]);
        }
        conn.Close();
        return dt;
    }

    public DataTable getAllLocations()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("CompanyID", typeof(string));
        dt.Columns.Add("CompanyCode", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "  SELECT CompanyCode,Seq as CompanyID  FROM [Temporary_Despatch].[dbo].[Company]";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["CompanyID"], dr["CompanyCode"]);
        }
        conn.Close();
        return dt;
    }

    public DataTable getAllCustomers()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("CustomerID", typeof(string));
        dt.Columns.Add("CustomerName", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT  [CustomerID],[CustomerName] FROM [MerchandisingHO].[dbo].[Customer]   ORDER BY CustomerName";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["CustomerID"], dr["CustomerName"]);
        }
        conn.Close();
        return dt;
    }


    public DataTable getAllvendor()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("VendorID", typeof(string));
        dt.Columns.Add("VendorName", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT VendorID,VendorName FROM MerchandisingHO.dbo.Vendor  where [Active]  =0 order by [VendorName]";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["VendorID"], dr["VendorName"]);

        }
        conn.Close();
        return dt;
    }

    //public DataTable getBuyerforPaymentApprove()
    //{
    //    DataTable dt = new DataTable();
    //    dt.Columns.Add("BuyerName", typeof(string));
    //    dt.Columns.Add("BuyerID", typeof(string));
    //    if (conn.State.ToString() == "Closed")
    //    {
    //        conn.Open();
    //    }
    //    SqlCommand newCmd = conn.CreateCommand();
    //    newCmd.Connection = conn;
    //    newCmd.CommandType = CommandType.Text;
    //    newCmd.CommandText = "SELECT distinct Buyer.BuyerID, Buyer.BuyerName FROM Buyer INNER JOIN " +
    //                     "[MerchandisingHO].[dbo].[Orders]  ON Buyer.BuyerID = Orders.BuyerID INNER JOIN " +
    //                     "[MerchandisingHO].[dbo].[BuyerPOMaster] Orders ON Orders.OrderNo = BuyerPOMaster.OrderNo " +
    //                     "WHERE (BuyerPOMaster.POID  in (SELECT        FID.POID " +
    //                     "FROM [Commercial].dbo.FinalDocumnetHeader H INNER JOIN " +
    //                     "[Commercial].dbo.FinalDocumnetDetail FD ON H.ShipID = FD.INVID INNER JOIN " +
    //                     "[Commercial].dbo.FinalInvoceDetail FID ON FD.ShipID = FID.SHIPID " +
    //                     "WHERE (H.IM_COMMIT = 1) AND (H.ShipID IN " +
    //                         "(SELECT SHIPID " +
    //                           "FROM  [Commercial].dbo.ReceivePayment " +
    //                            "WHERE (RecDate > '05/01/2012') AND (Done = 0) AND (IM_COMMIT = 1)))) ) " +
    //                            "order by Buyer.BuyerName";
    //    SqlDataReader dr = newCmd.ExecuteReader();
    //    while (dr.Read())
    //    {
    //        dt.Rows.Add(dr["BuyerName"], dr["BuyerID"]);

    //    }
    //    conn.Close();
    //    return dt;
    //}

    public DataTable getSETStylesWithoutBuy(DateTime FromDate, DateTime ToDate, int BuyerID)
    {
        DataTable dt = new DataTable();
        if (BuyerID == 15)
        {
            dt.Columns.Add("OrderNo", typeof(int));
            dt.Columns.Add("StyleNo", typeof(string));
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            string F = FromDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            string T = ToDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            SqlCommand newCmd = conn.CreateCommand();
            newCmd.Connection = conn;
            newCmd.CommandType = CommandType.Text;
            newCmd.CommandText = "SELECT  DISTINCT  MSPD.[OrderNo],O.StyleNo AS StyleNo       FROM [Commercial].[dbo].[MSPDeliveries] MSPD "
     + " INNER JOIN MerchandisingHO.dbo.Orders O ON O.OrderNo=MSPD.OrderNo  WHERE [DeliveryDate] BETWEEN  '" + F + "' AND  '" + T + "'   Order By O.StyleNo ";
            SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
            {
                dt.Rows.Add(dr["OrderNo"], dr["StyleNo"]);

            }

        }
        else
        {


            dt.Columns.Add("OrderNo", typeof(int));
            dt.Columns.Add("StyleNo", typeof(string));
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            string F = FromDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            string T = ToDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            SqlCommand newCmd = conn.CreateCommand();
            newCmd.Connection = conn;
            newCmd.CommandType = CommandType.Text;
            newCmd.CommandText = "SELECT  DISTINCT  MSPD.[OrderNo],O.StyleNo  AS StyleNo       FROM [Commercial].[dbo].[MSPDeliveries] MSPD "
     + " INNER JOIN MerchandisingHO.dbo.Orders O ON O.OrderNo=MSPD.OrderNo  WHERE [DeliveryDate] BETWEEN  '" + F + "' AND  '" + T + "' AND BuyerID=" + BuyerID + "  Order By O.StyleNo ";
            SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
            {
                dt.Rows.Add(dr["OrderNo"], dr["StyleNo"]);

            }
        }
        conn.Close();
        return dt;

    }

    public DataTable getAllPlants()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ID", typeof(string));
        dt.Columns.Add("Plant", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT SEQ AS ID,CCode AS Plant FROM Commercial.dbo.Company Where SEQ != 6 ORDER BY SEQ DESC";
        //       newCmd.CommandText = "SELECT SEQ AS ID,CASE Seq when 1 then 'SUB' when 2 then 'SP'when 3 then 'SW'when 4 then 'SH'when 5 then 'SN'  "
        //+ "  END AS Plant FROM Commercial.dbo.Company Where SEQ !=6 ORDER BY SEQ DESC ";
        SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
        {
            dt.Rows.Add(dr["ID"], dr["Plant"]);

        }
        conn.Close();
        return dt;
    }

    public DataTable getAllSubbmissions(int OrderNo)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ESID", typeof(string));
        dt.Columns.Add("Submissions", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "  SELECT DISTINCT ES.ESID ,ES.[Submissions] FROM [MerchandisingHO].[dbo].[EMBStyleParts] ESP "
+ "   INNER JOIN [MerchandisingHO].[dbo].[EMBParts] EP ON ESP.EPID = EP.EPID  "
 +" INNER JOIN [MerchandisingHO].[dbo].Costing C ON C.OrderNo = ESP.OrderNo AND C.Approved=2 "
 + "  INNER JOIN [MerchandisingHO].[dbo].[EMBSubmission] ES ON ESP.ESID = ES.ESID  "
 + " where ESP.OrderNo ='" + OrderNo + "'";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["ESID"], dr["Submissions"]);

        }
        conn.Close();
        return dt;
    }

    public DataTable getAllParts(int OrderNo, int ESID)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ESPID", typeof(string));
        dt.Columns.Add("Part", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT ESP.ESPID,EP.Part  FROM [MerchandisingHO].[dbo].[EMBStyleParts] ESP "
 + "  INNER JOIN [MerchandisingHO].[dbo].[EMBParts] EP ON ESP.EPID = EP.EPID  "
 + "    INNER JOIN [MerchandisingHO].[dbo].[EMBSubmission] ES ON ESP.ESID = ES.ESID  "
 +"  INNER JOIN MerchandisingHO.dbo.Costing C ON C.CostingID=ESP.CostingID AND Approved=2  "
  + "   where ESP.OrderNo ='" + OrderNo + "' AND ES.ESID='" + ESID + "' order By Part";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["ESPID"], dr["Part"]);

        }
        conn.Close();
        return dt;
    }

    public DataTable getBuyerPONos(int OrderNo)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("POID", typeof(string));
        dt.Columns.Add("BuyerPONo", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = " SELECT POID,BuyerPONo FROM MerchandisingHO.dbo.BuyerPOMaster "
+ "  where OrderNo='" + OrderNo + "'";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["POID"], dr["BuyerPONo"]);

        }
        conn.Close();
        return dt;
    }

    public DataTable getAllBuyerCode()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("BuyerID", typeof(string));
        dt.Columns.Add("BuyerName", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "exec MerchandisingHO.dbo.[BUYER_LOAD] ";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["BuyerID"], dr["BuyerName"]);

        }
        conn.Close();
        return dt;
    }

    public DataTable getAllStores()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("LocationCode", typeof(string));
        //dt.Columns.Add("LocationCode", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "Select LocationCode FROM [MerchandisingHO].[dbo].[Stores_Locations]";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["LocationCode"]);

        }
        conn.Close();
        return dt;
    }

    public DataTable getSETStyles(DateTime FromDate, DateTime ToDate, int BuyerID)
    {
        DataTable dt = new DataTable();
        if (BuyerID == 15)
        {
            dt.Columns.Add("OrderNo", typeof(int));
            dt.Columns.Add("StyleNo", typeof(string));
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            string F = FromDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            string T = ToDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            SqlCommand newCmd = conn.CreateCommand();
            newCmd.Connection = conn;
            newCmd.CommandType = CommandType.Text;
            newCmd.CommandText = "SELECT  DISTINCT  MSPD.[OrderNo],O.StyleNo +' - '+buy AS StyleNo       FROM [Commercial].[dbo].[MSPDeliveries] MSPD "
     + " INNER JOIN MerchandisingHO.dbo.Orders O ON O.OrderNo=MSPD.OrderNo  WHERE [DeliveryDate] BETWEEN  '" + F + "' AND  '" + T + "'   Order By O.StyleNo ";
            SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
            {
                dt.Rows.Add(dr["OrderNo"], dr["StyleNo"]);

            }

        }
        else
        {


            dt.Columns.Add("OrderNo", typeof(int));
            dt.Columns.Add("StyleNo", typeof(string));
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            string F = FromDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            string T = ToDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            SqlCommand newCmd = conn.CreateCommand();
            newCmd.Connection = conn;
            newCmd.CommandType = CommandType.Text;
            newCmd.CommandText = "SELECT  DISTINCT  MSPD.[OrderNo],O.StyleNo +' - '+buy AS StyleNo       FROM [Commercial].[dbo].[MSPDeliveries] MSPD "
     + " INNER JOIN MerchandisingHO.dbo.Orders O ON O.OrderNo=MSPD.OrderNo  WHERE [DeliveryDate] BETWEEN  '" + F + "' AND  '" + T + "' AND BuyerID=" + BuyerID + "  Order By O.StyleNo ";
            SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
            {
                dt.Rows.Add(dr["OrderNo"], dr["StyleNo"]);

            }
        }
        conn.Close();
        return dt;

    }

    public DataTable getSETBuyerPONos(DateTime FromDate, DateTime ToDate, int orderNo)
    {
        DataTable dt = new DataTable();
        if (orderNo == 0)
        {
            dt.Columns.Add("POID", typeof(int));
            dt.Columns.Add("BuyerPONo", typeof(string));
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            string F = FromDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            string T = ToDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            SqlCommand newCmd = conn.CreateCommand();
            newCmd.Connection = conn;
            newCmd.CommandType = CommandType.Text;
            newCmd.CommandText = "SELECT  DISTINCT   BPM.BuyerPONo ,POID      FROM [Commercial].[dbo].[MSPDeliveries] MSPD  "
     + "  INNER JOIN MerchandisingHO.dbo.BuyerPOMaster BPM ON BPM.OrderNo=MSPD.OrderNo AND BPM.POID=MSPD.BPOID  WHERE [DeliveryDate] BETWEEN  '" + F + "' AND  '" + T + "' ";
            SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
            {
                dt.Rows.Add(dr["POID"], dr["BuyerPONo"]);

            }

        }
        else
        {
            dt.Columns.Add("POID", typeof(int));
            dt.Columns.Add("BuyerPONo", typeof(string));
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            string F = FromDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            string T = ToDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            SqlCommand newCmd = conn.CreateCommand();
            newCmd.Connection = conn;
            newCmd.CommandType = CommandType.Text;
            newCmd.CommandText = "SELECT  DISTINCT   BPM.BuyerPONo ,POID      FROM [Commercial].[dbo].[MSPDeliveries] MSPD  "
     + "  INNER JOIN MerchandisingHO.dbo.BuyerPOMaster BPM ON BPM.OrderNo=MSPD.OrderNo AND BPM.POID=MSPD.BPOID  WHERE [DeliveryDate] BETWEEN  '" + F + "' AND  '" + T + "' AND MSPD.OrderNo=" + orderNo + "  ";
            SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
            {
                dt.Rows.Add(dr["POID"], dr["BuyerPONo"]);

            }

        }

        conn.Close();
        return dt;
    }

    public DataTable getSETBPOColors(DateTime FromDate, DateTime ToDate, int orderNo)
    {
        DataTable dt = new DataTable();
        if (orderNo == 0)
        {

            dt.Columns.Add("ColorName", typeof(string));
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            string F = FromDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            string T = ToDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            SqlCommand newCmd = conn.CreateCommand();
            newCmd.Connection = conn;
            newCmd.CommandType = CommandType.Text;
            newCmd.CommandText = "SELECT  DISTINCT   ColorName    FROM [Commercial].[dbo].[MSPDeliveries] MSPD  "
    + "  INNER JOIN [MerchandisingHO].[dbo].[StyleDetails] SD ON SD.OrderNo=MSPD.OrderNo AND SD.POID=MSPD.BPOID  AND SD.StyleID=MSPD.SDID "
      + " WHERE [DeliveryDate] BETWEEN  '" + F + "' AND  '" + T + "' Order BY ColorName";
            SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
            {
                dt.Rows.Add(dr["ColorName"]);

            }

        }
        else
        {

            dt.Columns.Add("ColorName", typeof(string));
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            string F = FromDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            string T = ToDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            SqlCommand newCmd = conn.CreateCommand();
            newCmd.Connection = conn;
            newCmd.CommandType = CommandType.Text;
            newCmd.CommandText = "SELECT  DISTINCT   ColorName    FROM [Commercial].[dbo].[MSPDeliveries] MSPD  "
    + "  INNER JOIN [MerchandisingHO].[dbo].[StyleDetails] SD ON SD.OrderNo=MSPD.OrderNo AND SD.POID=MSPD.BPOID  AND SD.StyleID=MSPD.SDID "
      + " WHERE [DeliveryDate] BETWEEN  '" + F + "' AND  '" + T + "' AND MSPD.OrderNo=" + orderNo + "  ";
            SqlDataReader dr = newCmd.ExecuteReader();
            while (dr.Read())
            {
                dt.Rows.Add(dr["ColorName"]);

            }

        }

        conn.Close();
        return dt;
    }
}
