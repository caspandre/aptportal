<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="GestioneStruttura.aspx.cs" Inherits="APTPORTAL.Admin.GestioneStruttura" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/GestioneStruttura.css" rel="stylesheet" type="text/css" />
    <script src="../js/GestioneStruttura.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="cont_grid">
        <asp:Label ID="lb1" runat="server"></asp:Label>

        <fieldset id="cont_gestionestruttura">
        <legend>Dettaglio Struttura</legend>
        <asp:DetailsView ID="gestioneStruttura" runat="server"
            DataSourceID="sqlStruttura" Height="50px" 
            DataKeyNames="idStruttura"
            HorizontalAlign="Center" AutoGenerateRows="False" 
            oniteminserted="elementoInserito"
             OnItemUpdated="aggiornamentoEffetuato" onitemdeleting="eliminazioneRecord" >
            <Fields>
                <asp:TemplateField HeaderText="Nome Struttura" SortExpression="nomeStruttura">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="nomeStruttura" Text='<%# Bind("nomeStruttura") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="up_nomeStruttura" runat="server" Text='<%# Bind("nomeStruttura") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="up_nomeStruttura" Text="<a class='validateSummary'>*</a>" ErrorMessage="Inserisci il campo nome struttura!"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="ins_nomeStruttura" runat="server" Text='<%# Bind("nomeStruttura") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rf3" runat="server" ControlToValidate="ins_nomeStruttura" Text="<a class='validateSummary'>*</a>" ErrorMessage="Inserisci il campo nome struttura!"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Categoria" SortExpression="idCategoria">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ScegliCategoria" runat="server" DataSourceID="getCategoria" AppendDataBoundItems="true"  
                            DataTextField="descrizioneCategoria" DataValueField="idCategoria" SelectedValue='<%# Bind("idCategoria") %>'>
                            <asp:ListItem Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rf1" ErrorMessage="Inserisci il campo categoria!" runat="server" ControlToValidate="ScegliCategoria" Text="<a class='validateSummary'>*</a>"></asp:RequiredFieldValidator>
                                    
                        <asp:SqlDataSource ID="getCategoria" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="SELECT * FROM [categoria]">
                        </asp:SqlDataSource>

                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ScegliCategoria" runat="server" DataSourceID="getCategoria" AppendDataBoundItems="true"  
                            DataTextField="descrizioneCategoria" DataValueField="idCategoria" SelectedValue='<%# Bind("idCategoria") %>'>
                            <asp:ListItem Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rf2" ErrorMessage="Inserisci il campo categoria!" runat="server" ControlToValidate="ScegliCategoria" Text="<a class='validateSummary'>*</a>"></asp:RequiredFieldValidator>                
                        <asp:SqlDataSource ID="getCategoria" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="SELECT * FROM [categoria]">
                        </asp:SqlDataSource>

                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Categoria" runat="server" Text='<%# Bind("descrizioneCategoria") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Tipologia" SortExpression="idTipologia">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ScegliTipologia" runat="server" DataSourceID="getTipologia" AppendDataBoundItems="true"  
                            DataTextField="tipologia" DataValueField="idTipologia" SelectedValue='<%# Bind("idTipologia") %>'>
                            <asp:ListItem Value=""></asp:ListItem>
                        </asp:DropDownList>                
                        <asp:SqlDataSource ID="getTipologia" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="SELECT * FROM [tipologia]">
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ErrorMessage="Inserisci il campo tipologia!" runat="server" ControlToValidate="ScegliTipologia" Text="<a class='validateSummary'>*</a>"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ScegliTipologia" runat="server" DataSourceID="getTipologia" AppendDataBoundItems="true"  
                            DataTextField="tipologia" DataValueField="idTipologia"  SelectedValue='<%# Bind("idTipologia") %>'>
                            <asp:ListItem Value=""></asp:ListItem>
                        </asp:DropDownList>                
                        <asp:SqlDataSource ID="getTipologia" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="SELECT * FROM [tipologia]">
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ErrorMessage="Inserisci il campo tipologia!" runat="server" ControlToValidate="ScegliTipologia" Text="*"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Tipologia" runat="server" Text='<%# Bind("tipologia") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:BoundField DataField="nomeProprietario" HeaderText="Nome Proprietario" 
                    SortExpression="nomeProprietario" />
                <asp:BoundField DataField="numeroAppartamenti" HeaderText="Numero Appartamenti" 
                    SortExpression="numeroAppartamenti" />
                <asp:BoundField DataField="indirizzo" HeaderText="Indirizzo" 
                    SortExpression="indirizzo" />
                <asp:BoundField DataField="totPostiLetto" HeaderText="Posti Letto" 
                    SortExpression="totPostiLetto" />
                <asp:BoundField DataField="numeroWcDocce" HeaderText="Numero Wc e Docce" 
                    SortExpression="numeroWcDocce" />
                <asp:BoundField DataField="numeroWc" HeaderText="Numero Wc" 
                    SortExpression="numeroWc" />
                <asp:BoundField DataField="numeroDocce" HeaderText="Numero Docce"
                    SortExpression="numeroDocce" />
            
                <asp:TemplateField HeaderText="Contrada" SortExpression="idContrada">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Sceglicontrada" runat="server" DataSourceID="getContrada" AppendDataBoundItems="true"  
                            DataTextField="contrada" DataValueField="idContrada" SelectedValue='<%# Bind("idContrada") %>'>
                            <asp:ListItem Value=""></asp:ListItem>
                        </asp:DropDownList>                
                        <asp:SqlDataSource ID="getContrada" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="SELECT * FROM [contrada]">
                        </asp:SqlDataSource>

                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="Sceglicontrada" runat="server" DataSourceID="getContrada" AppendDataBoundItems="true"  
                            DataTextField="contrada" DataValueField="idContrada">
                            <asp:ListItem Value=""></asp:ListItem>
                        </asp:DropDownList>                
                        <asp:SqlDataSource ID="getContrada" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="SELECT * FROM [contrada]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Contrata" runat="server" Text='<%# Bind("contrada") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:BoundField DataField="lettera" HeaderText="Lettera" 
                    SortExpression="lettera" />
                <asp:BoundField DataField="numero" HeaderText="Numero" 
                    SortExpression="numero" />

                 <asp:TemplateField HeaderText="Telefono" SortExpression="telefono">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="telefono" Text='<%# Bind("telefono") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="up_telefono" runat="server" Text='<%# Bind("telefono") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rf61" runat="server" ControlToValidate="up_telefono" Text="<a class='validateSummary'>*</a>" ErrorMessage="Inserisci il campo telefono!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="refv1" runat="server" ControlToValidate="up_telefono" 
                    ErrorMessage="Formato numero di telefono non corretto (+390342900000)" 
                    ValidationExpression="\+39\d{6,}" 
                    Text="<a class='validateSummary'>*</a>">
                    </asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="ins_telefono" runat="server" Text='<%# Bind("telefono") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rf6" runat="server" ControlToValidate="ins_telefono" Text="<a class='validateSummary'>*</a>" ErrorMessage="Inserisci il campo telefono!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="refv2" runat="server" ControlToValidate="ins_telefono" 
                    ErrorMessage="Formato numero di telefono non corretto (+390342900000)" 
                    ValidationExpression="\+39\d{6,}"
                    Text="<a class='validateSummary'>*</a>">
                    </asp:RegularExpressionValidator>
                      
                    </InsertItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Fax" SortExpression="fax">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="fax" Text='<%# Bind("fax") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="up_fax" runat="server" Text='<%# Bind("fax") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rf6" runat="server" ControlToValidate="up_fax" Text="<a class='validateSummary'>*</a>" ErrorMessage="Inserisci il campo fax!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="refv51" runat="server" ControlToValidate="up_fax" 
                    ErrorMessage="Formato numero di fax non corretto (+390342900000)" 
                    ValidationExpression="\+39\d{6,}" 
                    Text="<a class='validateSummary'>*</a>">
                    </asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>

                        <asp:TextBox ID="ins_fax" runat="server" Text='<%# Bind("fax") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rf77" runat="server" ControlToValidate="ins_fax" Text="<a class='validateSummary'>*</a>" ErrorMessage="Inserisci il campo fax!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="refv56" runat="server" ControlToValidate="ins_fax" 
                    ErrorMessage="Formato numero di fax non corretto (+390342900000)" 
                    ValidationExpression="\+39\d{6,}"
                    Text="<a class='validateSummary'>*</a>">
                    </asp:RegularExpressionValidator>
                      
                    </InsertItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />




                 <asp:TemplateField HeaderText="Cellulare" SortExpression="cellulare">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="cellulare" Text='<%# Bind("cellulare") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="up_cellulare" runat="server" Text='<%# Bind("cellulare") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="refv3" runat="server" ControlToValidate="up_cellulare" 
                    ErrorMessage="Formato numero di cellulare non corretto (+390342900000)" 
                    ValidationExpression="\+39\d{6,}"
                    Text="<a class='validateSummary'>*</a>">
                    </asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="ins_cellulare" runat="server" Text='<%# Bind("cellulare") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="refv4" runat="server" ControlToValidate="ins_cellulare" 
                    ErrorMessage="Formato numero di cellulare non corretto (+390342900000)" 
                    ValidationExpression="\+39\d{6,}"
                    Text="<a class='validateSummary'>*</a>">
                    </asp:RegularExpressionValidator>
                      
                    </InsertItemTemplate>
                </asp:TemplateField>


                <asp:BoundField DataField="sitoWeb" HeaderText="Sito Web" 
                    SortExpression="sitoWeb" />
                <asp:BoundField DataField="skype" HeaderText="Skype" SortExpression="skype" />

                <asp:TemplateField HeaderText="Data Apertura Estiva" SortExpression="dataApertura1">
                    <EditItemTemplate>
                        <asp:TextBox ID="dataApertura1" CssClass="datePicker" runat="server" Text='<%# Bind("dataApertura1", "{0:dd/MM}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="dataApertura1_insert" CssClass="datePicker" runat="server" Text='<%# Bind("dataApertura1", "{0:dd/MM}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" id="dataApertura1_lb" Text='<%# Eval("dataApertura1", "{0:dd/MM}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Data Chiusura Estiva" SortExpression="dataChiusura1">
                    <EditItemTemplate>
                        <asp:TextBox ID="dataChiusura1" CssClass="datePicker" runat="server" Text='<%# Bind("dataChiusura1", "{0:dd/MM}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="dataChiusura1_ins" CssClass="datePicker" runat="server" Text='<%# Bind("dataChiusura1", "{0:dd/MM}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" id="dataChiusura1_lb" Text='<%# Eval("dataChiusura1", "{0:dd/MM}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Data Apertura Invernale" SortExpression="dataApertura2">
                    <EditItemTemplate>
                        <asp:TextBox ID="dataApertura2" CssClass="datePicker" runat="server" Text='<%# Bind("dataApertura2", "{0:dd/MM}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="dataApertura2_ins" CssClass="datePicker" runat="server" Text='<%# Bind("dataApertura2", "{0:dd/MM}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" id="dataApertura2_lb" Text='<%# Eval("dataApertura2", "{0:dd/MM}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Data Chiusura Invernale" SortExpression="dataChiusura2">
                    <EditItemTemplate>
                        <asp:TextBox ID="dataChiusura2" CssClass="datePicker" runat="server" Text='<%# Bind("dataChiusura2", "{0:dd/MM}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="dataChiusura2_ins" CssClass="datePicker" runat="server" Text='<%# Bind("dataChiusura2", "{0:dd/MM}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" id="dataChiusura2_lb" Text='<%# Eval("dataChiusura2", "{0:dd/MM}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
         
            
                <asp:CheckBoxField ControlStyle-CssClass="aperturaAnnuale" DataField="aperturaAnnuale" HeaderText="Apertura Annuale"/>

                <asp:BoundField DataField="numeroSuite" HeaderText="Numero Suite" 
                    SortExpression="numeroSuite" />
                <asp:BoundField DataField="numeroCamere" HeaderText="Numero Camere" 
                    SortExpression="numeroCamere" />
                <asp:CommandField ButtonType="Button"
                    ShowEditButton="True" ShowInsertButton="True" ShowDeleteButton="True" />
            </Fields>
        

    </asp:DetailsView >
    </fieldset>
    </div>
    <asp:SqlDataSource ID="sqlStruttura" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        SelectCommand="SELECT DISTINCT idStruttura, idTipologia, idSocieta, nomeStruttura, idCategoria, nomeProprietario, numeroAppartamenti, indirizzo, totPostiLetto, numeroWcDocce, numeroWc, numeroDocce, idContrada, lettera, numero, telefono, fax, email, cellulare, sitoWeb, skype, dataChiusura2, dataApertura2, dataChiusura1, dataApertura1, aperturaAnnuale, numeroSuite, numeroCamere, tipologia, descrizioneCategoria, contrada FROM viewStruttura WHERE (idStruttura = @idStruttura)" 
        
        UpdateCommand="UPDATE struttura SET idTipologia = @idTipologia, nomeStruttura = @nomeStruttura, idCategoria = @idCategoria, nomeProprietario = @nomeProprietario, numeroAppartamenti = @numeroAppartamenti, indirizzo = @indirizzo, localita = @localita, cap = @cap, totPostiLetto = @totPostiLetto, numeroWcDocce = @numeroWcDocce, numeroWc = @numeroWc, numeroDocce = @numeroDocce, lettera = @lettera, numero = @numero, telefono = @telefono, fax = @fax, email = @email, cellulare = @cellulare, sitoWeb = @sitoWeb, skype = @skype, numeroCamere = @numeroCamere, numeroSuite = @numeroSuite, aperturaAnnuale = @aperturaAnnuale, dataApertura1 = @dataApertura1, dataChiusura1 = @dataChiusura1, dataApertura2 = @dataApertura2, dataChiusura2 = @dataChiusura2, idContrada = @idContrada WHERE (idStruttura = @idStruttura)" 
        
        
        InsertCommand="INSERT INTO struttura(idStatoStruttura, idTipologia, idSocieta, nomeStruttura, idCategoria, nomeProprietario, numeroAppartamenti, indirizzo, localita, cap, totPostiLetto, numeroWcDocce, numeroWc, numeroDocce, idContrada, numero, lettera, fax, telefono, email, cellulare, sitoWeb, skype, numeroCamere, dataChiusura2, dataApertura2, dataChiusura1, dataApertura1, numeroSuite, aperturaAnnuale) VALUES (@idStatoStruttura, @idTipologia, @idSocieta, @nomeStruttura, @idCategoria, @nomeProprietario, @numeroAppartamenti, @indirizzo, @localita, @cap, @totPostiLetto, @numeroWcDocce, @numeroWc, @numeroDocce, @idContrada, @numero, @lettera, @fax, @telefono, @email, @cellulare, @sitoWeb, @skype, @numeroCamere, @dataChiusura2, @dataApertura2, @dataChiusura1, @dataApertura1, @numeroSuite, @aperturaAnnuale)" 
        DeleteCommand="DELETE FROM struttura WHERE (idStruttura = @idStruttura)">
        <DeleteParameters>
            <asp:Parameter Name="idStruttura" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idStatoStruttura" />
            <asp:Parameter Name="idTipologia" Type="Int32" />
            <asp:QueryStringParameter QueryStringField="idSocieta" Name="idSocieta" Type="Int32" />
            <asp:Parameter Name="nomeStruttura" />
            <asp:Parameter Name="idCategoria" />
            <asp:Parameter Name="nomeProprietario" />
            <asp:Parameter Name="numeroAppartamenti" />
            <asp:Parameter Name="indirizzo" />
            <asp:Parameter Name="localita" />
            <asp:Parameter Name="cap" />
            <asp:Parameter Name="totPostiLetto" />
            <asp:Parameter Name="numeroWcDocce" />
            <asp:Parameter Name="numeroWc" />
            <asp:Parameter Name="numeroDocce" />
            <asp:Parameter Name="idContrada" />
            <asp:Parameter Name="numero" />
            <asp:Parameter Name="lettera" />
            <asp:Parameter Name="fax" />
            <asp:Parameter Name="telefono" />
            <asp:Parameter Name="email" />
            <asp:Parameter Name="cellulare" />
            <asp:Parameter Name="sitoWeb" />
            <asp:Parameter Name="skype" />
            <asp:Parameter Name="numeroCamere" />
            <asp:Parameter Name="dataChiusura2" Type="DateTime" />
            <asp:Parameter Name="dataApertura2" Type="DateTime" />
            <asp:Parameter Name="dataChiusura1" Type="DateTime" />
            <asp:Parameter Name="dataApertura1" Type="DateTime" />
            <asp:Parameter Name="numeroSuite" />
            <asp:Parameter Name="aperturaAnnuale" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="idStruttura" 
                QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="idTipologia" Type="Int32" />
            <asp:Parameter Name="nomeStruttura" Type="String"/>
            <asp:Parameter Name="idCategoria" Type="Int32"/>
            <asp:Parameter Name="nomeProprietario" Type="String"/>
            <asp:Parameter Name="numeroAppartamenti" Type="Int32"/>
            <asp:Parameter Name="indirizzo" Type="String"/>
            <asp:Parameter Name="localita" Type="String" />
            <asp:Parameter Name="cap" Type="String"/>
            <asp:Parameter Name="totPostiLetto" Type="Int32"/>
            <asp:Parameter Name="numeroWcDocce" Type="Int32" />
            <asp:Parameter Name="numeroWc" Type="Int32" />
            <asp:Parameter Name="numeroDocce" Type="Int32"/>
            <asp:Parameter Name="lettera"  Type="String"/>
            <asp:Parameter Name="numero" Type="Decimal"/>
            <asp:Parameter Name="telefono" Type="String"/>
            <asp:Parameter Name="fax" Type="String"/>
            <asp:Parameter Name="email"  Type="String" />
            <asp:Parameter Name="cellulare" Type="String"/>
            <asp:Parameter Name="sitoWeb"  Type="String"/>
            <asp:Parameter Name="skype"  Type="String"/>
            <asp:Parameter Name="numeroCamere" Type="Int32"/>
            <asp:Parameter Name="numeroSuite" Type="Int32"/>
            <asp:Parameter Name="aperturaAnnuale" Type="Int32"/>
            <asp:Parameter Name="dataApertura1" Type="DateTime"/>
            <asp:Parameter Name="dataChiusura1" Type="DateTime"/>
            <asp:Parameter Name="dataApertura2" Type="DateTime"/>
            <asp:Parameter Name="dataChiusura2" Type="DateTime"/>
            <asp:Parameter Name="idContrada" />
            <asp:Parameter Name="idStruttura" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>    

    <div id="cont_result">
        <asp:ValidationSummary runat="server" CssClass="validateSummary" ID="vs1" />
        <asp:Label runat="server" ID="result" CssClass="result"></asp:Label>
    </div>
    <div id="clear"></div>
    </asp:Content>
