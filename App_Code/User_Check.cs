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

public class User_Check
{
    public User_Check()
	{
		
	}
    
    public static bool Check(int userid, int formid)
    {
       bool user_privilege = false;

       SqlConnection conn = DB_Connect.GetConnection1();
       conn.Open();

       string sql = " SELECT [UserId] FROM [LotusPro].[dbo].[FormPriviledges] "
                  + " WHERE [FormId] = " + formid + " AND [UserId] = " + userid + " ";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {
            user_privilege = true;
        };

        conn.Close();
        return user_privilege;
    }

    public static bool DecryptCheck(int userid)
    {
        bool user_privilege = false;

        SqlConnection conn = DB_Connect.GetConnection();
        conn.Open();

        string sql = " SELECT [UserId] "
                   + " FROM [ITInventory].[dbo].[DecryptPrivileges] "
                   + " WHERE [UserId] = " + userid + " ";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {
            user_privilege = true;
        };

        conn.Close();
        return user_privilege;
    }

    public static bool PrevTypeCheck(int userid)
    {
        bool user_privilege = false;
        int prevtype = 0;
        SqlConnection conn = DB_Connect.GetConnection();
        conn.Open();

        string sql = " SELECT [PrivType] "
                   + " FROM [ITInventory].[dbo].[DecryptPrivileges] "
                   + " WHERE [UserId] = " + userid + " ";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {
            prevtype = Convert.ToInt32(dr["PrivType"].ToString());
            
        };
        
        if (prevtype == 1)
        {
        user_privilege = true;
        }
        else
        {
            user_privilege = false;
        }
        conn.Close();
        return user_privilege;
    }
}
