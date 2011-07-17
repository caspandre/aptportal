using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

namespace APTPORTAL.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        string password;
        
        protected void Page_Load(object sender, EventArgs e)
        {        
        }

        protected void check_login(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(Common.cstring);
            SqlCommand q = new SqlCommand();
            conn.Open();

            q.Connection = conn;
            q.CommandText = "SELECT password FROM utente WHERE username = @username";
            q.Parameters.Add(new SqlParameter("username", LoginUser.UserName));
            SqlDataReader r = q.ExecuteReader();

            if (r.HasRows)
            {
                while(r.Read())
                {
                    password = r.GetString(r.GetOrdinal("password"));
                }
            }
            else
            {
                password = "";
            }

            if (LoginUser.Password == password)
            {
                FormsAuthentication.RedirectFromLoginPage(
                LoginUser.UserName, false);
            }
            else
            {
                LoginUser.FailureText = "Username o Password errati";
            }

            //LoginUser.FailureText = r.GetString(0);

        }
    }
}
