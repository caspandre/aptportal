<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="Servizi.aspx.cs" Inherits="APTPORTAL.Admin.Servizi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <p>
        In questa pagine puoi scegliere quali servizi sono associati a ciascuna tipologia di struttura
    </p>
    <br />

            <asp:DropDownList ID="tipologia" runat="server" DataSourceID="getTipologia" AutoPostBack="true"
            DataTextField="tipologia" DataValueField="idTipologia" AppendDataBoundItems="true" OnSelectedIndexChanged="checkCampi">
                <asp:ListItem Text="SELEZIONA UN VALORE" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="getTipologia" runat="server" ConnectionString="<%$ ConnectionStrings:aptportal %>"
                SelectCommand="SELECT * FROM [tipologia]"></asp:SqlDataSource>


            <fieldset style="width:auto">
                <legend>Servizi:</legend>
                <input type="checkbox" name="check_all" id="check_all"/>
                Check all/none
                <br /><br />
                <asp:CheckBoxList ID="listaServizi" runat="server" RepeatColumns="4" CellPadding="10"
                    OnSelectedIndexChanged="optionChanged" Enabled="false">
                </asp:CheckBoxList>
            
            </fieldset>
            <!--
            <asp:SqlDataSource ID="getServizi" runat="server" ConnectionString="<%$ ConnectionStrings:aptportal %>"
                SelectCommand="SELECT * FROM [servizio]"></asp:SqlDataSource>
                -->

            <br />
            <asp:Label ID="result" CssClass="result" runat="server"></asp:Label>


            <asp:Button ID="salva" runat="server" OnClick="salvaServizi" Text="Salva"/>

</asp:Content>
