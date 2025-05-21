using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterTKTEvents : System.Web.UI.Page
{
    SqlConnection conn;
    static int formid = 7;
    static int userId = 0;
    static string url = "MasterTKTEvents.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        GVEventIndex.DataSource = GVBind();
        GVEventIndex.DataBind();
    }

    private DataTable GVBind()
    {
        DataTable dtGridView = new DataTable();

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("exec  VM.[lotusTest].[Sp_GetEvents] ", conn))
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {

    }

    protected void BbtnClear_Click(object sender, EventArgs e)
    {

    }

    protected void BtnEventCreate_Click(object sender, EventArgs e)
    {

    }

    protected void BtnEventCancel_Click(object sender, EventArgs e)
    {

    }
}