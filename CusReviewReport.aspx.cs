using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CusReviewReport : System.Web.UI.Page
{
    SqlConnection conn;
    static string url = "CusReviewReport.aspx";
    static int formid = 5;
    static int userId = 0;

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
                    Server.Transfer("~/home.aspx", true);
                }
            }

            lblUserID.Text = userId.ToString();
            GetUser(userId);
        }

            //LoadCompletedTasks();
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

            lblUser.Text = dr["UserName"].ToString();


        };

        conn.Close();
    }

    //private void LoadCompletedTasks()
    //{
    //    try
    //    {
    //        using (SqlConnection connection = DB_Connect.GetConnection())
    //        {
    //            connection.Open();

    //            using (SqlCommand command = new SqlCommand("[VM].[dbo].sp_CustomerReviews '"+ BasicDatePickerFromDate.Text+ "','" + BasicDatePickerToDate.Text + "'", connection)) // Modify this query
    //            {
    //                command.CommandType = CommandType.StoredProcedure;
    //                //command.Parameters.AddWithValue("@MTID", DDLMainTask.SelectedValue);
    //                //command.Parameters.AddWithValue("@STID", DDLSubTask.SelectedValue);
    //                //command.Parameters.AddWithValue("@status", DDLSearch.SelectedValue);
    //                //command.Parameters.AddWithValue("@TaskRef_No", txtTaskRefNo.Text);

    //                using (SqlDataReader reader = command.ExecuteReader())
    //                {
    //                    DataTable dt = new DataTable();
    //                    dt.Load(reader);

    //                    gvCompletedTasks.DataSource = dt;
    //                    gvCompletedTasks.DataBind();
    //                }
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Console.WriteLine(ex.ToString());
    //    }
    //}

    protected void btnFind_Click(object sender, EventArgs e)
    {
        gvCustomerFeedback.DataSource = GVBind();
        gvCustomerFeedback.DataBind();

       
    }


    private DataTable GVBind()
    {
        DataTable dtGridView = new DataTable();
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        using (SqlCommand cmd = new SqlCommand("exec [VM].[lotusTest].[sp_CustomerReviews] '" + BasicDatePickerFromDate.Text + "','" + BasicDatePickerToDate.Text + "' ", conn))
        {
            cmd.CommandTimeout = 180;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtGridView);
        }

        conn.Close();
        return dtGridView;
    }
    protected void BbtnClear_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
      //  Response.Redirect("LoginPage.aspx");
        Response.Redirect(Request.RawUrl);
    }

    protected void ButtonExport_Click(object sender, EventArgs e)
    {

    }

    protected string GetStarRatingStars(object starRating)
    {
        if (starRating != null && starRating != DBNull.Value)
        {
            int rating = Convert.ToInt32(starRating);
            string ratedStars = new string('★', rating);
            string emptyStars = new string('★', 5 - rating);

            string starsHtml = "<span title='" + rating + "' style='font-size: 30px; color: #ffd700; direction: ltr;'>" + ratedStars + "</span>" +
                               "<span title='" + (5 - rating) + "' style='font-size: 30px; color: #e3dfca; direction: ltr;'>" + emptyStars + "</span>";

            return starsHtml;
        }
        return string.Empty;
    }

    protected void btnAction_Click(object sender, EventArgs e)
    {
        Button LinkInvVsDispatched = (Button)sender;
        GridViewRow grdRow = (GridViewRow)LinkInvVsDispatched.NamingContainer;

        LinkButton CustomerReviewId = (LinkButton)grdRow.FindControl("BtnCustomerReviewId");
        Label CRID = (Label)grdRow.FindControl("lblCRID");
        Label FirstName = (Label)grdRow.FindControl("FirstName");
        //  Response.Redirect("BuyerInvVsDispatch.aspx?Buyer=" + BuyerName.Text + "&fromDate=" + DatePickerFromDate.Text + "&ToDate=" + DatePickerToDate.Text + "&BuyerID=" + BuyerID.Text + "&Orderno=" + lblOrderNo.Text + "&Status=" + drpdwnStatus.SelectedValue);
        Response.Write("<script>");
        Response.Write(String.Format("window.open('{0}','_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,resizable=yes,width=1150px,height=550px')", ResolveUrl("CusReviewAction.aspx?CustomerReviewId=" + CustomerReviewId.Text + "&CRID=" + CRID.Text + "")));
        Response.Write("</script>");
    }
}