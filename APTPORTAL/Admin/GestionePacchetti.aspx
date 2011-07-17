<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="GestionePacchetti.aspx.cs" Inherits="APTPORTAL.Admin.GestionePacchetti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Pagina per la gestione dei pacchetti
    </p>

    

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idPacchetto" DataSourceID="getPacchetti">
        <Columns>
            <asp:BoundField DataField="idPacchetto" HeaderText="idPacchetto" 
                InsertVisible="False" ReadOnly="True" SortExpression="idPacchetto" />
            <asp:BoundField DataField="nomePacchetto" HeaderText="nomePacchetto" 
                SortExpression="nomePacchetto" />
            <asp:BoundField DataField="descrizionePacchetto" HeaderText="Descrizione Pacchetto" 
                SortExpression="nomePacchetto" />
            <asp:HyperLinkField DataNavigateUrlFields="idPacchetto" ControlStyle-CssClass="lbutton" HeaderText="Dettagli" Text="Dettagli"
DataNavigateUrlFormatString="~/Admin/GestionePrezzoPacchetto.aspx?ID={0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="getPacchetti" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        SelectCommand="SELECT * FROM [pacchetto]"></asp:SqlDataSource>
    <br />
    
    <a class="lbutton" href="NuovoPacchetto.aspx">Nuovo Pacchetto</a>
    

</asp:Content>
