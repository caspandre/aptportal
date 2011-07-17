<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="GestioneTemplateEmail.aspx.cs" Inherits="APTPORTAL.Admin.GestioneTemplateEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    

    <p>In questa pagina è possibile gestire i vari "template" di email da inviare agli utenti</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="emailTemplate">
        <Columns>
            <asp:BoundField DataField="idEmail" HeaderText="idEmail" InsertVisible="False" 
                ReadOnly="True" SortExpression="idEmail" />
            <asp:BoundField DataField="nomeEmail" HeaderText="nomeEmail" 
                SortExpression="nomeEmail" />
            <asp:TemplateField HeaderText="Testo Email">
                <ItemTemplate>
                    <%# Eval("t").ToString() %>">
                </ItemTemplate>
            </asp:TemplateField>

            <asp:HyperLinkField DataNavigateUrlFields="idEmail" HeaderText="Dettagli" Text="Dettagli"
DataNavigateUrlFormatString="~/Admin/GestioneEmail.aspx?ID={0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="emailTemplate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        
        SelectCommand="SELECT idEmail, nomeEmail, SUBSTRING(testoEmail, 0, 30) AS t FROM templateEmail"></asp:SqlDataSource>
    <br /><br />
    <asp:HyperLink ID="l_nuovaEmail" CssClass="lbutton" runat="server">Nuovo Template Email</asp:HyperLink>


    
</asp:Content>
