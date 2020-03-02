<%@ Page Title="Evaluaciones" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="VerEvaluaciones.aspx.cs" Inherits="Construccion.Views.Privates.Proyectos.VerEvaluaciones" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ext:TabPanel
        runat="server"
        Region="Center"
        Title="EVALUACIONES FINALIZADAS">
        <Items>
            <ext:GridPanel
                ID="GP_Evaluaciones"
                runat="server"
                Title="Evaluaciones">
                <Store>
                    <ext:Store
                        ID="Store_Evaluaciones"
                        runat="server"
                        PageSize="20">
                        <Model>
                            <ext:Model runat="server">
                                <Fields>
                                    <ext:ModelField Name="PROYECTO"  Type="String" />
                                    <ext:ModelField Name="EVALUADOR"  Type="String" />
                                    <ext:ModelField Name="FECHA"  Type="String"/>
                                    <ext:ModelField Name="PUNTAJE"  Type="Int" />
                                    <ext:ModelField Name="EVALUACION"  Type="String"/>
                                    <ext:ModelField Name="ARCHIVO"  Type="String"/>
                                    <ext:ModelField Name="ESTADO"  Type="String"/>
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel runat="server">
                    <Columns>
                        <ext:RowNumbererColumn runat="server" WidthSpec="3%"/>
                        <ext:Column runat="server" Text="PROYECTO" DataIndex="PROYECTO" WidthSpec="29%"/>
                        <ext:Column runat="server" Text="EVALUADOR" DataIndex="EVALUADOR" WidthSpec="25%"/>
                        <ext:DateColumn runat="server" Text="FECHA EVALUACIÓN" DataIndex="FECHA" WidthSpec="14%" Format="Y/MM/d H:i:s"/>
                        <ext:NumberColumn runat="server" Text="PUNTAJE" DataIndex="PUNTAJE" WidthSpec="8%"/>
                        <%--<ext:HyperlinkColumn Text="ARCHIVO" runat="server" WidthSpec="9%" Pattern="Ver archivo" DataIndexHref="ARCHIVO"/>--%>
                        <ext:Column runat="server" Text="ESTADO" DataIndex="ESTADO" WidthSpec="9%"/>
                        <ext:HyperlinkColumn 
                            runat="server" 
                            WidthSpec="11%" 
                            Pattern="Ver evaluación"
                            DataIndex="EVALUACION"
                            DataIndexHref="EVALUACION"
                            HrefTarget="_top"
                            HrefPattern="VerEvaluacion.aspx?id={href}"/>
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
                            <ext:Button runat="server" Text="Exportar" AutoPostBack="true" OnClick="ExportListFromGridView" Icon="PageExcel">
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <BottomBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:PagingToolbar runat="server" StoreID="Store_Evaluaciones" HideRefresh="true"/>
                        </Items>
                    </ext:Toolbar>
                </BottomBar>
            </ext:GridPanel>
        </Items>
    </ext:TabPanel>
</asp:Content>