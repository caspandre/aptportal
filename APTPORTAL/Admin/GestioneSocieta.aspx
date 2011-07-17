<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" 
    EnableEventValidation="true" AutoEventWireup="true" 
    CodeBehind="GestioneSocieta.aspx.cs" Inherits="APTPORTAL.Admin.GestioneSocieta"
 %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <link href="../css/GestioneSocieta.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="cont_societa">
    <fieldset>
    <legend>Anagrafica Società</legend>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" OnItemUpdated="societaUpdate"
        DataKeyNames="idSocieta" DataSourceID="anagraficaSocita_DS" >
        <Fields>
            <asp:BoundField DataField="idSocieta" HeaderText="idSocieta" ReadOnly="True" 
                SortExpression="idSocieta" />
            <asp:BoundField DataField="ragioneSociale" HeaderText="ragioneSociale" 
                SortExpression="ragioneSociale" />
            <asp:BoundField DataField="indirizzo" HeaderText="indirizzo" 
                SortExpression="indirizzo" />
<%--            <asp:BoundField DataField="telefono" HeaderText="telefono" 
                SortExpression="telefono" />--%>

                 <asp:TemplateField HeaderText="Telefono" SortExpression="telefono">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="telefono" Text='<%# Bind("telefono") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="up_telefono" runat="server" Text='<%# Bind("telefono") %>'></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="up_telefono" ID="rf12" runat="server" ErrorMessage="Telefono: campo obbligatorio" Text="<a class='validateSummary'>*</a>"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="refv1" runat="server" ControlToValidate="up_telefono" 
                    ErrorMessage="Formato numero di telefono non corretto" 
                    ValidationExpression="\+39\d{6,}" 
                    Text="<a class='validateSummary'>*</a>">
                    </asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>

                        <asp:TextBox ID="ins_telefono" runat="server" Text='<%# String.Format("+39{0}", Eval("telefono")) %>'></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="ins_telefono" ID="rf12" runat="server" ErrorMessage="Telefono: campo obbligatorio" Text="<a class='validateSummary'>*</a>"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="refv2" runat="server" ControlToValidate="ins_telefono" 
                    ErrorMessage="Formato numero di telefono non corretto" 
                    ValidationExpression="\+39\d{6,}"
                    Text="<a class='validateSummary'>*</a>">
                    </asp:RegularExpressionValidator>
                      
                    </InsertItemTemplate>
                </asp:TemplateField>




            <asp:BoundField DataField="localita" HeaderText="localita" 
                SortExpression="localita" />
            <asp:TemplateField SortExpression="provincia" HeaderText="provincia">
                <EditItemTemplate>
                    <asp:DropDownList runat="server" DataTextField="provincia" DataValueField="provincia" AppendDataBoundItems="true"
                        id="sceltaProvincia" DataSourceID="getProvincia" 
                        SelectedValue='<%# Bind("provincia") %>'>
                        <asp:ListItem Value="">
                        </asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getProvincia" runat="server"
                            ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="SELECT * FROM [provincie]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate >
                    <asp:Label ID="provincia" runat="server" Text='<%# Bind("provincia") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:BoundField DataField="cap" HeaderText="cap" SortExpression="cap" />
            <asp:BoundField DataField="stato" HeaderText="stato" SortExpression="stato" />
            <asp:BoundField DataField="codiceFiscale" HeaderText="codiceFiscale" 
                SortExpression="codiceFiscale" />
            <asp:BoundField DataField="partitaIva" HeaderText="partitaIva" 
                SortExpression="partitaIva" />
            
            <asp:BoundField DataField="iban" HeaderText="iban" SortExpression="iban" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:TemplateField SortExpression="idTipoPagamento" HeaderText="tipoPagamento">
                <EditItemTemplate>
                    <asp:DropDownList runat="server" DataTextField="tipoPagamento" DataValueField="idTipoPagamento" AppendDataBoundItems="true" 
                        id="sceltaTipoPagamento" DataSourceID="getTipoPagamento"  SelectedValue='<%# Bind("idTipoPagamento") %>'>
                        <asp:ListItem Value=""></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getTipoPagamento" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="SELECT * FROM [tipoPagamento]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate >
                    <asp:Label ID="tipoPagamento" runat="server" Text='<%# Bind("tipoPagamento") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            
            <asp:CommandField ButtonType="Button" ShowEditButton="True" 
                ShowDeleteButton="True" />
            

        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="anagraficaSocita_DS" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:aptportal %>" 
        DeleteCommand="DELETE FROM [anagraficaSocieta] WHERE [idSocieta] = @original_idSocieta" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [viewAnagraficaSocieta] WHERE ([idSocieta] = @idSocieta)" 
        
            UpdateCommand="UPDATE anagraficaSocieta SET ragioneSociale = @ragioneSociale, indirizzo = @indirizzo, telefono = @telefono, localita = @localita, provincia = @provincia, cap = @cap, stato = @stato, codiceFiscale = @codiceFiscale, partitaIva = @partitaIva, idTipoPagamento = @idTipoPagamento, iban = @iban, email = @email WHERE (idSocieta = @original_idSocieta) AND (ragioneSociale = @original_ragioneSociale OR ragioneSociale IS NULL AND @original_ragioneSociale IS NULL) AND (indirizzo = @original_indirizzo OR indirizzo IS NULL AND @original_indirizzo IS NULL) AND (localita = @original_localita OR localita IS NULL AND @original_localita IS NULL) AND (provincia = @original_provincia OR provincia IS NULL AND @original_provincia IS NULL) AND (cap = @original_cap OR cap IS NULL AND @original_cap IS NULL) AND (stato = @original_stato OR stato IS NULL AND @original_stato IS NULL) AND (codiceFiscale = @original_codiceFiscale OR codiceFiscale IS NULL AND @original_codiceFiscale IS NULL) AND (partitaIva = @original_partitaIva OR partitaIva IS NULL AND @original_partitaIva IS NULL) AND (idTipoPagamento = @original_idTipoPagamento OR idTipoPagamento IS NULL AND @original_idTipoPagamento IS NULL) AND (iban = @original_iban OR iban IS NULL AND @original_iban IS NULL) AND (email = @original_email)">
        <DeleteParameters>
            <asp:Parameter Name="original_idSocieta" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idSocieta" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ragioneSociale" Type="String" />
            <asp:Parameter Name="indirizzo" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="localita" Type="String" />
            <asp:Parameter Name="provincia" Type="String" />
            <asp:Parameter Name="cap" Type="String" />
            <asp:Parameter Name="stato" Type="String" />
            <asp:Parameter Name="codiceFiscale" Type="String" />
            <asp:Parameter Name="partitaIva" Type="Int64" />
            <asp:Parameter Name="idTipoPagamento" Type="String" />
            <asp:Parameter Name="iban" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="original_idSocieta" Type="Int32" />
            <asp:Parameter Name="original_ragioneSociale" Type="String" />
            <asp:Parameter Name="original_indirizzo" Type="String" />
            <asp:Parameter Name="original_telefono" Type="String" />
            <asp:Parameter Name="original_localita" Type="String" />
            <asp:Parameter Name="original_provincia" Type="String" />
            <asp:Parameter Name="original_cap" Type="String" />
            <asp:Parameter Name="original_stato" Type="String" />
            <asp:Parameter Name="original_codiceFiscale" Type="String" />
            <asp:Parameter Name="original_partitaIva" Type="Int32" />
            <asp:Parameter Name="original_idTipoPagamento" Type="Int32" />
            <asp:Parameter Name="original_iban" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </fieldset>
    </div>

    <div id="cont_utente">
        <fieldset>
            <legend>Utente</legend>
            <asp:DetailsView ID="dettaglioUtente" runat="server" AutoGenerateRows="False" 
                DataKeyNames="idUtente,idSocietaUtente" DataSourceID="SqlDataSource2" 
                onitemcommand="inviaMail">
                <Fields>
                    <asp:BoundField DataField="idUtente" HeaderText="idUtente" 
                        SortExpression="idUtente" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="nome" HeaderText="nome" 
                        SortExpression="nome" />
                    <asp:BoundField DataField="username" HeaderText="username" 
                        SortExpression="username" />
                    <asp:BoundField DataField="password" HeaderText="password" 
                        SortExpression="password" />
                    <asp:TemplateField HeaderText="statoUtente" SortExpression="statoUtente">
                        <EditItemTemplate >
                            <asp:DropDownList ID="statoUtente" runat="server" DataTextField="statoUtente" DataValueField="statoUtente" SelectedValue='<%# Bind("statoUtente") %>'>
                                <asp:ListItem Value="abilitato">abilitato</asp:ListItem>
                                <asp:ListItem Value="disabilitato">disabilitato</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("statoUtente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    <asp:ButtonField ButtonType="Button" Text="Invia Mail" CommandName="inviaMail" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:aptportal %>" SelectCommand="getUtente" 
                SelectCommandType="StoredProcedure" 
                UpdateCommand="UPDATE [utente] 
                            SET [nome] = @nome,
                            [username] = @username,
                            [password] = @password,
                            [statoUtente] = @statoUtente
                            WHERE [idUtente] = @idUtente">
                <SelectParameters>
                    <asp:QueryStringParameter Name="idSocieta" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" />
                    <asp:Parameter Name="username" />
                    <asp:Parameter Name="password" />
                    <asp:Parameter Name="statoUtente" />
                    <asp:Parameter Name="idUtente" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </fieldset>
    </div>



    <br />
    <div id="cont_struttura">
        <fieldset>
        <legend style="width:auto">Strutture collegate:</legend>
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idStruttura"
                DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="idSocieta" HeaderText="idSocieta" 
                        SortExpression="idSocieta" />
                     <asp:BoundField DataField="idStruttura" HeaderText="idStruttura" 
                        SortExpression="idStruttura" />
                    <asp:BoundField DataField="nomeStruttura" HeaderText="nomeStruttura" 
                        SortExpression="nomeStruttura" />
                    <asp:BoundField DataField="statoStruttura" HeaderText="statoStruttura" 
                        SortExpression="statoStruttura" />
                    <asp:BoundField DataField="categoria" HeaderText="categoria" 
                        SortExpression="categoria" />
                    <asp:BoundField DataField="tipologia" HeaderText="tipologia" 
                        SortExpression="tipologia" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:HyperLinkField DataNavigateUrlFields="idStruttura,idSocieta" 
                        ControlStyle-CssClass="lbutton" Text="Dettagli"
                  
                        DataNavigateUrlFormatString="~/Admin/GestioneStruttura.aspx?ID={0}&idSocieta={1}" >
                            <ControlStyle CssClass="lbutton"></ControlStyle>
                    </asp:HyperLinkField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:aptportal %>" 
                SelectCommand="SELECT [idSocieta],[idStruttura], [nomeStruttura], [statoStruttura], [categoria], [tipologia], [indirizzo], [email] FROM [viewStruttura] WHERE idSocieta = @idSocieta">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="ID" Name="idSocieta" Type="Int32"/>
                </SelectParameters>
            </asp:SqlDataSource>
            
            <br />

            <asp:HyperLink ID="l_nuovaStruttura" CssClass="lbutton" runat="server">Nuova Struttura</asp:HyperLink>
            
        </fieldset>
    </div>

    <br />

    <asp:Label ID="result" CssClass="result" runat="server"></asp:Label>

</asp:Content>
