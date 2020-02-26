<%@ Page Title="Asignar Evaluador" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="AsignarEvaluador.aspx.cs" Inherits="Construccion.Views.Privates.Proyectos.AsignarEvaluador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
   <%-- Ventana Evaluadores --%>
    <ext:Window
        ID="Ventana_Evaluadores"
        runat="server"
        Icon="Building"
        Title="Asignar evaluadores"
        Hidden="true"
        Modal="true"
        Width="550"
        Height="250"
        BodyPadding="15">
        <Items>
            <ext:FormPanel runat="server" ID="Form_Evaluadores">
                <Items>
                    <ext:Label runat="server" ID="Lbl_Proyecto"></ext:Label>
                    <ext:Container runat="server">
                        <Content>
                            <br />
                        </Content>
                    </ext:Container>
                    <ext:ComboBox
                        runat="server"
                        ID="CB_Evaluador_1"
                        FieldLabel="Evaluador 1"
                        ValueField="ID"
                        DisplayField="NOMBRE"
                        EmptyText="Seleccione evaluador..."
                        AllowBlank="false"
                        WidthSpec="100%">
                        <Store>
                            <ext:Store runat="server" ID="Str_Evaluador_1">
                                <Model>
                                    <ext:Model runat="server">
                                        <Fields>
                                            <ext:ModelField Name="ID"></ext:ModelField>
                                            <ext:ModelField Name="NOMBRE"></ext:ModelField>
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                    </ext:ComboBox>
                    <ext:ComboBox
                        runat="server"
                        ID="CB_Evaluador_2"
                        FieldLabel="Evaluador 2"
                        ValueField="ID"
                        DisplayField="NOMBRE"
                        EmptyText="Seleccione evaluador..."
                        AllowBlank="false"
                        WidthSpec="100%">
                        <Store>
                            <ext:Store runat="server" ID="Str_Evaluador_2">
                                <Model>
                                    <ext:Model runat="server">
                                        <Fields>
                                            <ext:ModelField Name="ID"></ext:ModelField>
                                            <ext:ModelField Name="NOMBRE"></ext:ModelField>
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                    </ext:ComboBox>
                </Items>
            </ext:FormPanel>
        </Items>
        <Buttons>
            <ext:Button
                ID="Btn_Guardar_Evaluadores"
                runat="server"
                DefaultAlign="center"
                Text="Guardar"
                Icon="BuildingAdd">
                <DirectEvents>
                    <Click OnEvent="Btn_Guardar_Evaluadores_Click"></Click>
                </DirectEvents>
            </ext:Button>
        </Buttons>
    </ext:Window>

    <ext:TabPanel
        runat="server"
        Region="Center"
        Title="ASIGNAR EVALUADORES">
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
                                    <ext:ModelField Name="ID" Type="String" />
                                    <ext:ModelField Name="PROYECTO" Type="String" />
                                    <ext:ModelField Name="COORDINADOR" Type="String" />
                                    <ext:ModelField Name="ARCHIVO" Type="String" />
                                    <ext:ModelField Name="CANT_EVALUADORES" Type="Int" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel runat="server">
                    <Columns>
                        <ext:RowNumbererColumn runat="server" WidthSpec="3%" />
                        <ext:Column runat="server" Text="NOMBRE DEL PROYECTO" DataIndex="PROYECTO" WidthSpec="48%" HeightSpec="auto" />
                        <ext:Column runat="server" Text="NOMBRE DEL COORDINADOR" DataIndex="COORDINADOR" WidthSpec="25%" />
                        <ext:HyperlinkColumn Text="ARCHIVO" runat="server" WidthSpec="10%" Pattern="Ver" DataIndexHref="ARCHIVO" />
                        <ext:Column runat="server" Text="#" DataIndex="CANT_EVALUADORES" WidthSpec="3%" />
                        <ext:CommandColumn runat="server" WidthSpec="10%" DataIndex="ID">
                            <Commands>
                                <ext:GridCommand Icon="Group" CommandName="Edit" Text="Evaluadores"/>
                            </Commands>
                            <DirectEvents>
                                <Command OnEvent="Btn_Asignar_Evaluadores_Click">
                                    <ExtraParams>
                                        <ext:Parameter Name="COD_PROYECTO" Value="record.data.ID" Mode="Raw"></ext:Parameter>
                                        <ext:StoreParameter Name="NOM_PROYECTO" Value="record.data.PROYECTO" Mode="Raw"></ext:StoreParameter>
                                    </ExtraParams>
                                </Command>
                            </DirectEvents>
                        </ext:CommandColumn>
                    </Columns>
                </ColumnModel>
                <Plugins>
                    <ext:FilterHeader runat="server" />
                </Plugins>
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
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <BottomBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:PagingToolbar runat="server" StoreID="Store_Proyectos" HideRefresh="true" />
                        </Items>
                    </ext:Toolbar>
                </BottomBar>
            </ext:GridPanel>
        </Items>
    </ext:TabPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsEndPage" runat="server">
</asp:Content>
