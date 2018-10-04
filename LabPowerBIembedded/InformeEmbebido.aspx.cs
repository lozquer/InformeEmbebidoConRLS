using System;
using System.Configuration;
using System.Net;
using LabPowerBIembedded.Models;
using Newtonsoft.Json;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using System.Globalization;
using System.Security.Claims;

namespace LabPowerBIembedded
{
    public partial class InformeEmbebido : System.Web.UI.Page
    {
        private string Usuario = ConfigurationManager.AppSettings["usuarioAAD"];
        private static readonly string Password = ConfigurationManager.AppSettings["passwordAAD"];
        private static readonly string IDAplicacionRegistradaAAD = ConfigurationManager.AppSettings["idAplicacionRegistradaAAD"];
        private static readonly string IDgrupoTrabajoPBI = ConfigurationManager.AppSettings["idGrupoTrabajoPBI"];
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["TokenDeAcceso"] = ObtieneTokenDeAutorizacion();
            if (Session["TokenDeAcceso"] != null)
            {
                tokenAcceso.Value = Session["TokenDeAcceso"].ToString();
                ObtieneReporte();
            }
        }

        public string ObtieneTokenDeAutorizacion()
        {
            AuthenticationResult resultadoToken = null;
            string token = null;
            try
            {
                string instanciaAzureActiveDirectory = "https://login.microsoftonline.com/{0}";
                string inquilinoAzureActiveDirectory = "common/oauth2/authorize";
                string dominio = String.Format(CultureInfo.InvariantCulture, instanciaAzureActiveDirectory, inquilinoAzureActiveDirectory);
                AuthenticationContext contextoDominio = new AuthenticationContext(dominio);
                string urlApiPowerbi = "https://analysis.windows.net/powerbi/api";
                string idAplicacionRegistradaAAD = IDAplicacionRegistradaAAD;

                var identity = (ClaimsIdentity)User.Identity;
                Usuario = identity.Name;
                resultadoToken = contextoDominio.AcquireToken(urlApiPowerbi, idAplicacionRegistradaAAD, new UserCredential(Usuario, Password));
                token = resultadoToken.AccessToken;
            }
            catch (AdalException ex)
            {
                // TODO: implementar control de error
            }
            return token;
        }


        protected void ObtieneReporte()
        {
            string uriAPIpbi = "https://api.powerbi.com/v1.0/myorg";
            WebRequest request = WebRequest.Create(String.Format("{0}/groups/{1}/reports", uriAPIpbi, IDgrupoTrabajoPBI)) as HttpWebRequest;
            request.Method = "GET";
            request.ContentLength = 0;
            request.Headers.Add("Authorization", String.Format("Bearer {0}", tokenAcceso.Value));
            using (var response = request.GetResponse() as HttpWebResponse)
            {
                using (var reader = new System.IO.StreamReader(response.GetResponseStream()))
                {
                    ReportesDelServicioPBI reportes = JsonConvert.DeserializeObject<ReportesDelServicioPBI>(reader.ReadToEnd());
                    if (reportes.Value.Length > 0)
                    {
                        for (int i = 0; i < reportes.Value.Length; i++)
                        {
                            if (String.Equals(reportes.Value[i].nombreReporte, "nombre del reporte") == true)
                            {
                                var reporte = reportes.Value[i];
                                idReporte.Value = reporte.id;
                                urlReporte.Value = reporte.embeddedUrl;
                                nombreReporte.Value = reporte.nombreReporte;
                            }
                        }

                    }
                }
            }
        }
    }
}