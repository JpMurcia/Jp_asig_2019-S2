<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="VerUsuarios.aspx.cs" Inherits="PEPEPS.Views.Privates.Usuarios.VerUsuarios" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        var saveData = function () {
            App.Content_Hidden_Usuarios.setValue(Ext.encode(App.Content_GP_Usuarios.getRowsValues({ selectedOnly: false })));
        };
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ext:Hidden ID="Hidden_Usuarios" runat="server" />
    <ext:TabPanel
        runat="server"
        Region="Center"
        Title="USUARIOS REGISTRADOS">
        <Items>
            <ext:GridPanel
                ID="GP_Usuarios"
                runat="server"
                Title="Usuarios">
                <Store>
                    <ext:Store
                        ID="Store_Usuarios"
                        runat="server"
                        PageSize="20">
                        <Model>
                            <ext:Model runat="server">
                                <Fields>
                                    <ext:ModelField Name="NOMBRE"  Type="String" />
                                    <ext:ModelField Name="CEDULA"  Type="String" />
                                    <ext:ModelField Name="TELEFONO"  Type="String" />
                                    <ext:ModelField Name="CORREO"  Type="String"/>
                                    <ext:ModelField Name="ROL"  Type="String" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel runat="server">
                    <Columns>
                        <ext:RowNumbererColumn runat="server" WidthSpec="3%"/>
                        <ext:Column runat="server" Text="NOMBRE" DataIndex="NOMBRE" WidthSpec="30%" HeightSpec="auto"/>
                        <ext:Column runat="server" Text="CÉDULA" DataIndex="CEDULA" WidthSpec="13%"/>
                        <ext:Column runat="server" Text="TELÉFONO" DataIndex="TELEFONO" WidthSpec="10%"/>
                        <ext:HyperlinkColumn runat="server" Text="CORREO" DataIndex="CORREO" DataIndexHref="CORREO" WidthSpec="20%" HrefPattern="mailto:{href}" HrefTarget="_top"/>
                        <ext:Column runat="server" Text="ROL" DataIndex="ROL" WidthSpec="20%"/>
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
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <BottomBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:PagingToolbar runat="server" StoreID="Store_Usuarios" HideRefresh="true"/>
                        </Items>
                    </ext:Toolbar>
                </BottomBar>
            </ext:GridPanel>
        </Items>
    </ext:TabPanel>
</asp:Content>
