<%@ Page Title="Informe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformeEmbebido.aspx.cs" Inherits="LabPowerBIembedded.InformeEmbebido" %>

<asp:Content ID="InformeContent" ContentPlaceHolderID="MainContent" runat="server">
        <asp:HiddenField ID="tokenAcceso" runat="server" />
        <asp:HiddenField ID="nombreReporte" runat="server" />
        <asp:HiddenField ID="idReporte" runat="server" />
        <asp:HiddenField ID="urlReporte" runat="server" />
        <asp:HiddenField ID="usuarioFirmado" runat="server" />
        <div>
            <script type="text/javascript" src="scripts/powerbi.js"></script>

            <script type="text/javascript">
                window.onload = function () {
                    var accessToken = document.getElementById('tokenAcceso').value;
                    var nombreReporte = document.getElementById('nombreReporte').value;
                    var idReporte = document.getElementById('idReporte').value;
                    var urlReporte = document.getElementById('urlReporte').value;
                    var usuarioFirmado = document.getElementById('usuarioFirmado').value;

                    if (!accessToken || accessToken == "") {
                        return;
                    }
                    var embedUrl = urlReporte;
                    var reportId = idReporte;
                    var models = window['powerbi-client'].models;
                    var config = {
                        type: 'report',
                        tokenType: models.TokenType.Aad,
                        accessToken: accessToken,
                        embedUrl: embedUrl,
                        id: reportId
                    };
                    var reportContainer = document.getElementById('reportContainer');
                    var report = powerbi.embed(reportContainer, config);
                };
            </script>
            <asp:Label runat="server" Text="Power BI Embedded con Seguridad Dinámica implementando RLS (Row Level Security)" Font-Bold="true" Font-Names="Arial" Font-Size="X-Large" ForeColor="SteelBlue"></asp:Label>
            <div>
                <br />
                <div id="reportContainer" style="width:1200px; height:500px"></div>
            </div>
       </div>
</asp:Content>
