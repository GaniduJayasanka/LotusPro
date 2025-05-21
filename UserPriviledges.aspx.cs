using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPriviledges : System.Web.UI.Page
{
    SqlConnection conn;
    static int formid = 6;
    static int userId = 0;
    static string url = "UserPriviledges.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection();

        if (!Page.IsPostBack)
        {
            userId = Convert.ToInt32(Request.QueryString["UserID"]);
            if (userId == 0)
            {
                Server.Transfer("~/Login_Common.aspx?url=" + url + "", true);
            }

            if (Session["UserID"].ToString() == null || userId == null)
            {
                Server.Transfer("~/Login_Common.aspx?url=" + url + "", true);
            }
            else
            {
                if (!User_Check.Check(Convert.ToInt32(Session["UserID"].ToString()), formid))
                {
                    WebMsgBox.Show("Sorry! you do not have enough privilages to perform this action.");
                    Server.Transfer("~/AdminPanel.aspx", true);
                }
            }

            BindUser();
            GVForm.DataSource = GVBind();
            GVForm.DataBind();

        }
    }

    protected void BindUser()
    {
        SqlCommand cmd = new SqlCommand("SELECT  [UserId],[UserName]   FROM [LotusPro].[dbo].[SystemUsers]   where Active = 1   ORDER BY UserName");
        cmd.Connection = conn;
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        DataTable dt = new DataTable();
        cmd.CommandTimeout = 5000;
        dt.Load(cmd.ExecuteReader());
        conn.Close();

        DDLUserName.DataSource = dt;
        DDLUserName.DataTextField = "UserName";
        DDLUserName.DataValueField = "UserId";
        DDLUserName.DataBind();
        DDLUserName.Items.Insert(0, new ListItem(String.Empty, String.Empty));
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GVForm.Rows)
        {
            CheckBox CheckBoxPriviledge = (CheckBox)row.FindControl("CheckBoxPriviledge");
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

        command.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(DDLUserName.SelectedValue);
        command.Parameters.Add("@FormId", SqlDbType.Int).Value = Convert.ToInt32(FormId);
        command.Parameters.Add("@CreateUserId", SqlDbType.Int).Value = Convert.ToInt32(lblUserID.Text);         

        if (conn.State.ToString() == "Closed")
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

    public DataTable GVBind()
    {
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }

        DataTable dtGridView = new DataTable();
        SqlCommand cmd = new SqlCommand("[LotusPro].[dbo].[sp_getWebForms] ", conn);
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
    public void GetUser(int userID)
    {
        SqlConnection conn = DB_Connect.GetConnection();
        conn.Open();

        string sql = " SELECT [Email] "
                   + " FROM [LotusPro].[dbo].[SystemUsers] "
                   + " WHERE [userID] = '" + userID + "'";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {
            lblEmail.Text = dr["Email"].ToString();
        };

        conn.Close();
    }
    protected void DDLUserName_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetUser(Convert.ToInt32(DDLUserName.SelectedValue));

    
    }
}