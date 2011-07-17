<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="NuovoPacchetto.aspx.cs" Inherits="APTPORTAL.Admin.NuovoPacchetto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Pagina di aggiunta nuovo pacchetto
    </p>
    <br />
    <fieldset>
        <legend>Nuovo Pacchetto</legend>

         <table>
        <tr>
            <td>
                Nome Pacchetto: 
            </td>
            <td>
                <asp:TextBox ID="nomePacchetto" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="nomePacchetto" Text="<a class='validateSummary'>*</a>" runat="server" 
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Descrizione Pacchetto: 
            </td>
            <td>
                <asp:TextBox ID="descrizionePacchetto" runat="server"></asp:TextBox>
            </td>
        </tr>
        </table>
    </fieldset>
    
    <br />
    
    <asp:Button ID="inserisci" runat="server" Text="Inserisci" 
        onclick="inserisci_Click" />
    
    <asp:Label ID="result" CssClass="result" runat="server"></asp:Label>
    
</asp:Content>
