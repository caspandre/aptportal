<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="ListaSocieta.aspx.cs" Inherits="APTPORTAL.Admin.ListaSocieta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    

    <asp:GridView ID="gw1" CssClass="tab1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" AllowSorting="True" 
        DataKeyNames="idSocieta">
        <Columns>
            <asp:BoundField DataField="idSocieta" HeaderText="idSocieta" 
                InsertVisible="False" ReadOnly="True" SortExpression="idSocieta" />
            <asp:BoundField DataField="ragioneSociale" HeaderText="ragioneSociale" 
                SortExpression="ragioneSociale" />
            <asp:BoundField DataField="indirizzo" HeaderText="indirizzo" 
                SortExpression="indirizzo" />
            <asp:BoundField DataField="localita" HeaderText="localita" 
                SortExpression="localita" />
            <asp:BoundField DataField="provincia" HeaderText="provincia" 
                SortExpression="provincia" />
            <asp:BoundField DataField="cap" HeaderText="cap" SortExpression="cap" />
            <asp:BoundField DataField="stato" HeaderText="stato" SortExpression="stato" />
            <asp:BoundField DataField="codiceFiscale" HeaderText="codiceFiscale" 
                SortExpression="codiceFiscale" />
            <asp:BoundField DataField="partitaIva" HeaderText="partitaIva" 
                SortExpression="partitaIva" />
            <asp:BoundField DataField="idTipoPagamento" HeaderText="idTipoPagamento" 
                SortExpression="idTipoPagamento" />
            <asp:BoundField DataField="iban" HeaderText="iban" SortExpression="iban" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
        </Columns>
    </asp:GridView>
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        SelectCommand="SELECT * FROM [anagraficaSocieta]"></asp:SqlDataSource>
        
    <br />
    

</asp:Content>
