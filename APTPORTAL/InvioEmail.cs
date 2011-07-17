using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.Web.Configuration;
using System.Net.Configuration;
using System.Net;
using System.Data.SqlClient;

namespace APTPORTAL
{
    public class InvioMail
    {
        SqlConnection conn = new SqlConnection(Common.cstring);

        public Boolean inviaMailPassword(String to,Int32 idEmail){


            //estraggo configurazione dal file host
            Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            MailSettingsSectionGroup settings = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");


            SmtpClient SMTPServer = new SmtpClient(settings.Smtp.Network.Host,settings.Smtp.Network.Port);
            NetworkCredential oNetworkCredential = new NetworkCredential(settings.Smtp.Network.UserName, settings.Smtp.Network.Password);
            SMTPServer.UseDefaultCredentials = false;
            SMTPServer.Credentials = oNetworkCredential;

            //estraggo testo email
            conn.Open();
            SqlCommand q2 = new SqlCommand();
            q2.Connection = conn;
            q2.CommandText = "SELECT testoEmail FROM templateEmail WHERE idEmail = @email ";
            q2.Parameters.Add(new SqlParameter("email", idEmail));

            SqlDataReader r2 = q2.ExecuteReader();
            r2.Read();

            //DEVO SOSTITUIREI I PARAMETRI

            MailMessage mailObj = new MailMessage("info@livigno.eu", to, "prova", r2["testoEmail"].ToString());
            mailObj.IsBodyHtml = true;

            try
            {
                SMTPServer.Send(mailObj);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                //Label1.Text = ex.ToString();
            }
        }

    }
}