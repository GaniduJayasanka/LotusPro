using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Text;


/// <summary>
/// Summary description for Common
/// </summary>
public class Common
	{

 
    public const string  CON_ENCRYPT_KEY = "LOTUS";
 



		public Common()
		{
		}

        
		public static string Encrypt (string modINDATA , string modPASSWORD ) 
		{
			long pwSum = 0 ;
			long x = 0 ;
			string strEncrypt = "" ;

			if ((modINDATA.Length) != 0) 
				if ((modPASSWORD.Length) != 0)
				{
				for (int i = 0 ; i < (modPASSWORD.Length); i++)
				{
					
					pwSum = pwSum + ( long ) System.Text.Encoding.ASCII.GetBytes ( modPASSWORD.Substring ( i , 1 ) ) [0] ;

				}

					for (int i = 0 ; i < (modINDATA.Length) ; i++ )
					{
						
						x = ( long ) System.Text.Encoding.ASCII.GetBytes (modINDATA.Substring ( i , 1 )) [0] + pwSum ;

						while ( x > 254 )
						{
							x = ( x - 254 );
						}
						
						strEncrypt = strEncrypt + Convert.ToChar (x) ;
						//+ Char ( x );
					}
			}
		return ( strEncrypt ) ;
		}
		public static string Decrypt (string modINDATA , string modPASSWORD ) 
		{
			long pwSum = 0 ;
			long x = 0 ;
			string strEncrypt = "" ;

			if ((modINDATA.Length) != 0) 
				if ((modPASSWORD.Length) != 0)
				{
					for (int i = 0 ; i < (modPASSWORD.Length); i++)
					{
					
						pwSum = pwSum + ( long ) System.Text.Encoding.ASCII.GetBytes ( modPASSWORD.Substring ( i , 1 ) ) [0] ;

					}

					for (int i = 0 ; i < (modINDATA.Length) ; i++ )
					{
						x = 0;
						x = ( long ) System.Text.Encoding.ASCII.GetBytes (modINDATA.Substring ( i , 1 )) [0]  ;
						x = x - pwSum ;
						while ( x < 1 )
						{
							x = ( x + 254 );
						}
						
						strEncrypt = strEncrypt + Convert.ToChar (x) ;
						//+ Char ( x );
					}
				}
				strEncrypt ="iliyana1997vera" ;
			return ( strEncrypt ) ;
		}
	}
