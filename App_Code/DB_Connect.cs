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

/// <summary>
/// Summary description for DB_Connect
/// </summary>
public class DB_Connect
{
	public DB_Connect()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static SqlConnection NewCon;
    public static SqlConnection NewCon1;
    public static SqlConnection NewCon2;
    public static SqlConnection NewCon3;
    public static SqlConnection NewCon4;
    public static SqlConnection NewCon5;
    public static SqlConnection NewCon6;
    public static SqlConnection NewCon7;

    public static string ConStr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
    public static string ConStr1 = ConfigurationManager.ConnectionStrings["ConString1"].ConnectionString;
    //public static string ConStr2 = ConfigurationManager.ConnectionStrings["ConString2"].ConnectionString;
    //public static string ConStr3 = ConfigurationManager.ConnectionStrings["ConString3"].ConnectionString;
    //public static string ConStr4 = ConfigurationManager.ConnectionStrings["ConString4"].ConnectionString;
    //public static string ConStr5 = ConfigurationManager.ConnectionStrings["ConString5"].ConnectionString;
    //public static string ConStr6 = ConfigurationManager.ConnectionStrings["ConString6"].ConnectionString;
    //public static string ConStr7 = ConfigurationManager.ConnectionStrings["ConString7"].ConnectionString;

    public static SqlConnection GetConnection()
    {
        NewCon = new SqlConnection(ConStr);
        return NewCon;
    }

    public static SqlConnection GetConnection1()
    {
        NewCon2 = new SqlConnection(ConStr1);
        return NewCon2;
    }

    //public static SqlConnection GetConnection3()
    //{
    //    NewCon3 = new SqlConnection(ConStr3);
    //    return NewCon3;
    //}

    //public static SqlConnection GetConnection4()
    //{
    //    NewCon4 = new SqlConnection(ConStr4);
    //    return NewCon4;
    //}
    //public static SqlConnection GetConnectionTest1()
    //{
    //    NewCon5 = new SqlConnection(ConStr5);
    //    return NewCon5;
    //}

    //public static SqlConnection GetConnectionTest()
    //{
    //    NewCon6 = new SqlConnection(ConStr6);
    //    return NewCon6;
    //}


    //public static SqlConnection GetConnection_Bambalapitiya()
    //{
    //    NewCon1 = new SqlConnection(ConStr1);
    //    return NewCon1;
    //}

    //public static SqlConnection GetConnection7()
    //{
    //    NewCon7 = new SqlConnection(ConStr7);
    //    return NewCon7;
    //}
}
