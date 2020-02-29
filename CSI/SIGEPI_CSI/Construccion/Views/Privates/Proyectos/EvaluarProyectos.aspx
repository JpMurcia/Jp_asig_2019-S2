<%@ Page Title="Evaluar Proyectos" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="EvaluarProyectos.aspx.cs" Inherits="Construccion.Views.Privates.Proyectos.EvaluarProyectos" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Proyectos</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ext:TabPanel
        runat="server"
        Region="Center"
        Title="EVALUAR PROYECTOS">
        <Items>
            <ext:Panel
                runat="server"
                Title="Proyectos">
                <Items>
                    <ext:GridPanel
                        ID="GP_Proyectos"
                        runat="server">
                        <Store>
                            <ext:Store
                                ID="Store_Proyectos"
                                runat="server"
                                PageSize="20">
                                <Model>
                                    <ext:Model runat="server">
                                        <Fields>
                                            <ext:ModelField Name="PROYECTO" Type="String" />
                                            <ext:ModelField Name="ID" Type="String" />
                                            <ext:ModelField Name="ESTADO" Type="String" />
                                            <ext:ModelField Name="ENLACE" Type="String" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <ColumnModel runat="server">
                            <Columns>
                                <ext:RowNumbererColumn runat="server" WidthSpec="3%" />
                                <ext:Column runat="server" Text="NOMBRE DEL PROYECTO" DataIndex="PROYECTO" WidthSpec="70%" HeightSpec="auto" />
                                <ext:Column runat="server" Text="ESTADO" DataIndex='ESTADO' WidthSpec="10%" HeightSpec="auto" AutoDataBind="true" />
                                <ext:HyperlinkColumn
                                    runat="server"
                                    WidthSpec="16%"
                                    DataIndex="ENLACE"
                                    DataIndexHref="ID"
                                    HrefTarget="_top"
                                    HrefPattern="EvaluarProyecto.aspx?id={href}" />
                            </Columns>
                        </ColumnModel>
                        <View>
                            <ext:GridView runat="server" StripeRows="true" TrackOver="true" />
                        </View>
                    </ext:GridPanel>
                    <ext:Label runat="server" ID="Lbl_Mensaje" Text="NO TIENES PROYECTOS ASIGNADOS" Visible="false" MarginSpec="40"></ext:Label>
                </Items>
            </ext:Panel>
        </Items>
    </ext:TabPanel>
</asp:Content>
