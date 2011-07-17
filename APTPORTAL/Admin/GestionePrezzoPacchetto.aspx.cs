using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APTPORTAL.Admin
{
    public partial class GestionePrezzoPacchetto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["new"] == "ok")
            {
                dettaglioPrezzoPacchetto.ChangeMode(DetailsViewMode.Insert);
            }
        }

        protected void aggiornaGridView(object sender, DetailsViewUpdatedEventArgs e)
        {
            prezziPacchetto.DataBind();
        }
    }
}