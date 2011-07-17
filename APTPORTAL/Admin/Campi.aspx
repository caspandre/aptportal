<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="Campi.aspx.cs" Inherits="APTPORTAL.Admin.Campi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <p>
        Pagina per la gestione dei campi mostrati durante la compilazione dei form
    </p>
            <asp:DropDownList ID="tipologia" runat="server" DataSourceID="getTipologia" AutoPostBack="true"
            DataTextField="tipologia" DataValueField="idTipologia" AppendDataBoundItems="true" OnSelectedIndexChanged="checkCampi">
                <asp:ListItem Text="SELEZIONA UN VALORE" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="getTipologia" runat="server" ConnectionString="<%$ ConnectionStrings:aptportal %>"
                SelectCommand="SELECT * FROM [tipologia]"></asp:SqlDataSource>


            <fieldset>
                <legend>Campi</legend>
                
                <input type="checkbox" name="check_all" id="check_all"/>
                Check all/none
                <br /><br />
                <asp:CheckBoxList ID="listaCampi" runat="server" RepeatColumns="5" DataSourceID="getCampi" DataTextField="descrizioneCampo" DataValueField="idCampo" Enabled="false">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="getCampi" runat="server" ConnectionString="<%$ ConnectionStrings:aptportal %>"
                    SelectCommand="SELECT * FROM [campo]"></asp:SqlDataSource>
            </fieldset>

            <asp:Label ID="result" CssClass="result" runat="server"></asp:Label>
            <asp:Button ID="butt1" Text="Salva" runat="server" OnClick="salvaCampi" />

</asp:Content>
