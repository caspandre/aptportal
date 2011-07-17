using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using AjaxControlToolkit;

namespace APTPORTAL.Admin
{
    public partial class NuovaSocieta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void defaultProvincia(object sender, EventArgs e)
        {

            //valore di default in alcuni campi
            localita.Text = Common.defaulLocalita;
            provincia.Items.FindByValue(Common.defaulProvincia).Selected = true;
        }

        protected void salvaSocieta(object sender, EventArgs e)
        {
            try 
	        {
                Page.Validate();
                if (!Page.IsValid)
                {
                    return;
                }

	            //controllo esistenza email
                if (!checkEmail(email.Text))
                {
                    check_mail.Text = "Attenzione: mail già presente nel sistema";
                    return;
                }

                //controllo ragione sociale
                if (!checkRagioneSociale(ragioneSociale.Text))
                {
                    check_rs.Text = "Attenzione: ragione sociale già presente nel sistema";
                    return;
                }
                
                //controllo ragione sociale
                if (!checkCF(cf.Text) && (cf.Text != ""))
                {
                    check_cf.Text = "Attenzione: Codice Fiscale già presente nel sistema";
                    return;
                }


		         //salvo societa nel db
                SqlConnection conn = new SqlConnection(Common.cstring);
                conn.Open();

                //utilizzo l'username come password
                string username = email.Text;
                //random password di 8 caratteri
                string password = System.Guid.NewGuid().ToString().Substring(0, 8);

                SqlCommand q = new SqlCommand();
                q.CommandText = "inserisciSocieta";
                q.CommandType = CommandType.StoredProcedure;
                q.Connection = conn;

                q.Parameters.Add(new SqlParameter("ragioneSociale",ragioneSociale.Text));
                q.Parameters.Add(new SqlParameter("codiceFiscale", cf.Text));
                q.Parameters.Add(new SqlParameter("indirizzo", indirizzo.Text));
                q.Parameters.Add(new SqlParameter("email", email.Text));
                q.Parameters.Add(new SqlParameter("username", username));
                q.Parameters.Add(new SqlParameter("password", password));
                q.Parameters.Add(new SqlParameter("telefono", telefono.Text));
                q.Parameters.Add(new SqlParameter("localita", localita.Text));
                q.Parameters.Add(new SqlParameter("provincia", provincia.SelectedValue));
                q.Parameters.Add(new SqlParameter("cap", cap.Text));
                q.Parameters.Add(new SqlParameter("stato", stato.Text));
                q.Parameters.Add(new SqlParameter("idTipoPagamento", tipoPagamento.SelectedValue));
                q.Parameters.Add(new SqlParameter("iban", iban.Text));



                SqlParameter idSocieta = new SqlParameter("idSocieta", null);
                idSocieta.Direction = ParameterDirection.ReturnValue;

                q.Parameters.Add(idSocieta);

                q.ExecuteNonQuery();

                result.Text = string.Format("Società inserita correttemente, username: {0}, password: {1}", username, password);
                conn.Close();

                //redirect alla pagina per l'inserimento della prima struttura
                Response.Redirect("/admin/GestioneStruttura.aspx?idSocieta=" + idSocieta.Value+"&new=ok&newSocieta=ok");
                
	        }
	        catch (Exception ex)
	        {
                result.CssClass="error";
		        result.Text = "errore durante la query:" + ex.Message;
		        //throw;
	        }
           

            

        }

        protected Boolean checkEmail(string email)
        {
            SqlConnection conn = new SqlConnection(Common.cstring);
            conn.Open();

            SqlCommand q = new SqlCommand();
            q.Connection = conn;
            q.CommandText = "SELECT idSocieta FROM anagraficaSocieta WHERE email = @email";
            q.Parameters.Add(new SqlParameter("email", email));
            SqlDataReader r = q.ExecuteReader();

            if (r.HasRows)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        protected Boolean checkRagioneSociale(string ragioneSociale)
        {
            SqlConnection conn = new SqlConnection(Common.cstring);
            conn.Open();

            SqlCommand q = new SqlCommand();
            q.Connection = conn;
            q.CommandText = "SELECT idSocieta FROM anagraficaSocieta WHERE ragioneSociale = @rs";
            q.Parameters.Add(new SqlParameter("rs", ragioneSociale));
            SqlDataReader r = q.ExecuteReader();

            if (r.HasRows)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        protected Boolean checkCF(string cf)
        {
            SqlConnection conn = new SqlConnection(Common.cstring);
            conn.Open();

            SqlCommand q = new SqlCommand();
            q.Connection = conn;
            q.CommandText = "SELECT idSocieta FROM anagraficaSocieta WHERE codiceFiscale = @cf";
            q.Parameters.Add(new SqlParameter("cf", cf));
            SqlDataReader r = q.ExecuteReader();

            if (r.HasRows)
            {
                return false;
            }
            else
            {
                return true;
            }

        }
    }
}