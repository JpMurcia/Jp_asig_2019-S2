<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="VerProyectosUsuario.aspx.cs" Inherits="PEPEPS.Views.Privates.Proyectos.VerProyectosUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .enlace a {
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">


    <ext:TabPanel
        runat="server"
        Region="Center"
        MaxHeight="1000">
        <Items>
            <ext:FormPanel
                runat="server"
                Title="MIS PROPUESTAS"
                Icon="PageEdit"
                ID="Form_Datos"
                DefaultMsgTarget="side"
                DefaultAllowBlank="false"
                AutoScroll="true">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 0 0 50"
                        Mode="Value" />
                </Defaults>
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
                                    <ext:Hyperlink runat="server" ID="HL_Proyecto" StyleSpec="font-weight: bold;" Target="_blank" Cls="enlace"></ext:Hyperlink>
                                </Items>
                                <Content>
                                    <hr />
                                    <br />
                                </Content>
                            </ext:FieldContainer>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Hyperlink runat="server" ID="HL_Informe_Parcial" StyleSpec="font-weight: bold;" Target="_blank" Text="Ver informe parcial #1"></ext:Hyperlink>
                                </Items>
                            </ext:FieldContainer>

                            <ext:Container runat="server"><Content><hr /></Content></ext:Container>

                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Hyperlink runat="server" ID="HL_Informe_Parcial2" StyleSpec="font-weight: bold;" Target="_top" Text="Informe parcial #2"></ext:Hyperlink>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                ID="FC_Propuesta"
                                Visible="false"
                                MarginSpec="0 0 40 0">
                                <Items>
                                    <ext:FileUploadField
                                        ID="FU_Archivo"
                                        runat="server"
                                        FieldLabel="Entregar informe parcial #2"
                                        Width="400"
                                        Icon="Attach"
                                        AllowBlank="false"
                                        EmptyText="Archivo pdf o word de máximo 3 mb">
                                    </ext:FileUploadField>
                                    <ext:Button
                                        ID="BotonGuardar"
                                        MarginSpec="0 100 0 0"
                                        runat="server"
                                        Text="GUARDAR ARCHIVO"
                                        Icon="DatabaseSave">
                                        <DirectEvents>
                                            <Click OnEvent="Btn_Guardar_Archivo_Click">
                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                </Items>
                            </ext:FieldContainer>


                            <%--    <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Hyperlink runat="server" ID="HL_Proyecto" StyleSpec="font-weight: bold;" Target="_blank" Cls="enlace"></ext:Hyperlink>
                                </Items>
                                <Content><br /></Content>
                            </ext:FieldContainer>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Hyperlink runat="server" ID="HL_Informe_Parcial" StyleSpec="font-weight: bold;" Target="_top" Text="INFORME PARCIAL" Cls="enlace"></ext:Hyperlink>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                ID="FC_Propuesta"
                                Visible="false"
                                MarginSpec="0 0 40 0">
                                <Items>
                                    <ext:FileUploadField
                                        ID="FU_Archivo"
                                        runat="server"
                                        FieldLabel="Entregar informe parcial"
                                        Width="400"
                                        Icon="Attach"
                                        AllowBlank="false"
                                        EmptyText="Archivo pdf o word de máximo 3 mb">
                                    </ext:FileUploadField>
                                    <ext:Button
                                        ID="BotonGuardar"
                                        MarginSpec="0 100 0 0"
                                        runat="server"
                                        Text="GUARDAR ARCHIVO"
                                        Icon="DatabaseSave">
                                        <DirectEvents>
                                            <Click OnEvent="Btn_Guardar_Archivo_Click">
                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                </Items>
                            </ext:FieldContainer>--%>
                            <%--   
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Hyperlink runat="server" ID="HL_Presupuesto" StyleSpec="font-weight: bold;" Target="_blank" Visible="false"></ext:Hyperlink>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                ID="FC_Presupuesto"
                                Visible="false">
                                <Items>
                                    <ext:FileUploadField
                                        ID="FU_Presupuesto"
                                        runat="server"
                                        FieldLabel="Cargar nuevo archivo de presupuesto"
                                        Width="400"
                                        Icon="Attach"
                                        AllowBlank="false"
                                        EmptyText="Archivo pdf o word de máximo 2 mb">
                                    </ext:FileUploadField>
                                    <ext:Button
                                        ID="Btn_Presupuesto"
                                        MarginSpec="0 100 100 0"
                                        runat="server"
                                        Text="GUARDAR ARCHIVO"
                                        Icon="DatabaseSave">
                                        <DirectEvents>
                                            <Click OnEvent="Btn_Guardar_Presupuesto_Click">
                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                </Items>
                            </ext:FieldContainer>--%>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
        </Items>
    </ext:TabPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsEndPage" runat="server">
    <script>
        function inciarFileUpload(size, extensiones, inputfile) {
            $(document).on('change', inputfile, function () {
                var fileName = this.files[0].name;
                var fileSize = this.files[0].size;
                var ext = fileName.split('.').pop();
                if (extensiones.indexOf(ext.toLowerCase()) >= 0) {
                    if (fileSize > size) {
                        this.value = '';
                        swal("Error!", "El archivo no debe superar " + (size / 1048576) + "MB", "error");
                    } else {
                        var input = $(this),
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                        input.trigger('fileselect', [label]);
                    }
                } else {
                    this.value = '';
                    swal("Error", "El archivo debe ser de uno de los siguientes formatos: " + extensiones.join(' - '), "error");
                }
            });
        }

        $(function () {
            var extensiones = ["pdf", "doc", "docx"];
            inciarFileUpload(3145728, extensiones, "#Content_FU_Archivo input");
            //inciarFileUpload(2097152, extensiones, "#Content_FU_Presupuesto input");
        });
    </script>
</asp:Content>
