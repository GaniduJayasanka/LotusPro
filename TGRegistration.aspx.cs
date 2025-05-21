using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TGRegistration : System.Web.UI.Page
{
    SqlConnection conn;
    static string url = "TGRegistration.aspx";
    static int formid = 8;
    static int userId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {


        conn = DB_Connect.GetConnection1();
        if (!Page.IsPostBack)
        {
            gvTGRegistration.DataSource = GVBind();
            gvTGRegistration.DataBind();
        }
        }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        gvTGRegistration.DataSource = GVBind();
        gvTGRegistration.DataBind();
    }


    private DataTable GVBind()
    {
        DataTable dtGridView = new DataTable();
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("exec sp_GetTourGuideHeader '" + txtName.Text + "','" + TxtCompany.Text + "','" + txtAddress.Text + "','" + txtContact1.Text + "','" + txtContact2.Text + "','" + txtNIC.Text + "'", conn)) 
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {

    }

    protected void ButtonSave_Click(object sender, EventArgs e)
    {

    }

    protected void BbtnClear_Click(object sender, EventArgs e)
    {

    }
}