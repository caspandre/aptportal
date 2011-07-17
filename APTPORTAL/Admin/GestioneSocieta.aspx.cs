using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;

namespace APTPORTAL.Admin
{
    public partial class GestioneSocieta : System.Web.UI.Page
    {                
        SqlConnection conn = new SqlConnection(Common.cstring);
        int idSocieta;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.DataBind();
            if (Request.QueryString["ID"] != null)
            {
                idSocieta = Int32.Parse(Request.QueryString["ID"]);
            }

            //link per inserimento nuova struttura
            string url = "~/Admin/GestioneStruttura.aspx";
            l_nuovaStruttura.NavigateUrl = url+"?idSocieta="+idSocieta+"&new=ok";
        }

        protected void inviaMail(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "inviaMail")
            { 
                //pagina invio mail
                Response.Redirect("~/Admin/InviaMail.aspx" + "?ID=" + idSocieta);

                }
            

        
        }

        protected void societaUpdate(object sender, DetailsViewUpdatedEventArgs e)
        {

            try
            {
                //quando faccio update per la societa sistemo l'username per l'utente
                string username = e.NewValues["email"].ToString();
                SqlCommand qUp = new SqlCommand();
                qUp.Connection = conn;

                conn.Open();

                qUp.CommandType = CommandType.StoredProcedure;
                qUp.CommandText = "updateUsername";
                qUp.Parameters.Add(new SqlParameter("idSocieta", idSocieta));
                qUp.Parameters.Add(new SqlParameter("username", username));

                qUp.ExecuteNonQuery();

                result.Text = "Società aggiornata correttamente";
                dettaglioUtente.DataBind();
            }
            catch (Exception ex)
            {
                result.Text = "Si è verificato un errore durante la query: " + ex.Message; 
            }




        }




    }
}