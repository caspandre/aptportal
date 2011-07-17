<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="InviaMail.aspx.cs" Inherits="APTPORTAL.Admin.InviaMail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    Scegli la mail da inviare e clicca sul pulsante per inviare<br />
    <br />
&nbsp;<asp:DropDownList ID="templateMail" runat="server" 
        DataSourceID="getTemplateEmail" DataTextField="nomeEmail" 
        DataValueField="idEmail">
    </asp:DropDownList>

    <asp:SqlDataSource ID="getTemplateEmail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        SelectCommand="SELECT * FROM [templateEmail]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="result" runat="server" CssClass="result"></asp:Label>
    <br />

    <asp:Button ID="send" runat="server" onclick="send_Click" Text="Invia" />

</asp:Content>
