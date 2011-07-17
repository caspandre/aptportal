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
    public partial class NuovoPacchetto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void inserisci_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(Common.cstring);
            SqlCommand q = new SqlCommand();
            q.Connection = conn;
            conn.Open();
            q.CommandType=CommandType.StoredProcedure;
            q.CommandText = "inserisciPacchetto";

            q.Parameters.Add("@nomePacchetto", nomePacchetto.Text);
            q.Parameters.Add("@descrizionePacchetto", descrizionePacchetto.Text);

            q.ExecuteNonQuery();
            conn.Close();

            result.Text = "Pacchetto inserito con successo";
        }
    }
}