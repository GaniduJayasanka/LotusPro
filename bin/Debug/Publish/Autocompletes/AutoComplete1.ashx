<%@ WebHandler Language="C#" Class="TallySheetAutoComplete" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public class TallySheetAutoComplete : IHttpHandler
{    
    public void ProcessRequest (HttpContext context)
    {        
        string prefixText = context.Request.QueryString["q"];
        string type = context.Request.QueryString["type"];
                
        if (type == "SearchStyle")
        {
            context.Response.Write(AutoCompleteSearchStyle(prefixText));   
        }
        
    }    

    public String AutoCompleteSearchStyle(string searchstyletext)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["ConString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = " SELECT DISTINCT [StyleNo], [OrderNo] FROM [MerchandisingHO].[dbo].[Orders]  "
                 + "WHERE [StyleNo] LIKE '%' + @SearchText + '%' ORDER BY [OrderNo] DESC ";                 
                cmd.Parameters.AddWithValue("@SearchText", searchstyletext);
                cmd.Connection = conn;
                StringBuilder sb = new StringBuilder();
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        sb.Append(sdr["StyleNo"]).Append(Environment.NewLine);
                    }
                }
                conn.Close();
                return sb.ToString();

            }
        }
    }    
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}