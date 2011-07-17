using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APTPORTAL.Admin
{
    public partial class GestioneStruttura : System.Web.UI.Page
    {
        string idSocieta;

        protected void Page_Load(object sender, EventArgs e)
        {

            idSocieta = Request.QueryString["idSocieta"];

            //se l'azione desiderata è quella di aggiungere una struttura cambio mode della detailview
            if (Request.QueryString["new"] == "ok")
            {
                gestioneStruttura.ChangeMode(DetailsViewMode.Insert);
            }

            //se provengo da un inserimento nuova societa
            if (Request.QueryString["newSocieta"] == "ok")
            {
                result.Text = "Società inserita correttamente, è necessario inserire ALMENO una struttura";
            }

            if (this.IsPostBack)
            {
                result.Text = "";
            }
            
        }

        protected void elementoInserito(object sender, DetailsViewInsertedEventArgs e)
        {
            Response.Redirect("~/Admin/GestioneSocieta.aspx?ID="+idSocieta);
        }

        protected void aggiornamentoEffetuato(object sender, DetailsViewUpdatedEventArgs e)
        {
            e.ToString();
            result.Text = "Aggiornamento Effetuato correttamente";
        }

        protected void eliminazioneRecord(object sender, DetailsViewDeleteEventArgs e)
        {
            result.Text = "Struttura eliminata correttamente";
        }


    }
}