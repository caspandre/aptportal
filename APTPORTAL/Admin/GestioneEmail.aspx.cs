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
    public partial class GestioneEmail : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(Common.cstring);

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Request.QueryString["ID"] != null)&&(!IsPostBack))

            { 
                SqlCommand q = new SqlCommand();
                q.Connection = conn;
                conn.Open();
                q.CommandText = "SELECT * FROM templateEmail WHERE idEmail = @idEmail";
                q.Parameters.Add(new SqlParameter("idEmail", Request.QueryString["ID"]));

                SqlDataReader r = q.ExecuteReader();
                r.Read();
                nomeEmail.Text = r["nomeEmail"].ToString();

                corpoEmail.Content = r["testoEmail"].ToString();
                conn.Close();
            }

        }

        protected void salvaTemplate(object sender, EventArgs e)
        {            
            string newcontent = corpoEmail.Content;

            if (newcontent != "")
            { 
                SqlCommand q2 = new SqlCommand();
                q2.Connection = conn;
                conn.Open();
                q2.CommandText = "UPDATE templateEmail SET testoEmail = @testo WHERE idEmail = @idEmail";

                q2.Parameters.Add(new SqlParameter("testo",newcontent ));
                q2.Parameters.Add(new SqlParameter("idEmail", Request.QueryString["ID"]));

                q2.ExecuteNonQuery();
            }


        }
    }
}