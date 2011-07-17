<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="GestionePrezzoPacchetto.aspx.cs" Inherits="APTPORTAL.Admin.GestionePrezzoPacchetto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>Pagina per la gestione dei prezzi pacchetto</p>

    <fieldset>
    <legend>Lista prezzi pacchetto</legend>
    <asp:GridView ID="prezziPacchetto" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idPrezzoPacchetto" DataSourceID="getPrezziPacchetto">
        <Columns>
            <asp:BoundField DataField="idPacchetto" HeaderText="idPacchetto" 
                SortExpression="idPacchetto" />
            <asp:BoundField DataField="idPrezzoPacchetto" HeaderText="idPrezzoPacchetto" 
                InsertVisible="False" ReadOnly="True" SortExpression="idPrezzoPacchetto" />
            <asp:BoundField DataField="nomePrezzoPacchetto" 
                HeaderText="nomePrezzoPacchetto" SortExpression="nomePrezzoPacchetto" />
            <asp:BoundField DataField="descrizionePrezzoPacchetto" 
                HeaderText="descrizionePrezzoPacchetto" 
                SortExpression="descrizionePrezzoPacchetto" />
            <asp:BoundField DataField="prezzo" HeaderText="prezzo" 
                SortExpression="prezzo" />
            <asp:CommandField ButtonType="Button" HeaderText="Dettagli" 
                SelectText="Dettagli" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="getPrezziPacchetto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        SelectCommand="SELECT idPrezzoPacchetto, nomePrezzoPacchetto, descrizionePrezzoPacchetto, idPacchetto, prezzo FROM prezzoPacchetto WHERE (idPacchetto = @idPacchetto)">
        <SelectParameters>
            <asp:QueryStringParameter Name="idPacchetto" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
    </fieldset>


    <br />
    
    <fieldset>
    <legend>Dettaglio Prezzo Pacchetto</legend>
        <asp:DetailsView ID="dettaglioPrezzoPacchetto" runat="server" AutoGenerateRows="False" 
            DataKeyNames="idPrezzoPacchetto" DataSourceID="getPrezzoPacchetto" 
            Height="50px" Width="125px" onitemupdated="aggiornaGridView">
            <Fields>
                <asp:BoundField DataField="idPrezzoPacchetto" HeaderText="idPrezzoPacchetto" 
                    InsertVisible="False" ReadOnly="True" SortExpression="idPrezzoPacchetto" />
                <asp:BoundField DataField="nomePrezzoPacchetto" 
                    HeaderText="nomePrezzoPacchetto" SortExpression="nomePrezzoPacchetto" />
                <asp:BoundField DataField="descrizionePrezzoPacchetto" 
                    HeaderText="descrizionePrezzoPacchetto" 
                    SortExpression="descrizionePrezzoPacchetto" />
                <asp:BoundField DataField="prezzo" HeaderText="prezzo" 
                    SortExpression="prezzo" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="getPrezzoPacchetto" runat="server" 
            ConnectionString="<%$ ConnectionStrings:aptportal %>" 
            
            SelectCommand="SELECT * FROM [prezzoPacchetto] WHERE ([idPrezzoPacchetto] = @idPrezzoPacchetto)" 
            UpdateCommand="UPDATE prezzoPacchetto SET nomePrezzoPacchetto = @nomePrezzoPacchetto, descrizionePrezzoPacchetto = @descrizionePrezzoPacchetto, prezzo = @prezzo
 WHERE ([idPrezzoPacchetto] = @idPrezzoPacchetto)">
            <SelectParameters>
                <asp:ControlParameter ControlID="prezziPacchetto" Name="idPrezzoPacchetto" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nomePrezzoPacchetto" />
                <asp:Parameter Name="descrizionePrezzoPacchetto" />
                <asp:Parameter Name="prezzo" Type="Decimal" />
                <asp:Parameter Name="idPrezzoPacchetto" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </fieldset>
    <br />

    <br />
</asp:Content>
