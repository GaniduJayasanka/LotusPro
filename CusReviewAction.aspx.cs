using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class CusReviewAction : System.Web.UI.Page
{
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB_Connect.GetConnection1();

        if (Request.QueryString["CustomerReviewId"] != null)
        {
            lblCusReviewID.Text = Request.QueryString["CustomerReviewId"];
            lblCRID.Text = Request.QueryString["CRID"];

            if (!IsPostBack)
            {
                getDetails();

                if (CheckExistingInquiry(lblCRID.Text))
                {
                    txtAction.Enabled = false;
                    SaveBtn.Enabled = false;
                    ResetBtn.Enabled = false;

                    txtAction.Text = GetExistingInquiry(lblCRID.Text);
                }
            }
        }
    }

    private bool CheckExistingInquiry(string customerReviewId)
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [VM].[dbo].CustomerInquiry WHERE CustomerReviewId = @CustomerReviewId", conn);
        cmd.Parameters.AddWithValue("@CustomerReviewId", customerReviewId);

        int count = (int)cmd.ExecuteScalar();

        conn.Close();

        return count > 0;
    }

    private string GetExistingInquiry(string customerReviewId)
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        SqlCommand cmd = new SqlCommand("SELECT Inquiry FROM [VM].[dbo].CustomerInquiry WHERE CustomerReviewId = @CustomerReviewId", conn);
        cmd.Parameters.AddWithValue("@CustomerReviewId", customerReviewId);

        string inquiry = (string)cmd.ExecuteScalar();

        conn.Close();

        return inquiry;
    }

    public void getDetails()
    {
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand newCmd = new SqlCommand("SELECT TOP (1) [CRID],[CustomerReviewId],[FirstName] ,[LastName]  ,[Email]  ,[ContactNo]  ,Country,StarRating,[Inquiry]  ,[CreatedAt]    FROM[VM].[dbo].[CustomerReviews]  WHERE[CRID] = '" + lblCRID.Text + "'", conn);

        try
        {
            SqlDataReader dr1 = newCmd.ExecuteReader();
            while (dr1.Read())
            {
                if ((dr1["CRID"].ToString()) != "")
                {
                    lblFirstName.Text = dr1["FirstName"].ToString();
                    lblLastName.Text = dr1["LastName"].ToString();
                    lblEmail.Text = dr1["Email"].ToString();
                    lblContactNo.Text = dr1["ContactNo"].ToString();
                    lblCountry.Text = dr1["Country"].ToString();
                    lblreview.Text = dr1["Inquiry"].ToString();
                }

            }
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            string msg = "Retreive Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            conn.Close();
        }
    }

    protected void SaveBtn_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();

            string insertQuery = @"INSERT INTO CustomerInquiry (CustomerReviewId, Inquiry) VALUES (@CustomerReviewId, @Inquiry)";

            SqlCommand cmd = new SqlCommand(insertQuery, conn);
            cmd.Parameters.AddWithValue("@CustomerReviewId", lblCRID.Text);
            cmd.Parameters.AddWithValue("@Inquiry", txtAction.Text);

            cmd.ExecuteNonQuery();

            conn.Close();

            Response.Redirect(Request.RawUrl);
        }
        catch (SqlException ex)
        {
            if (ex.Number == 547)
            {
                Response.Write("Error: The provided CustomerReviewId does not exist in the CustomerReviews table.");
            }
            else
            {
                Response.Write("Error: " + ex.Message);
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            conn.Close();
        }
    }

    protected void ResetBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}