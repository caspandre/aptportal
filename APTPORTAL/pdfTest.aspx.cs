using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using System.IO;
using System.Collections;
using System.Net;
using System.Xml;
using iTextSharp.text.html.simpleparser;
using System.Collections.Generic;

namespace APTPORTAL
{
    public partial class pdfTest : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void CreatePDF()
        {
            MemoryStream MStream = new MemoryStream();
            Document document = new Document(PageSize.A4, 80, 50, 30, 65);
            try
            {
                PdfWriter writer = PdfWriter.GetInstance(document, MStream);
                document.Open();
                document.Add(new iTextSharp.text.Paragraph("This is test and must work"));
                string h = "<a>dsfdfsdf</a><br><br><h1>sdfsdfsd</h1>";
                TextReader sReader = new StringReader(h);
                List<IElement> l = HTMLWorker.ParseToList(sReader,new StyleSheet());

                foreach (IElement i  in l)
                {
                    document.Add(i);
                }

                document.Close();
            }
            catch (Exception e)
            {
                throw e;
            }



            //stampo pdf
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment;filename=myPDFNew.pdf");
            Response.BinaryWrite(MStream.GetBuffer());
            Response.End();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CreatePDF();
        }
    }
}