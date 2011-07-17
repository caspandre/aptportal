using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace APTPORTAL.Admin
{
    public partial class Campi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //carico tutti i campi disponibili
        protected void checkCampi(object sender, EventArgs e)
        {
            //nascondo label
            result.Text ="";

            //se non ho selezionato il valore i check sono disabilitati
            if (tipologia.SelectedValue == "-1")
            {
                listaCampi.Enabled = false;
            }
            else
            {
                listaCampi.Enabled = true;
            }


            //azzero i campi
            foreach (ListItem li in listaCampi.Items)
            {
                li.Selected = false;
            }

            //per ogni struttura estraggo dal db i servizi abilitati
            //string cstring = ConfigurationManager.ConnectionStrings["aptportalConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(Common.cstring);
            conn.Open();

            SqlCommand q = new SqlCommand();

            q.CommandText = "getCampoTipologia";
            q.Connection = conn;
            q.CommandType = CommandType.StoredProcedure;
            q.Parameters.Add(new SqlParameter("idTipologia", tipologia.SelectedValue));

            SqlDataReader r = q.ExecuteReader();
            selezionaCampi(r);

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
                    listaCampi.Items.FindByValue(val.ToString()).Selected = true;
                }
            }

        }

        protected void salvaCampi(object sender, EventArgs e)
        {
            //result.Visible = false;

            //azzero i servizi per la data tabella
            SqlConnection conn = new SqlConnection(Common.cstring);
            conn.Open();
            SqlCommand qDel = new SqlCommand("delCampoTipologia", conn);
            qDel.Parameters.Add(new SqlParameter("idTipologia", tipologia.SelectedValue));
            qDel.CommandType = CommandType.StoredProcedure;
            qDel.ExecuteNonQuery();


            //per ogni checkbox selezionata vado ad inserire il servizio
            foreach (ListItem item in listaCampi.Items)
            {
                if (item.Selected)
                {
                    SqlCommand q = new SqlCommand("setCampoTipologia", conn);
                    q.Parameters.Add(new SqlParameter("idTipologia", tipologia.SelectedValue));
                    q.Parameters.Add(new SqlParameter("idCampo", item.Value));
                    q.CommandType = CommandType.StoredProcedure;
                    q.ExecuteNonQuery();

                }
            }

            //result.Visible = true;
            result.Text = "Salvataggio effetuato con successo.";

        }
    }
}