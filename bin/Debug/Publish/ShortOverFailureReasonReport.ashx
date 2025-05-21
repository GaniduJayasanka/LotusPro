<%@ WebHandler Language="C#" Class="ShortOverFailureReasonReport" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;


public class ShortOverFailureReasonReport : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string prefixText = context.Request.QueryString["q"];
        using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["ConString1"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT [SORID],[Reason] FROM [Commercial].[dbo].[MSPSShort_OverFailureeason]  WHERE Reason LIKE '%'+ @SearchText + '%'  ORDER BY Reason DESC";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                StringBuilder sb = new StringBuilder();
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        sb.Append(sdr["Reason"]).Append(Environment.NewLine);
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