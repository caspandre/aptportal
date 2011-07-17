<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="GestioneEmail.aspx.cs" Inherits="APTPORTAL.Admin.GestioneEmail" %>

<%@ Register  
    Assembly="AjaxControlToolkit"  
    Namespace="AjaxControlToolkit.HTMLEditor"  
    TagPrefix="HTMLEditor" %>  

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>
        <asp:Label ID="nomeEmail" runat="server"></asp:Label>
    </h2>
    <p>
       Inserire il corpo della mail nel box sottostante, i seguenti elementi sono delle variabili e saranno sostituiti con i relativi valori:
        <li>
            #nome# : nome del proprietario.
        </li>
    </p>

    
        <asp:ScriptManager ID="sm1" runat="server">
        </asp:ScriptManager>

        <HTMLEditor:Editor ID="corpoEmail" runat="server"   
        Height="300px"   
        Width="80%"
        InitialCleanUp="false"  
        AutoFocus="true"  
/> 
     <asp:Button ID="salva" runat="server" onclick="salvaTemplate" Text="Salva" />
     <asp:Label ID="lb1" runat="server"></asp:Label>

</asp:Content>

