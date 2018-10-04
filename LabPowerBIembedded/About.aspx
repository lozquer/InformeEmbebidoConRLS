<%@ Page Title="Acerca de..." Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LabPowerBIembedded.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Esta Web App, implementa los servicios de Power BI Embedded, utilizando: <br /> <br />
        1. Seguridad Dinámica a Nivel Fila (RLS) <br />
        2. Token de Autenticación con Azure Aactive Directory <br />
        3. API REST de Power BI <br />
        4. Modelo Tabular en Azure Analisys Services
    </h3>
    <br /><br />
    <p> Juan Francisco Lozano Quezada <br />
        Data Platform Solution Architect <br />
        Microsoft México
    </p>
</asp:Content>
