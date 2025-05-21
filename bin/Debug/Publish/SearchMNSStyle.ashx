<%@ WebHandler Language="C#" Class="SearchMNSStyle" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public class SearchMNSStyle : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["q"];
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["ConString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = " SELECT O.[StyleNo] ,O.[Buy] ,O.[OrderNo] FROM [MerchandisingHO].[dbo].[Orders] O "
                                + " WHERE O.[StyleNo] LIKE '%'+ @SearchText + '%' AND BuyerID=20  AND (O.[Status] = 0) AND O.[OrderNo] "
                                + " IN (SELECT [OrderNo] FROM [Commercial].[dbo].[MSPDeliveries]) ORDER BY O.[OrderNo] DESC ";
                    //"Select O.StyleNo,O.Buy, O.OrderNo from Orders O  WHERE O.StyleNo LIKE '%'+ @SearchText + '%' AND (O.Status=0)  ORDER BY O.OrderNo DESC";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                StringBuilder sb = new StringBuilder();
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        sb.Append(sdr["StyleNo"]).Append("#").Append(sdr["Buy"]).Append("+++").Append(sdr["OrderNo"])
                            .Append(Environment.NewLine);
                    }
                }
                conn.Close();
                context.Response.Write(sb.ToString());
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}