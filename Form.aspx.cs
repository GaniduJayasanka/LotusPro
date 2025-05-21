using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form : System.Web.UI.Page
{
    SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection1();
        if (!Page.IsPostBack)
        {
            GVForm.DataSource = GVBind();
            GVForm.DataBind();
        }
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (txtFormName.Text == "" || txtDescription.Text == "" )
        {
            WebMsgBox.Show("Please enter relevant data to create web form.");
            return;
        }
        else
        {
            ExecuteInsert(txtFormName.Text, txtDescription.Text);
            WebMsgBox.Show("New User created successfully!");               
             GVForm.DataSource = GVBind();
            GVForm.DataBind();
            txtFormName.Text = "";
            txtDescription.Text = "";
            //ClearControls(Page);
        }
          

          
    }

    private void ExecuteInsert(string WebForm, string Descriptions)
    {

        conn = DB_Connect.GetConnection1();
        conn.Open();

        string sql = "Exec [LotusPro].[dbo].sp_insertWebForms '" + WebForm + "','" + Descriptions + "'";

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


    protected void BtnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl); 
    }
}