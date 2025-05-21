using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CommonSQLTask
/// </summary>
public class CommonSQLTask
{
    SqlConnection conn = DB_Connect.GetConnection();

	public CommonSQLTask()
	{        
	}

    public bool AddLoginLog(int userid, int pageid, int type)
    {
        bool returnVal = false;

        string sql = " [sp_OperationAPMaSLogin] @UserID, @PageID, @Type ";

        try
        {
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlParameter[] param = new SqlParameter[3];

            param[0] = new SqlParameter("@UserID", SqlDbType.Int);
            param[1] = new SqlParameter("@PageID", SqlDbType.Int);
            param[2] = new SqlParameter("@Type", SqlDbType.Int);

            param[0].Value = userid;
            param[1].Value = pageid;
            param[2].Value = type;

            for (int i = 0; i < param.Length; i++)
            {
                cmd.Parameters.Add(param[i]);
            }

            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            returnVal = true;
            conn.Close();
            return returnVal;
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            string msg = "Detail Delete Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            conn.Close();
        }
    }

}