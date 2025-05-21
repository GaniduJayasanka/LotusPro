using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPasswordChange : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    public const string CON_ENCRYPT_KEY = "LOTUS";
    static int formid = 2;
    static int userid = 0;
    static string url = "UserPasswordChange.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            userid = Convert.ToInt32(Request.QueryString["UserID"]);

            if (userid == 0)
            {
                Server.Transfer("~/Login_Common.aspx?url=" + url + "", true);
            }

            if (Session["UserID"].ToString() == null)
            {
                Server.Transfer("~/Login_Common.aspx?url=" + url + "", true);
            }
            else
            {
            }

            GetUser(userid);

        }
    }

    public void GetUser(int id)
    {
        SqlConnection conn = DB_Connect.GetConnection();
        conn.Open();

        string sql = " SELECT [UserName],[Email] ,[Password]"
                   + "   FROM [LotusPro].[dbo].[SystemUsers] "
                   + " WHERE [UserID] = " + id + " ";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {
            txtUserName.Enabled = false;
            txtemailAddress.Enabled = false;
            txtUserName.Text = dr["UserName"].ToString();
            txtemailAddress.Text = dr["Email"].ToString();
            lblUser.Text = dr["UserName"].ToString();


        };

        conn.Close();
    }

    private static bool IsValidEmail(string email)
    {
        var r = new Regex(@"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$");

        return !string.IsNullOrEmpty(email) && r.IsMatch(email);
    }
    protected void BtnChange_Click(object sender, EventArgs e)
    {
        if (txtemailAddress.Text == "" || txtOldPassword.Text == "" || txtNewPassword.Text == "")
        {
            WebMsgBox.Show("Please enter relevant data to change password.");
            return;
        }

        if (!IsValidEmail(txtemailAddress.Text.Trim()))
        {
            WebMsgBox.Show("Invalid E-mail Address !");
            return;
        }

        if (txtNewPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
        {
            WebMsgBox.Show("New password does not match.");
            return;
        }

        string email = txtemailAddress.Text.Trim();
        string oldpassword = txtOldPassword.Text.Trim();
        string newpassword = txtNewPassword.Text.Trim();

        oldpassword = Common.Encrypt(oldpassword, CON_ENCRYPT_KEY);
        newpassword = Common.Encrypt(newpassword, CON_ENCRYPT_KEY);


        if (Get_User_Exist(email, oldpassword))
        {
            UpdatePassword(email, oldpassword, newpassword);
            txtemailAddress.Text = "";
            txtNewPassword.Text = "";
            txtOldPassword.Text = "";

            WebMsgBox.Show("Password successfully updated!");
        }
        else
        {
            WebMsgBox.Show("User does not exists or wrong email, password!");
            return;
        }

    }


    private void UpdatePassword(string email, string oldpassword, string newpassword)
    {
        SqlConnection conn;
        conn = DB_Connect.GetConnection();
        conn.Open();

        string sql = " UPDATE [LotusPro].[dbo].[SystemUsers] SET [Password] = '" + newpassword + "' "
                   + " WHERE [Email] = '" + email + "' AND [Password] = '" + oldpassword + "'  ";

        try
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            string msg = "Update Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            conn.Close();
        }
    }
    public bool Get_User_Exist(string email, string pass)
    {
        bool user_exist = false;

        SqlConnection conn;
        conn = DB_Connect.GetConnection();
        conn.Open();

        string sql = " SELECT [UserName] FROM [LotusPro].[dbo].[SystemUsers] "
                   + " WHERE [Email] = '" + email + "' AND [Password] = '" + pass + "' ";

        SqlCommand newCmd = conn.CreateCommand();
        newCmd.Connection = conn;
        newCmd.CommandType = CommandType.Text;
        newCmd.CommandText = sql;
        SqlDataReader dr = newCmd.ExecuteReader();

        while (dr.Read())
        {
            user_exist = true;
            return user_exist;
        };

        conn.Close();
        return user_exist;
    }

  
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}