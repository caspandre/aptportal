using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace APTPORTAL.Admin
{
    public partial class Servizi : System.Web.UI.Page
    {

        private SqlConnection conn = new SqlConnection(Common.cstring);
         
        protected void Page_Load(object sender, EventArgs e)
        {
            if (listaServizi.Items.Count == 0)
            {
                caricaServizi();
            }
            
        }

        protected void caricaServizi() 
        {
            //carico i checkbox
            SqlCommand q1 = new SqlCommand();
            conn.Open();
            q1.Connection = conn;
            q1.CommandText = "SELECT * FROM servizio";
            SqlDataReader r1 = q1.ExecuteReader();

            //riferimento alla checkboxlist


            while (r1.Read())
            {
                if (!r1.IsDBNull(r1.GetOrdinal("immagineServizio")))
                {

                    string urlImage = Common.immaginiServizi + r1.GetString(r1.GetOrdinal("immagineServizio"));
                    string nomeServizio = r1.GetString(r1.GetOrdinal("servizio"));
                    Int32 val = r1.GetInt32(r1.GetOrdinal("idServizio"));
                    string value = val.ToString();

                    listaServizi.Items.Add(
                    new ListItem(
                        string.Format("<img src='{0}' alt=''/>{1}", urlImage, nomeServizio), value
                        )
                    );
                }
                else
                {
                    string nomeServizio = r1.GetString(r1.GetOrdinal("servizio"));
                    Int32 val = r1.GetInt32(r1.GetOrdinal("idServizio"));
                    string value = val.ToString();

                    listaServizi.Items.Add(
                    new ListItem(
                        string.Format("{0}", nomeServizio), value
                        )
                    );
                }

            }

            r1.Close();
            conn.Close();
        }

        protected void checkCampi(object sender, EventArgs e)
        {
            //nascondo label
            result.Visible = false;

            //se non ho selezionato il valore i check sono disabilitati
            if (tipologia.SelectedValue == "-1")
            {
                listaServizi.Enabled = false;
            }
            else
            {
                listaServizi.Enabled = true;
            }


            //azzero i campi
            foreach (ListItem li in listaServizi.Items)
            {
                li.Selected = false;
            }

            //per ogni struttura estraggo dal db i servizi abilitati
            //string cstring = ConfigurationManager.ConnectionStrings["aptportalConnectionString"].ConnectionString;
            conn.Open();
            SqlCommand q = new SqlCommand();
            
            q.CommandText = "getServizioTipologia";
            q.Connection = conn;
            q.CommandType = CommandType.StoredProcedure;
            q.Parameters.Add(new SqlParameter("idTipologia",tipologia.SelectedValue));

            SqlDataReader r = q.ExecuteReader();
            selezionaCampi(r);

            r.Close();
            conn.Close();   
        }

        void selezionaCampi(SqlDataReader r) 
        { 
            //vado acheccare i campi selezionati
            if (r.HasRows) 
            {
                while (r.Read())
                {
                    int val = r.GetInt32(0);
                    listaServizi.Items.FindByValue(val.ToString()).Selected=true;
                }
            }
            
        }

        protected void salvaServizi(object sender, EventArgs e)
        {

            //azzero i servizi per la data tabella
            SqlConnection conn = new SqlConnection(Common.cstring);
            conn.Open();
            SqlCommand qDel = new SqlCommand("delServizioTipologia", conn);
            qDel.Parameters.Add(new SqlParameter("idTipologia", tipologia.SelectedValue));
            qDel.CommandType = CommandType.StoredProcedure;
            qDel.ExecuteNonQuery();


            //per ogni checkbox selezionata vado ad inserire il servizio
            foreach (ListItem item in listaServizi.Items)
            {
                if (item.Selected)
                {
                    SqlCommand q = new SqlCommand("setServizioTipologia",conn);
                    q.Parameters.Add(new SqlParameter("idTipologia",tipologia.SelectedValue));
                    q.Parameters.Add(new SqlParameter("idServizio",item.Value));
                    q.CommandType = CommandType.StoredProcedure;
                    q.ExecuteNonQuery();

                }
            }

            result.Visible = true;
            result.Text = "Salvataggio effetuato con successo.";
            
        }


        protected void optionChanged(object sender, EventArgs e)
        {
            result.Visible = false;
        }
    }
}