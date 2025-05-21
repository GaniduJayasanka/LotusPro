using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
	public DBConnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static SqlConnection NewCon;
    public static string ConStr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;

    public static SqlConnection GetConnection()
    {
        NewCon = new SqlConnection(ConStr);
        return NewCon;
    }
}
