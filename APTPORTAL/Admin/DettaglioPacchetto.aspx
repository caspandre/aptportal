<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="DettaglioPacchetto.aspx.cs" Inherits="APTPORTAL.Admin.DettaglioPacchetto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Dettaglio del pacchetto<br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="idPacchetto" DataSourceID="pacchetto" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="idPacchetto" HeaderText="idPacchetto" 
                InsertVisible="False" ReadOnly="True" SortExpression="idPacchetto" />
            <asp:BoundField DataField="nomePacchetto" HeaderText="nomePacchetto" 
                SortExpression="nomePacchetto" />
            <asp:BoundField DataField="descrizionePacchetto" 
                HeaderText="descrizionePacchetto" SortExpression="descrizionePacchetto" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="pacchetto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        SelectCommand="SELECT * FROM [pacchetto]"></asp:SqlDataSource>
    <br />
&nbsp;
</asp:Content>
