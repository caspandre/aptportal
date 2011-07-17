<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdfTest.aspx.cs" Inherits="APTPORTAL.pdfTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListView ID="lv1" runat="server" DataKeyNames="idSocieta" 
            DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2;color: #284775;">
                    <td>
                        <asp:Label ID="idSocietaLabel" runat="server" Text='<%# Eval("idSocieta") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ragioneSocialeLabel" runat="server" 
                            Text='<%# Eval("ragioneSociale") %>' />
                    </td>
                    <td>
                        <asp:Label ID="indirizzoLabel" runat="server" Text='<%# Eval("indirizzo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="localitaLabel" runat="server" Text='<%# Eval("localita") %>' />
                    </td>
                    <td>
                        <asp:Label ID="provinciaLabel" runat="server" Text='<%# Eval("provincia") %>' />
                    </td>
                    <td>
                        <asp:Label ID="capLabel" runat="server" Text='<%# Eval("cap") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statoLabel" runat="server" Text='<%# Eval("stato") %>' />
                    </td>
                    <td>
                        <asp:Label ID="codiceFiscaleLabel" runat="server" 
                            Text='<%# Eval("codiceFiscale") %>' />
                    </td>
                    <td>
                        <asp:Label ID="partitaIvaLabel" runat="server" 
                            Text='<%# Eval("partitaIva") %>' />
                    </td>
                    <td>
                        <asp:Label ID="tipoPagamentoLabel" runat="server" 
                            Text='<%# Eval("tipoPagamento") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ibanLabel" runat="server" Text='<%# Eval("iban") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #FFCC66;color: #000080;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Aggiorna" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Annulla" />
                    </td>
                    <td>
                        <asp:Label ID="idSocietaLabel1" runat="server" 
                            Text='<%# Eval("idSocieta") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ragioneSocialeTextBox" runat="server" 
                            Text='<%# Bind("ragioneSociale") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="indirizzoTextBox" runat="server" 
                            Text='<%# Bind("indirizzo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="localitaTextBox" runat="server" 
                            Text='<%# Bind("localita") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="provinciaTextBox" runat="server" 
                            Text='<%# Bind("provincia") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="capTextBox" runat="server" Text='<%# Bind("cap") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="statoTextBox" runat="server" Text='<%# Bind("stato") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="codiceFiscaleTextBox" runat="server" 
                            Text='<%# Bind("codiceFiscale") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="partitaIvaTextBox" runat="server" 
                            Text='<%# Bind("partitaIva") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tipoPagamentoTextBox" runat="server" 
                            Text='<%# Bind("tipoPagamento") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ibanTextBox" runat="server" Text='<%# Bind("iban") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            Non è stato restituito alcun dato.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Inserisci" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancella" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="ragioneSocialeTextBox" runat="server" 
                            Text='<%# Bind("ragioneSociale") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="indirizzoTextBox" runat="server" 
                            Text='<%# Bind("indirizzo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="localitaTextBox" runat="server" 
                            Text='<%# Bind("localita") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="provinciaTextBox" runat="server" 
                            Text='<%# Bind("provincia") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="capTextBox" runat="server" Text='<%# Bind("cap") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="statoTextBox" runat="server" Text='<%# Bind("stato") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="codiceFiscaleTextBox" runat="server" 
                            Text='<%# Bind("codiceFiscale") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="partitaIvaTextBox" runat="server" 
                            Text='<%# Bind("partitaIva") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tipoPagamentoTextBox" runat="server" 
                            Text='<%# Bind("tipoPagamento") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ibanTextBox" runat="server" Text='<%# Bind("iban") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6;color: #333333;">
                    <td>
                        <asp:Label ID="idSocietaLabel" runat="server" Text='<%# Eval("idSocieta") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ragioneSocialeLabel" runat="server" 
                            Text='<%# Eval("ragioneSociale") %>' />
                    </td>
                    <td>
                        <asp:Label ID="indirizzoLabel" runat="server" Text='<%# Eval("indirizzo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="localitaLabel" runat="server" Text='<%# Eval("localita") %>' />
                    </td>
                    <td>
                        <asp:Label ID="provinciaLabel" runat="server" Text='<%# Eval("provincia") %>' />
                    </td>
                    <td>
                        <asp:Label ID="capLabel" runat="server" Text='<%# Eval("cap") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statoLabel" runat="server" Text='<%# Eval("stato") %>' />
                    </td>
                    <td>
                        <asp:Label ID="codiceFiscaleLabel" runat="server" 
                            Text='<%# Eval("codiceFiscale") %>' />
                    </td>
                    <td>
                        <asp:Label ID="partitaIvaLabel" runat="server" 
                            Text='<%# Eval("partitaIva") %>' />
                    </td>
                    <td>
                        <asp:Label ID="tipoPagamentoLabel" runat="server" 
                            Text='<%# Eval("tipoPagamento") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ibanLabel" runat="server" Text='<%# Eval("iban") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                    <th runat="server">
                                        idSocieta</th>
                                    <th runat="server">
                                        ragioneSociale</th>
                                    <th runat="server">
                                        indirizzo</th>
                                    <th runat="server">
                                        localita</th>
                                    <th runat="server">
                                        provincia</th>
                                    <th runat="server">
                                        cap</th>
                                    <th runat="server">
                                        stato</th>
                                    <th runat="server">
                                        codiceFiscale</th>
                                    <th runat="server">
                                        partitaIva</th>
                                    <th runat="server">
                                        tipoPagamento</th>
                                    <th runat="server">
                                        iban</th>
                                    <th runat="server">
                                        email</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    <td>
                        <asp:Label ID="idSocietaLabel" runat="server" Text='<%# Eval("idSocieta") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ragioneSocialeLabel" runat="server" 
                            Text='<%# Eval("ragioneSociale") %>' />
                    </td>
                    <td>
                        <asp:Label ID="indirizzoLabel" runat="server" Text='<%# Eval("indirizzo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="localitaLabel" runat="server" Text='<%# Eval("localita") %>' />
                    </td>
                    <td>
                        <asp:Label ID="provinciaLabel" runat="server" Text='<%# Eval("provincia") %>' />
                    </td>
                    <td>
                        <asp:Label ID="capLabel" runat="server" Text='<%# Eval("cap") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statoLabel" runat="server" Text='<%# Eval("stato") %>' />
                    </td>
                    <td>
                        <asp:Label ID="codiceFiscaleLabel" runat="server" 
                            Text='<%# Eval("codiceFiscale") %>' />
                    </td>
                    <td>
                        <asp:Label ID="partitaIvaLabel" runat="server" 
                            Text='<%# Eval("partitaIva") %>' />
                    </td>
                    <td>
                        <asp:Label ID="tipoPagamentoLabel" runat="server" 
                            Text='<%# Eval("tipoPagamento") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ibanLabel" runat="server" Text='<%# Eval("iban") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:aptportal %>" 
            SelectCommand="SELECT * FROM [anagraficaSocieta]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="STAMPAPDF" />
    </div>
    </form>
</body>
</html>
