using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Net;

public partial class CustomerReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        string firstName = txtFirstName.Text;
        string lastName = txtLastName.Text;
        string email = txtEmail.Text;
        string contactNo = txtContactNo.Text;
        string inquiry = txtInquiry.Text;

        string customerReviewId = GenerateCustomerReviewId();

        InsertDataIntoDatabase(customerReviewId, firstName, lastName, email, contactNo, inquiry);

        ClearInputFields();

        string submitMessage = "Customer Review submitted successfully!";
        Response.Write("<script>alert('" + submitMessage + "');</script>");
    }

    private string GenerateCustomerReviewId()
    {
        int nextId = GetNextCustomerIdFromDatabase();
        // Auto-generated format = CSR0001
        return "CSR" + (nextId + 1).ToString("D4");
    }

    private int GetNextCustomerIdFromDatabase()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;

        string query = "SELECT ISNULL(MAX(CAST(SUBSTRING(CustomerReviewId, 4, LEN(CustomerReviewId) - 3) AS INT)), 0) FROM [VM].[dbo].[CustomerReviews]";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                return (int)command.ExecuteScalar();
            }
        }
    }

    private void InsertDataIntoDatabase(string customerId, string firstName, string lastName, string email, string contactNo, string inquiry)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;

        string query = "INSERT INTO [VM].[dbo].[CustomerReviews] (CustomerReviewId, FirstName, LastName, Email, ContactNo, Inquiry) " +
                       "VALUES (@CustomerReviewId, @FirstName, @LastName, @Email, @ContactNo, @Inquiry)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@CustomerReviewId", customerId);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@ContactNo", contactNo);
                command.Parameters.AddWithValue("@Inquiry", inquiry);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    private void ClearInputFields()
    {
        txtFirstName.Text = string.Empty;
    txtLastName.Text = string.Empty;
    txtEmail.Text = string.Empty;
    txtContactNo.Text = string.Empty;
    txtInquiry.Text = string.Empty;
    }

    protected void SendMail_ToCustomer(string seniormeremail)
    {

        //    string senderEmail = "msamankula@gmail.com";
        //    string senderPassword = "Lotus@2023";

        //    // Recipient email address
        //    string recipientEmail = "madhushikasamankula9277@gmail.com";


        //    // Create a new MailMessage object
        //    MailMessage mail = new MailMessage(senderEmail, recipientEmail);

        //    // Set the subject and body of the email
        //    mail.Subject = "Test Email from C#";
        //    mail.Body = "This is a test email sent from a C# application.";

        //    // Create a new SmtpClient object with SMTP server settings
        //    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

        //    // Enable SSL/TLS
        //    smtpClient.EnableSsl = true;
        //    //smtpClient.EnableSsl = true;
        //    smtpClient.UseDefaultCredentials = false;
        //    // Set credentials (email account credentials)
        //    smtpClient.Credentials = new NetworkCredential(senderEmail, senderPassword);

        //    try
        //    {
        //        // Send the email
        //        smtpClient.Send(mail);
        //       WebMsgBox.Show("Email sent successfully.");
        //    }
        //    catch (Exception ex)
        //    {
        //        WebMsgBox.Show("Error sending email: " + ex.Message);
        //    }
        //}

        // Response.Clear();
        // Response.Buffer = true;

        // /////////////////////////////////////////////////////////////////////////////////////
        // StringWriter sw = new StringWriter();
        // HtmlTextWriter hw = new HtmlTextWriter(sw);

        // //GVMSizeDetails.AllowPaging = false;

        // //for (int i = 0; i < GVMSizeDetails.Rows.Count; i++)
        // //{
        // //    GridViewRow row = GVMSizeDetails.Rows[i];
        // //    row.Attributes.Add("class", "textmode");
        // //}

        // //GVMSizeDetails.RenderControl(hw);

        // //string stylez = @"<style> .textmode { mso-number-format:\@; } </style>";
        // ////if (variance < 0) /// Short Shipment Group
        // //Response.Write(stylez);
        ////-----------------------------------------------------
        // MailMessage message = new MailMessage();



        //// message.To.Add(seniormeremail);
        //message.To.Add("madhushikas@colombolotustower.lk");
        //message.To.Add("madhawar@colombolotustower.lk");
        ////// message.CC.Add("eshaka@sumithra.lk");
        ////message.CC.Add("gayan@sumithra.lk");
        ////message.CC.Add("madhushika@sumithra.lk");

        //message.From = new MailAddress("info@colombolotustower.lk", "LotusPro");
        //message.Subject = "Shipment Dispatch Note has been Released. ";

        //message.IsBodyHtml = true;
        //message.Body = "Hi ,This email has been automatically generated by ApMas system.Pls do not reply";

        //SmtpClient client = new SmtpClient("smtp.office365.com", 587);
        //client.password = 
        //client.Send(message);


    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        emailsend();
    }

    public void emailsend()
    {
        // Sender email address and password
        string senderEmail = "madhushikas@colombolotustower.lk";
        string senderPassword = "Lotus@2023";

        // Recipient email address
        string recipientEmail = "msamankula@gmail.com";

        // Create a new MailMessage object
        MailMessage mail = new MailMessage(senderEmail, recipientEmail);

        // Set the subject and body of the email
        mail.Subject = "Test Email from C#";
        mail.Body = "This is a test email sent from a C# application.";

        // Create a new SmtpClient object with Office 365 SMTP server settings
        SmtpClient smtpClient = new SmtpClient("smtp.office365.com", 587);

        // Enable SSL/TLS
        smtpClient.EnableSsl = true;

        // Set credentials (Office 365 account credentials)
        smtpClient.Credentials = new NetworkCredential(senderEmail, senderPassword);


        //try
        //{
            // Send the email
            smtpClient.Send(mail);
            WebMsgBox.Show("Email sent successfully.");
       // }
        //catch (Exception ex)
        //{
        //    WebMsgBox.Show("Error sending email: " + ex.Message);
        //}


    }
}