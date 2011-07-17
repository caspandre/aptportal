<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="RicercaSocieta.aspx.cs" Inherits="APTPORTAL.Admin.RicercaSocieta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../js/RicercaSocieta.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
        <asp:TextBox ID="RicercaNome" CssClass="campiRicerca" runat="server" Width="200px">Ricerca per nome...</asp:TextBox>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Invia" />
        <asp:TextBox ID="RicercaCf" CssClass="campiRicerca" runat="server" Width="200px">Ricerca per codice fiscale...</asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Invia" />


    <br /><br />
    <asp:GridView ID="TabellaRicerca" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="idSocieta" 
        DataSourceID="SqlDataSource1">

        <Columns>
            <asp:BoundField DataField="idSocieta" HeaderText="Id" InsertVisible="False"
                ReadOnly="True" SortExpression="idSocieta" />
            <asp:BoundField DataField="ragioneSociale" HeaderText="Ragione Sociale" 
                SortExpression="ragioneSociale" />
            <asp:BoundField DataField="localita" HeaderText="Località" 
                SortExpression="localita" />
            <asp:BoundField DataField="provincia" HeaderText="Provincia" 
                SortExpression="provincia" />
            <asp:BoundField DataField="partitaIva" HeaderText="Partita Iva" 
                SortExpression="partitaIva" />
            <asp:BoundField DataField="codiceFiscale" HeaderText="Codice Fiscale" 
                SortExpression="codiceFiscale" />
            <asp:BoundField DataField="cap" HeaderText="Cap" SortExpression="cap" />
            <asp:HyperLinkField DataNavigateUrlFields="idSocieta" ControlStyle-CssClass="lbutton" HeaderText="Dettagli" Text="Dettagli"
DataNavigateUrlFormatString="~/Admin/GestioneSocieta.aspx?ID={0}" />

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        
        
        
        SelectCommand="SELECT DISTINCT [idSocieta], [ragioneSociale], [localita], [provincia], [cap], [partitaIva], [codiceFiscale] FROM [anagraficaSocieta] WHERE ([ragioneSociale] LIKE '%' +@ragioneSociale+'%') OR  ([codiceFiscale] LIKE '%'+@codiceFiscale+'%') ">
        <SelectParameters>
            <asp:ControlParameter ControlID="RicercaNome" 
                Name="ragioneSociale" PropertyName="Text" DefaultValue="null" />
            <asp:ControlParameter ControlID="RicercaCf" DefaultValue="null" 
                Name="codiceFiscale" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
