<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="RicercaStruttura.aspx.cs" Inherits="APTPORTAL.Admin.RicercaStruttura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:TextBox ID="RicercaNome" runat="server"></asp:TextBox>
    <asp:Button ID="Invia" runat="server" Text="Invia" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idStruttura" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="idStruttura" HeaderText="idStruttura" 
                InsertVisible="False" ReadOnly="True" SortExpression="idStruttura" />
            <asp:BoundField DataField="idTipologia" HeaderText="idTipologia" 
                SortExpression="idTipologia" />
            <asp:BoundField DataField="idSocieta" HeaderText="idSocieta" 
                SortExpression="idSocieta" />
            <asp:BoundField DataField="nomeStruttura" HeaderText="nomeStruttura" 
                SortExpression="nomeStruttura" />
            <asp:BoundField DataField="telefono" HeaderText="telefono" 
                SortExpression="telefono" />
            <asp:HyperLinkField DataNavigateUrlFields="idStruttura,idSocieta" ControlStyle-CssClass="lbutton" HeaderText="Dettagli" Text="Dettagli"
DataNavigateUrlFormatString="~/Admin/GestioneStruttura.aspx?ID={0}&idSocieta={1}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        SelectCommand="SELECT DISTINCT [idStruttura], [idTipologia], [idSocieta], [nomeStruttura], [telefono] FROM [struttura] WHERE ([nomeStruttura] LIKE '%' + @nomeStruttura2 + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="RicercaNome" DefaultValue="null" 
                Name="nomeStruttura2" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
