<%@ WebHandler Language="C#" Class="Event" %>

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.IO;
using System.Web.Script.Serialization;

public class Event : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";


        context.Response.Expires = -1;
        IList<CalendarDTO> tasksList = new List<CalendarDTO>();

        string Buyer_str = context.Request.QueryString["Buyer"];
        string Style_str = context.Request.QueryString["StyleID"];
        string Plant_str = context.Request.QueryString["PlantId"];

        int StyleId = (!string.IsNullOrEmpty(Style_str) ? Convert.ToInt32(Style_str) : 0);
        int Buyer = (!string.IsNullOrEmpty(Buyer_str) ? Convert.ToInt32(Buyer_str) : 0);
        int PlantID = (!string.IsNullOrEmpty(Plant_str) ? Convert.ToInt32(Plant_str) : 0);
        SqlConnection conn;
        conn = DB_Connect.GetConnection();
        string sql = "[dbo].[procMSPDeliveryPlan] '','','','','','', '','','" + StyleId + "','" + Buyer + "','" + PlantID + "','',5 ";

        using (SqlCommand cmd = new SqlCommand())
        {
            if (conn.State.ToString() == "Closed")
            {
                conn.Open();
            }
            cmd.CommandText = sql;
            cmd.Connection = conn;

            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    string HeaderText = Convert.ToString(sdr["BuyerCode"]);
                    string descript = "Style: " + Convert.ToString(sdr["StyleNo"]) + "<br/> Colour : " + Convert.ToString(sdr["ColorName"]) + " <br/> Plant : " + Convert.ToString(sdr["ScheduledFactory"]) + " <br/>DEL#" + Convert.ToString(sdr["DeliveryNo"]) + "  <br/>QTY :" + Convert.ToString(sdr["DeliveryQty"]) + "<br/> PCS  Com:" + Convert.ToString(sdr["Comment"]) + "";
                    string deldate = "";
                    if (!DBNull.Value.Equals(sdr["DeliveryDate"]))
                    {
                        DateTime deliveryDate = Convert.ToDateTime(sdr["DeliveryDate"]);
                        deldate = deliveryDate.ToString("yyy-MM-dd");
                    }

                    tasksList.Add(new CalendarDTO
                    {
                        title = HeaderText,
                        start = deldate,
                        description = descript
                    });
                }
            }
            conn.Close();
        }


        System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
         new System.Web.Script.Serialization.JavaScriptSerializer();
        string sJSON = oSerializer.Serialize(tasksList);
        context.Response.Write(sJSON);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    public class CalendarDTO
    {
        public string title { get; set; }
        public string description { get; set; }
        public string start { get; set; }
    }
}