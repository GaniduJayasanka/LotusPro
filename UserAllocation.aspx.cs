using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

public partial class UserAllocation : System.Web.UI.Page
{
    SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection1();
        if (!Page.IsPostBack)
        {
            GVForm.DataSource = GVBind();
            GVForm.DataBind();
            GetUserNames();
        }
    }

    private void GetUserNames()
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        string query = "SELECT UserId, UserName FROM [LotusPro].[dbo].SystemUsers";
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        DD1.DataSource = dt;
        DD1.DataTextField = "UserName";
        DD1.DataValueField = "UserId";
        DD1.DataBind();

        DD1.Items.Insert(0, new ListItem("--Select User--", "0"));
    }

    protected void DD1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DD1.SelectedValue != "0")
        {
            lblUserName.Text = DD1.SelectedItem.Text;
        }
        else
        {
            lblUserName.Text = string.Empty;
        }
    }

    public DataTable GVBind()
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        DataTable dtGridView = new DataTable();
        SqlCommand cmd = new SqlCommand("[LotusPro].[dbo].[sp_getWebForms]", conn);
        cmd.CommandTimeout = 180;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dtGridView);

        if (dtGridView.Rows.Count == 0)
        {
            return dtGridView;
        }
        conn.Close();
        return dtGridView;
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GVForm.Rows)
        {
            CheckBox CheckBoxPriviledge = (CheckBox)row.FindControl("chkSelect");
            Label lblFormId = (Label)row.FindControl("lblFormId");

            if (CheckBoxPriviledge.Checked)
            {
                InsertFormPriviledges(lblFormId.Text);
            }
        }
        WebMsgBox.Show("Successfully Saved !!!");
    }

    protected void InsertFormPriviledges(string FormId)
    {
        string sql = "[LotusPro].[dbo].[sp_InsertFormPriviledges]";
        SqlCommand command = new SqlCommand(sql, conn);
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(DD1.SelectedValue);
        command.Parameters.Add("@FormId", SqlDbType.Int).Value = Convert.ToInt32(FormId);
        command.Parameters.Add("@CreateUserId", SqlDbType.Int).Value = Convert.ToInt32(lblUserID.Text);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        command.CommandTimeout = 6000;
        command.ExecuteNonQuery();
        conn.Close();
    }

    protected void BtnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        if (DD1.SelectedValue != "0")
        {
            DataTable dtPrivileges = GetUserPrivileges(Convert.ToInt32(DD1.SelectedValue));
            foreach (GridViewRow row in GVForm.Rows)
            {
                CheckBox CheckBoxPriviledge = (CheckBox)row.FindControl("chkSelect");
                Label lblFormId = (Label)row.FindControl("lblFormId");
                if (dtPrivileges.AsEnumerable().Any(rowPrivileges => rowPrivileges.Field<int>("FormId") == Convert.ToInt32(lblFormId.Text)))
                {
                    CheckBoxPriviledge.Checked = true;
                }
                else
                {
                    CheckBoxPriviledge.Checked = false;
                }
            }
        }
    }

    private DataTable GetUserPrivileges(int userId)
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("[LotusPro].[dbo].[sp_GetUserPrivileges1]", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        conn.Close();

        return dt;
    }
}
