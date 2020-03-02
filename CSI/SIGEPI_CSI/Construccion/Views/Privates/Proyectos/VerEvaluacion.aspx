<%@ Page Title="Evaluación" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="VerEvaluacion.aspx.cs" Inherits="Construccion.Views.Privates.Proyectos.VerEvaluacion" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Content_HL_Proyecto a{
            color:black;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ext:TabPanel
        runat="server"
        Region="Center"
        Title="RESULTADO EVALUACIÓN">
        <Items>
            <ext:Panel
                runat="server"
                Title="Resultados">
                <Items>
                    <ext:FieldSet
                        runat="server">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Label runat="server" Text="PROYECTO: " StyleSpec="font-weight: bold;"></ext:Label>
                                            <ext:Container runat="server"><Content></Content></ext:Container>
                                    <ext:Hyperlink runat="server" ID="HL_Proyecto" StyleSpec="font-weight: bold;" Target="_blank"></ext:Hyperlink>
                                            <ext:Container runat="server"><Content><br /></Content></ext:Container>
                                    <ext:Label runat="server" Text="EVALUADOR: " StyleSpec="font-weight: bold;"></ext:Label>
                                            <ext:Container runat="server"><Content></Content></ext:Container>
                                    <ext:Label runat="server" ID="Lbl_Evaluador" StyleSpec="font-weight: bold;"></ext:Label>
                                </Items>
                            </ext:FieldContainer>

                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:GridPanel
                                        ID="GP_Evaluacion"
                                        runat="server"
                                        WidthSpec="60%"
                                        MarginSpec="20 20">
                                        <Store>
                                            <ext:Store
                                                ID="Store_Evaluacion"
                                                runat="server"
                                                PageSize="20">
                                                <Model>
                                                    <ext:Model runat="server">
                                                        <Fields>
                                                            <ext:ModelField Name="PUNTAJE" Type="String" />
                                                            <ext:ModelField Name="FECHA" Type="String" />
                                                            <ext:ModelField Name="ITEM_NOMBRE" Type="String" />
                                                        </Fields>
                                                    </ext:Model>
                                                </Model>
                                            </ext:Store>
                                        </Store>
                                        <ColumnModel runat="server">
                                            <Columns>
                                                <ext:Column runat="server" Text="ÍTEM" DataIndex="ITEM_NOMBRE" WidthSpec="50%" HeightSpec="auto" />
                                                <ext:DateColumn runat="server" Text="FECHA CALIFICACIÓN" DataIndex="FECHA" WidthSpec="33%" Format="Y/MM/d H:i:s" />
                                                <ext:Column runat="server" Text="PUNTAJE" DataIndex="PUNTAJE" WidthSpec="16%" />
                                            </Columns>
                                        </ColumnModel>
                                        <View>
                                            <ext:GridView runat="server" StripeRows="true" TrackOver="true" />
                                        </View>
                                    </ext:GridPanel>

                                    <ext:FieldContainer
                                        runat="server"
                                        Layout="VBoxLayout"
                                        MarginSpec="20 0">
                                        <Items>
                                            <ext:FieldContainer
                                                runat="server"
                                                Layout="HBoxLayout">
                                                <Items>
                                                    <ext:Label runat="server" Text="PUNTAJE TOTAL:" StyleSpec="font-weight: bold;" PaddingSpec="10 0"  Height="40"></ext:Label>
                                                    <ext:Label runat="server" ID="Lbl_Puntaje_Total" StyleSpec="font-weight: bold; font-size:40px;" PaddingSpec="10 10" Height="40"></ext:Label>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:Container runat="server">
                                                <Content>
                                                    <br />
                                                </Content>
                                            </ext:Container>
                                            <ext:Label runat="server" Text="FECHA DE FINALIZACIÓN" StyleSpec="font-weight: bold;"></ext:Label>
                                            <ext:Label runat="server" ID="Lbl_Fecha_Finalizacion"></ext:Label>
                                        </Items>
                                    </ext:FieldContainer>
                                </Items>
                            </ext:FieldContainer>

                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextArea
                                        runat="server"
                                        ID="TA_Observacioones"
                                        LabelAlign="Top"
                                        LabelStyle="font-weight:bold;"
                                        FieldLabel="Observaciones"
                                        MarginSpec="0 20"
                                        Editable="false"
                                        WidthSpec="60%"
                                        Height="200">
                                    </ext:TextArea>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:Panel>
        </Items>
    </ext:TabPanel>
</asp:Content>
