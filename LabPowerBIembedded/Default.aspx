<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LabPowerBIembedded._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="tokenAcceso" runat="server" />
<%--    <asp:HiddenField ID="nombreReporte" runat="server" />
    <asp:HiddenField ID="idReporte" runat="server" />
    <asp:HiddenField ID="urlReporte" runat="server" />
    <asp:HiddenField ID="usuarioFirmado" runat="server" />--%>


    <div class="jumbotron">
        <h1>Power BI Embedded</h1>
        <p class="lead">Power BI Embedded simplifica las capacidades de Power BI, al ayudar en la integración de objetos visuales, informes y paneles impactantes en las aplicaciones.</p>
        <p><a href="https://docs.microsoft.com/es-mx/power-bi/developer/azure-pbie-what-is-power-bi-embedded" class="btn btn-primary btn-lg">Más Información &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Inquilino de AAD</h2>
            <p>
                Un inquilino representa una organización dentro de Azure Active Directory (AAD).
                Una vez que tenga un inquilino, se define una aplicación y se asignan permisos para que pueda hacer uso de las API REST de Power BI.
            </p>
            <p>
                <a class="btn btn-default" href="https://docs.microsoft.com/es-mx/power-bi/developer/create-an-azure-active-directory-tenant">Más información &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Seguridad RLS</h2>
            <p>
                La seguridad a nivel de fila (RLS) se usa para restringir el acceso de usuarios a los datos de dashboards, iconos, informes y conjuntos de datos. 
                Varios usuarios trabajan con los mismos artefactos, mientras ven datos diferentes.
            </p>
            <p>
                <a class="btn btn-default" href="https://docs.microsoft.com/es-mx/power-bi/developer/embedded-row-level-security">Más Información &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Registrar Aplicación AAD</h2>
            <p>
                Se debe registrar la aplicación con AAD para permitir que acceda a la API de REST de Power BI. 
                Esto permite establecer una identidad para la aplicación y especificar los permisos de los recursos REST de Power BI.
            </p>
            <p>
                <a class="btn btn-default" href="https://docs.microsoft.com/es-mx/power-bi/developer/register-app">Más Información &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
