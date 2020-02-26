<%@ Page Title="Proyectos" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="VerProyectos.aspx.cs" Inherits="PEPEPS.Views.Privates.Proyectos.VerProyectos" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Proyectos</title>

    <style>
        .x-grid-row-over .x-grid-cell-inner {
            font-weight: bold;
        }
        a{
            color:black;
        }
    </style>

    <script>
        var saveData = function () {
            App.Content_Hidden_Proyectos.setValue(Ext.encode(App.Content_GP_Proyectos.getRowsValues({ selectedOnly: false })));
        };
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ext:Window
        ID="Ventana_Archivos"
        runat="server"
        Icon="Building"
        Title="Archivos"
        Hidden="true"
        Modal="true"
        Width="300"
        Height="250"
        BodyPadding="15">
        <Items>
            <ext:FormPanel runat="server" ID="Form_Evaluadores">
                <Items>
                    <ext:Hyperlink runat="server" ID="HL_Propuesta" StyleSpec="font-weight: bold;" Target="_top" Text="Ver propuesta"></ext:Hyperlink>
                    <ext:Container runat="server"><Content><hr /></Content></ext:Container>
                    <ext:Hyperlink runat="server" ID="HL_Presupuesto" StyleSpec="font-weight: bold;" Target="_top" Text="Ver presupuesto actualizado"></ext:Hyperlink>
                    <ext:Container runat="server"><Content><hr /></Content></ext:Container>
                    <ext:Hyperlink runat="server" ID="HL_Informe_Parcial" StyleSpec="font-weight: bold;" Target="_top" Text="Ver informe parcial #1"></ext:Hyperlink>
                    <ext:Container runat="server"><Content><hr /></Content></ext:Container>
                    <ext:Hyperlink runat="server" ID="HL_Informe_Parcial2" StyleSpec="font-weight: bold;" Target="_top" Text="Ver informe parcial #2"></ext:Hyperlink>
                </Items>
            </ext:FormPanel>
        </Items>
        <Buttons>
            <ext:Button
                runat="server"
                DefaultAlign="center"
                Text="Cerrar"
                Icon="Cancel">
                <Listeners>
                    <Click Handler="#{Ventana_Archivos}.hide()" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>


    <ext:Hidden ID="Hidden_Proyectos" runat="server" />
    <ext:TabPanel
        runat="server"
        Region="Center"
        Title="PROYECTOS PRESENTADOS">
        <Items>
            <ext:GridPanel
                ID="GP_Proyectos"
                runat="server"
                Title="Proyectos">
                <Store>
                    <ext:Store
                        ID="Store_Proyectos"
                        runat="server"
                        PageSize="20">
                        <Model>
                            <ext:Model runat="server">
                                <Fields>
                                    <ext:ModelField Name="PROYECTO" Type="String" />
                                    <ext:ModelField Name="PRESENTACION" Type="String" />
                                    <ext:ModelField Name="COORDINADOR" Type="String" />
                                    <ext:ModelField Name="TELEFONO" Type="String"/>
                                    <ext:ModelField Name="CORREO" Type="String" />
                                    <ext:ModelField Name="ARCHIVO" Type="String" />
                                    <ext:ModelField Name="PRESUPUESTO" Type="String" />
                                    <ext:ModelField Name="ESTADO_PRESUPUESTO" Type="String" />
                                    <ext:ModelField Name="INFORME_PARCIAL" Type="String" />
                                    <ext:ModelField Name="INFORME_PARCIAL2" Type="String" />
                                    <ext:ModelField Name="INFORME_FINAL" Type="String" />
                                    <ext:ModelField Name="ESTADO_INFORME" Type="String" />
                                    <ext:ModelField Name="ESTADO" Type="String" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel runat="server">
                    <Columns>
                        <ext:RowNumbererColumn runat="server" WidthSpec="3%" />
                        <%--<ext:Column runat="server" Text="NOMBRE DEL PROYECTO" DataIndex="PROYECTO" WidthSpec="30%" HeightSpec="auto"/>--%>
                        <ext:HyperlinkColumn runat="server" Text="NOMBRE DEL PROYECTO" DataIndex="PROYECTO" DataIndexHref="ARCHIVO" WidthSpec="27%" />
                        <ext:Column runat="server" Text="FECHA DE PRESENTACIÓN" DataIndex="PRESENTACION" WidthSpec="10%" />
                        <ext:Column runat="server" Text="NOMBRE DEL COORDINADOR" DataIndex="COORDINADOR" WidthSpec="20%" />
                        <%--<ext:Column runat="server" Text="TELÉFONO" DataIndex="TELEFONO" WidthSpec="10%"/>--%>
                        <%--<ext:Column runat="server" Text="CORREO" DataIndex="CORREO" WidthSpec="20%"/>--%>
                        <ext:HyperlinkColumn runat="server" Text="CORREO" DataIndex="CORREO" DataIndexHref="CORREO" WidthSpec="19%" HrefPattern="mailto:{href}" HrefTarget="_top" />
                        <%--<ext:HyperlinkColumn Text="ARCHIVO" runat="server" WidthSpec="9%" Pattern="Ver" DataIndexHref="ARCHIVO"/>--%>
                        <%--   <ext:HyperlinkColumn runat="server" Text="PRESUPUESTO" DataIndex="ESTADO_PRESUPUESTO" DataIndexHref="PRESUPUESTO" WidthSpec="14%"/>
                        <ext:HyperlinkColumn runat="server" Text="INFORME PARCIAL" DataIndex="ESTADO_INFORME" DataIndexHref="INFORME_PARCIAL" WidthSpec="14%"/>--%>
                        <ext:Column runat="server" Text="ESTADO" DataIndex="ESTADO" WidthSpec="10%" />
                        <ext:CommandColumn runat="server" WidthSpec="10%" DataIndex="ID">
                            <Commands>
                                <ext:GridCommand Icon="FolderPage" CommandName="Edit" Text="Archivos" />
                            </Commands>
                            <DirectEvents>
                                <Command OnEvent="Btn_Archivos_Click">
                                    <ExtraParams>
                                        <ext:Parameter Name="ARCHIVO" Value="record.data.ARCHIVO" Mode="Raw"></ext:Parameter>
                                        <ext:Parameter Name="PRESUPUESTO" Value="record.data.PRESUPUESTO" Mode="Raw"></ext:Parameter>
                                        <ext:Parameter Name="PARCIAL" Value="record.data.INFORME_PARCIAL" Mode="Raw"></ext:Parameter>
                                        <ext:Parameter Name="PARCIAL2" Value="record.data.INFORME_PARCIAL2" Mode="Raw"></ext:Parameter>
                                    </ExtraParams>
                                </Command>
                            </DirectEvents>
                        </ext:CommandColumn>
                    </Columns>
                </ColumnModel>
                    <Plugins>
                        <ext:FilterHeader runat="server"/>
                    </Plugins>
                <SelectionModel>
                    <ext:RowSelectionModel runat="server" Mode="Multi" />
                </SelectionModel>
                <View>
                    <ext:GridView runat="server" StripeRows="true" TrackOver="true" />
                </View>
                <TopBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:Button ID="Btn_Ayuda" runat="server" Icon="Help" IconAlign="Right" Text="¿Cómo buscar?">
                            <DirectEvents>
                                <Click OnEvent="Btn_Ayuda_Click" />
                            </DirectEvents>
                            </ext:Button>
                            <ext:ToolbarFill runat="server" />
                            <ext:Button runat="server" Text="Exportar" AutoPostBack="true" OnClick="ToExcel" Icon="PageExcel">
                                <Listeners>
                                    <Click Fn="saveData" />
                                </Listeners>
                            </ext:Button>
                            <ext:Button runat="server" Text="Grupos" AutoPostBack="true" OnClick="ExportListFromGridView" Icon="PageExcel">
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <BottomBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:PagingToolbar runat="server" StoreID="Store_Proyectos" HideRefresh="true"/>
                        </Items>
                    </ext:Toolbar>
                </BottomBar>
            </ext:GridPanel>
        </Items>
    </ext:TabPanel>
</asp:Content>
