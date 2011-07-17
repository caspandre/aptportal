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
    public partial class InviaMail : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(Common.cstring);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void send_Click(object sender, EventArgs e)
        {
            Int32 idSocieta = Int32.Parse(Request.QueryString["ID"]);
            Int32 idEmail = Int32.Parse(templateMail.SelectedValue);

            SqlCommand q = new SqlCommand();
            q.Connection = conn;
            conn.Open();
            q.CommandType = CommandType.StoredProcedure;
            q.CommandText = "getUtente";
            q.Parameters.Add(new SqlParameter("idSocieta", idSocieta));

            SqlDataReader r = q.ExecuteReader();

            //Response.Write(r["email"]);
            r.Read();

            //invio mail - se va a buon fine ok!
            InvioMail m = new InvioMail();
            if (m.inviaMailPassword(r["username"].ToString(),idEmail))
            {
                result.Text = "Mail inviata con successo a " + r["username"].ToString();
            }
        }
    }
}