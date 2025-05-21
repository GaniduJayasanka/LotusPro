using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DBAcces
/// </summary>
public class DBAcces
{
    SqlConnection conn;
	public DBAcces()
	{
        conn = DBConnection.GetConnection();
	}

    public DataTable getAllBuyerCode()
    {
        DataTable dt = new DataTable();

        dt.Columns.Add("StyleNo", typeof(string));
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = "SELECT[StyleNo] FROM [MerchandisingHO].[dbo].[StyleDetails]";
        SqlDataReader dr = newCmd.ExecuteReader();
        while (dr.Read())
        {
            dt.Rows.Add(dr["StyleNo"]);

        }
        conn.Close();
        return dt;
    }
}
