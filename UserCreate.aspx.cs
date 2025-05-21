using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserCreate : System.Web.UI.Page
{
  SqlConnection conn;
  public const string CON_ENCRYPT_KEY = "LOTUS";
    static int formid = 6;
    static int userId = 0;
    static string url = "UserCreate.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
    conn = DB_Connect.GetConnection1();
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

            GVUser.DataSource = GVBind();
            GVUser.DataBind();
        }
  }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
    if (txtUserName.Text == "" || txtPassword.Text == "" || txtConfirmPassword.Text == "" || txtemailAddress.Text == "")
    {
      WebMsgBox.Show("Please enter relevant data to create user.");
      return;
    }

    string username = txtUserName.Text.Trim();
    string password = txtPassword.Text.Trim();
    string email = txtemailAddress.Text.Trim();
    string Comment = txtComment.Text;

    if (txtPassword.Text == txtConfirmPassword.Text)
    {
      password = Common.Encrypt(password, CON_ENCRYPT_KEY);
      ExecuteInsert(username, password, email,  Comment);

      GetUser(username, email);
     // BtnAccess.Enabled = true;

      WebMsgBox.Show("New User created successfully! User ID : " +lblUserID.Text + "/ User Name : "+txtUserName.Text);
     
      GVUser.DataSource = GVBind();
      GVUser.DataBind();
      ClearControls(Page);
    }
    else
    {
      WebMsgBox.Show("Password did not match");
      txtPassword.Focus();
    }
  }

  public void GetUser(string username, string email)
  {
    SqlConnection conn = DB_Connect.GetConnection1();
    conn.Open();

    string sql = " SELECT [UserID] "
               + " FROM [LotusPro].[dbo].[SystemUsers] "
               + " WHERE [UserName] = '" + username + "' AND [Email] = '" + email + "' ";

    SqlCommand newCmd = conn.CreateCommand();
    newCmd.Connection = conn;
    newCmd.CommandType = CommandType.Text;
    newCmd.CommandText = sql;
    SqlDataReader dr = newCmd.ExecuteReader();

    while (dr.Read())
    {
      lblUserID.Text = dr["UserID"].ToString();
    };

    conn.Close();
  }
  public static void ClearControls(Control Parent)
  {

    if (Parent is TextBox)
    { (Parent as TextBox).Text = string.Empty; }
    else
    {
      foreach (Control c in Parent.Controls)
        ClearControls(c);
    }
  }
  private void ExecuteInsert(string username, string password, string email,string Comment)
  {
    
    conn = DB_Connect.GetConnection1();
    conn.Open();

    string sql = "Exec [LotusPro].[dbo].sp_insertSystemUsers '" + username + "','"+password+"','"+email+"',0,'"+ Comment + "',0";

    try
    {
      SqlCommand cmd = new SqlCommand(sql, conn);    
      cmd.CommandType = CommandType.Text;
      cmd.ExecuteNonQuery();
    }
    catch (System.Data.SqlClient.SqlException ex)
    {
      string msg = "Insert Error:";
      msg += ex.Message;
      throw new Exception(msg);
    }
    finally
    {
      conn.Close();
    }
  }

  public DataTable GVBind()
  {
    if (conn.State.ToString() == "Closed")
    {
      conn.Open();
    }

    DataTable dtGridView = new DataTable();
    SqlCommand cmd = new SqlCommand("[LotusPro].[dbo].[sp_getUserDetails] ", conn);
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


    protected void BtnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}
