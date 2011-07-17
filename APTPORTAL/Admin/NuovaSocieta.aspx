<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="NuovaSocieta.aspx.cs" Inherits="APTPORTAL.Admin.NuovaSocieta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        In questa pagina è possibile aggiungere una nuova società..
    </p>
    <fieldset id="cont_nuovasocieta">
    <legend>Dati anagrafici società</legend>


    <table>
        <tr>
            <td>
                Ragione Sociale:
            </td>
            <td>
                <asp:TextBox ID="ragioneSociale" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="fv1" ControlToValidate="ragioneSociale" runat="server" ErrorMessage="Ragione sociale: campo obbligatorio" Text="<a class='validateSummary'>*</a>">
                </asp:RequiredFieldValidator>
                <asp:Label CssClass="validateSummary" ID="check_rs" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>
                Telefono:
            </td>
            <td>
                <asp:TextBox ID="telefono" runat="server" Text="+39"></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="telefono" ID="rf12" runat="server" ErrorMessage="Telefono: campo obbligatorio" Text="<a class='validateSummary'>*</a>"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="refv12" runat="server" ValidationExpression="\+39\d{6,}" ErrorMessage="Telefono: vericare il formato " ControlToValidate="telefono" Text="<a class='validateSummary'>*</a>" ></asp:RegularExpressionValidator>
            <asp:Label CssClass="validateSummary" ID="check_tel" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>
                Indirizzo:
            </td>
            <td>
                <asp:TextBox ID="indirizzo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="indirizzo" ID="rf2" runat="server" ErrorMessage="Indirizzo: campo obbligatorio" Text="<a class='validateSummary'>*</a>"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Località:
            </td>
            <td>
                <asp:TextBox ID="localita" runat="server"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td>
                Provincia:
            </td>
            <td>
                
                <asp:DropDownList ID="provincia" runat="server" 
                    DataSourceID="getProvincia" DataTextField="provincia" 
                    DataValueField="provincia" ondatabound="defaultProvincia">
                </asp:DropDownList>
                <asp:SqlDataSource ID="getProvincia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:aptportal %>" 
                    SelectCommand="SELECT [provincia] FROM [provincie]"></asp:SqlDataSource>
                
            </td>
        </tr>
        <tr>
            <td>
                Cap:
            </td>
            <td>
                        <asp:TextBox ID="cap" runat="server" ></asp:TextBox>  
                        <asp:RegularExpressionValidator ID="rfc2" runat="server" 
                            ControlToValidate="cap" ErrorMessage="Formato Cap non corretto" 
                            ValidationExpression="\d{5}" Text="<a class='validateSummary'>*</a>"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Stato:
            </td>
            <td>
                        <asp:TextBox ID="stato" runat="server" Text="Italia" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email:
            </td>
            <td>
                        <asp:TextBox ID="email" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsv1" runat="server" 
                            Text="<a class='validateSummary'>*</a>" 
                            ErrorMessage="Email: campo non corretto" ControlToValidate="email" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ControlToValidate="email" ID="rf4" runat="server" ErrorMessage="EMail: campo obbligatorio" Text="<a class='validateSummary'>*</a>"></asp:RequiredFieldValidator>
                        <asp:Label CssClass="validateSummary" ID="check_mail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                CodiceFiscale:
            </td>
            <td>

                <asp:TextBox ID="cf" runat="server" MaxLength="16"></asp:TextBox>
                <asp:RegularExpressionValidator ID="rsv2" runat="server" 
                            Text="<a class='validateSummary'>*</a>" 
                            ErrorMessage="Codice fiscale: campo non corretto" ControlToValidate="cf" 
                            ValidationExpression="[0-9a-zA-Z]{11,16}"></asp:RegularExpressionValidator>
                <asp:Label CssClass="validateSummary" ID="check_cf" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Tipo Pagamento:
            </td>
            <td>
                <asp:DropDownList ID="tipoPagamento" runat="server" 
                    DataSourceID="getPagamento" DataTextField="tipoPagamento" 
                    DataValueField="idTipoPagamento"></asp:DropDownList>
                
                <asp:SqlDataSource ID="getPagamento" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:aptportal %>" 
                    SelectCommand="SELECT * FROM [tipoPagamento]"></asp:SqlDataSource>
                
            </td>
        </tr>
        <tr>
            <td>
                Iban:
            </td>
            <td>
                <asp:TextBox ID="iban" runat="server" Columns="37" MaxLength="27"></asp:TextBox>
                <asp:RegularExpressionValidator ID="refv1" runat="server" 
                    ControlToValidate="iban" ErrorMessage="Formato IBAN non corretto" 
                    ValidationExpression="IT\d{2}[ ][a-zA-Z]\d{3}[ ]\d{4}[ ]\d{4}[ ]\d{4}[ ]\d{4}[ ]\d{3}|IT\d{2}[a-zA-Z]\d{22}" Text="<a class='validateSummary'>*</a>"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    </fieldset>
        <asp:ValidationSummary CssClass="validateSummary" ID="vs1" runat="server" />
        <asp:Button ID="butt1" runat="server" Text="Inserisci" onclick="salvaSocieta" />

    <br />
    <br />

    <asp:Label ID="result" CssClass="result" runat="server"></asp:Label>

</asp:Content>
