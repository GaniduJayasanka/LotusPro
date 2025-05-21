using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Login_Common : System.Web.UI.Page
{
    static string url = "";
    SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            conn = DB_Connect.GetConnection1();

            url = Request.QueryString["url"];
            Labelmsg.Visible = false;

            if (url == null)
            {
                return;
            }


            if (Session["UserID"] != null && Session["DesUName"] != null)
            {
                if ((url != ""))
                {
                    Server.Transfer("~/" + url + "?UserID=" + Convert.ToInt32(Session["UserID"].ToString()) + "", true);
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string mLoginName = txtusername.Text;
        string mLoginPassword = txtpassword.Text;
        mLoginPassword = Common.Encrypt(mLoginPassword, Common.CON_ENCRYPT_KEY);

        string testdecrypt = Common.Decrypt(mLoginPassword, Common.CON_ENCRYPT_KEY);
        conn = DB_Connect.GetConnection1();


        if (conn.State.ToString() == "Closed")
        {
           conn.Open();
        }

        string sql = " SELECT DISTINCT * FROM [LotusPro].[dbo].[SystemUsers] WHERE UserName = '" + mLoginName + "' AND Password = '" + mLoginPassword + "' ";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader sdr = cmd.ExecuteReader();

        if (sdr.Read())
        {
                Session["LoggedIn"] = "true";
                Session["UserID"] = sdr["UserID"].ToString();
                Session["DesUName"] = sdr["UserName"].ToString();

                if (url != "")
                {
                    Server.Transfer("~/" + url + "?UserID=" + Convert.ToInt32(Session["UserID"].ToString()) + "", true);
                }
        }
        else
        {
            Session["LoggedIn"] = "false";
            Labelmsg.Visible = true;
        }
        sdr.Close();
        conn.Close();                
    }
   

}
