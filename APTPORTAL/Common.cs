using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace APTPORTAL
{
    public static class Common
    {
        public static string appName = "APTPORTAL";
        public static string appVersion = "1.0";
        //connessione db
        public static string cstring = ConfigurationManager.ConnectionStrings["aptportal"].ConnectionString;
        public static string immaginiServizi = "/images/icone_servizi/";
        public static string defaulLocalita = "Livigno";
        public static string defaulProvincia = "SO";
        public static string defaulStato = "Italia";

        
    }
}