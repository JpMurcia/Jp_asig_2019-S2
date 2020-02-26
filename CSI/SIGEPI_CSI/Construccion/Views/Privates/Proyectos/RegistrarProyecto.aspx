<%@ Page Title="Registrar Proyecto" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="RegistrarProyecto.aspx.cs" Inherits="PEPEPS.Views.Privates.Proyectos.RegistrarProyecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

        function validarRegistro(form1, form2, form3) {
            var valido = true;

            if (!form1.validate()) {
                valido = false;
                swal("Error", "Verifique el formulario de información general.", "error");
            } else if (!form2.validate()) {
                valido = false;
                swal("Error", "Verifique el formulario de descripción.", "error");
            } else if (!form3.validate()) {
                valido = false;
                swal("Error", "Verifique el formulario de anexos.", "error");
            }
            return valido;
        }

        var AgregarIntegrante = function (btn) {
            // Create a model instance
            var r = Ext.create('Integrante', {
                Cedula: '000000',
                Nombres: 'Nuevo',
                Apellidos: 'Nuevo',
                Tipo_Vinculacion: '--Seleccione--'
            }),
                grid = btn.up("gridpanel");

            grid.store.insert(0, r);
            Ext.Function.defer(function () {
                grid.editingPlugin.startEditByPosition({ row: 0, column: 0 });
            }, 100);
        }
        var AgregarDependencia = function (btn) {
            // Create a model instance
            var r = Ext.create('Integrante', {
                Nombre: 'Nueva',
                Tipo_Dependencia: '--Seleccione--'
            }),
                grid = btn.up("gridpanel");

            grid.store.insert(0, r);
            Ext.Function.defer(function () {
                grid.editingPlugin.startEditByPosition({ row: 0, column: 0 });
            }, 100);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <%-- PANEL INSCRIPCIÓN--%>
    <ext:TabPanel
        runat="server"
        Region="Center"
        Title="FORMULARIO DE INSCRIPCIÓN DE PROPUESTA"
        MaxHeight="1000">
        <Items>
            <%-- FORM INFORMACIÓN GENERAL--%>
            <ext:FormPanel
                runat="server"
                Title="INFORMACIÓN GENERAL"
                Icon="PageEdit"
                ID="Form_Informacion_General"
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
                        runat="server"
                        DefaultWidth="60%">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer
                                runat="server"
                                AnchorHorizontal="100%"
                                Layout="HBoxLayout"
                                FieldLabel="Fecha de presentación">
                                <Items>
                                    <ext:Label runat="server" ID="Lbl_Fecha" />
                                </Items>
                            </ext:FieldContainer>

                            <ext:TextField
                                runat="server"
                                FieldLabel="Nombre del proyecto"
                                ID="TF_Nombre_Proyecto"
                                EmptyText="Nombre del proyecto"
                                AllowBlank="false"
                                EnforceMaxLength="true"
                                MaxLength="500" />

                            <ext:TextField
                                runat="server"
                                AllowBlank="false"
                                FieldLabel="Nombre del grupo de extensión"
                                ID="TF_Nombre_Grupo_Ext"
                                EmptyText="Nombre del grupo de extensión"
                                EnforceMaxLength="true"
                                MaxLength="500" />

                            <ext:FieldContainer
                                runat="server"
                                FieldLabel="Coordinador"
                                Layout="HBoxLayout"
                                AnchorHorizontal="60%">
                                <Items>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Cedula"
                                        MarginSpec="0 50 0 0"
                                        FieldLabel="Número de cédula"
                                        ReadOnly="true"
                                        WidthSpec="40%">
                                    </ext:TextField>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Nombre"
                                        FieldLabel="Nombres y apellidos"
                                        Editable="false"
                                        WidthSpec="60%">
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout"
                                AnchorHorizontal="60%">
                                <Items>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Telefono"
                                        FieldLabel="Teléfono de contacto"
                                        MarginSpec="0 50 0 0"
                                        Editable="false"
                                        WidthSpec="40%">
                                    </ext:TextField>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Correo"
                                        FieldLabel="Correo electrónico"
                                        Editable="false"
                                        WidthSpec="60%">
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>

                            <ext:FieldContainer
                                runat="server"
                                FieldLabel="Integrantes"
                                AnchorHorizontal="60%">
                                <Items>
                                    <ext:GridPanel
                                        ID="GridPanel1"
                                        runat="server">
                                        <Store>
                                            <ext:Store runat="server">
                                                <Model>
                                                    <ext:Model runat="server" Name="Integrante">
                                                        <Fields>
                                                            <ext:ModelField Name="Cedula" Type="String" Unique="true" />
                                                            <ext:ModelField Name="Nombres" Type="String" />
                                                            <ext:ModelField Name="Apellidos" Type="String" />
                                                            <ext:ModelField Name="Tipo_Vinculacion" />
                                                        </Fields>
                                                    </ext:Model>
                                                </Model>
                                            </ext:Store>
                                        </Store>

                                        <TopBar>
                                            <ext:Toolbar runat="server">
                                                <Items>
                                                    <ext:Button runat="server"
                                                        Icon="Add"
                                                        TextAlign="center"
                                                        Width="170"
                                                        Height="30"
                                                        Text="Agregar Integrante"
                                                        Handler="AgregarIntegrante" />
                                                </Items>
                                            </ext:Toolbar>
                                        </TopBar>

                                        <ColumnModel runat="server">
                                            <Columns>
                                                <ext:RowNumbererColumn runat="server" WidthSpec="4%" />
                                                <ext:Column
                                                    runat="server"
                                                    Text="Cédula"
                                                    DataIndex="Cedula"
                                                    Align="right"
                                                    WidthSpec="15%">
                                                    <Editor>
                                                        <ext:NumberField runat="server" AllowBlank="false" MaxLength="11" MinLength="6">
                                                        </ext:NumberField>
                                                    </Editor>
                                                </ext:Column>

                                                <ext:Column
                                                    runat="server"
                                                    Text="Nombres"
                                                    DataIndex="Nombres"
                                                    WidthSpec="28%">
                                                    <Editor>
                                                        <ext:TextField runat="server" AllowBlank="false" MaxLength="20" MinLength="2" />
                                                    </Editor>
                                                </ext:Column>

                                                <ext:Column
                                                    runat="server"
                                                    Text="Apellidos"
                                                    DataIndex="Apellidos"
                                                    WidthSpec="28%">
                                                    <Editor>
                                                        <ext:TextField runat="server" AllowBlank="false" MaxLength="20" MinLength="2" />
                                                    </Editor>
                                                </ext:Column>

                                                <ext:Column
                                                    runat="server"
                                                    Text="Tipo de vinculación"
                                                    DataIndex="Tipo_Vinculacion"
                                                    Width="130"
                                                    WidthSpec="20%">
                                                    <Editor>
                                                        <ext:ComboBox runat="server"
                                                            TypeAhead="true"
                                                            SelectOnTab="true"
                                                            Editable="false">
                                                            <Items>
                                                                <ext:ListItem Text="Docente" />
                                                                <ext:ListItem Text="Estudiante" />
                                                                <ext:ListItem Text="Administrativo" />
                                                                <ext:ListItem Text="Graduado" />
                                                            </Items>
                                                        </ext:ComboBox>
                                                    </Editor>
                                                </ext:Column>

                                                <ext:ImageCommandColumn
                                                    runat="server"
                                                    Sortable="false"
                                                    WidthSpec="3%">
                                                    <Commands>
                                                        <ext:ImageCommand Icon="Decline" ToolTip-Text="Delete Plant" CommandName="delete">
                                                        </ext:ImageCommand>
                                                    </Commands>
                                                    <Listeners>
                                                        <Command Handler="this.up('gridpanel').store.removeAt(recordIndex);" />
                                                    </Listeners>
                                                </ext:ImageCommandColumn>
                                            </Columns>
                                        </ColumnModel>
                                        <SelectionModel>
                                            <ext:CellSelectionModel runat="server" />
                                        </SelectionModel>
                                        <Plugins>
                                            <ext:CellEditing runat="server" ClicksToEdit="1" />
                                        </Plugins>
                                    </ext:GridPanel>
                                </Items>
                            </ext:FieldContainer>

                            <ext:FieldContainer
                                runat="server"
                                FieldLabel="Dependencias"
                                AnchorHorizontal="40%">
                                <Items>
                                    <ext:GridPanel
                                        ID="GridPanel2"
                                        runat="server">
                                        <Store>
                                            <ext:Store runat="server">
                                                <Model>
                                                    <ext:Model runat="server" Name="Dependencia">
                                                        <Fields>
                                                            <ext:ModelField Name="Nombre" Type="String" />
                                                            <ext:ModelField Name="Tipo_Dependencia" />
                                                        </Fields>
                                                    </ext:Model>
                                                </Model>
                                            </ext:Store>
                                        </Store>

                                        <TopBar>
                                            <ext:Toolbar runat="server">
                                                <Items>
                                                    <ext:Button runat="server"
                                                        Icon="Add"
                                                        TextAlign="center"
                                                        Width="170"
                                                        Height="30"
                                                        Text="Agregar Dependencia"
                                                        Handler="AgregarDependencia" />
                                                </Items>
                                            </ext:Toolbar>
                                        </TopBar>

                                        <ColumnModel runat="server">
                                            <Columns>
                                                <ext:RowNumbererColumn runat="server" WidthSpec="5%" />
                                                <ext:Column
                                                    runat="server"
                                                    Text="Nombre"
                                                    DataIndex="Nombre"
                                                    WidthSpec="54%">
                                                    <Editor>
                                                        <ext:TextField runat="server" AllowBlank="false" MaxLength="40" MinLength="4" />
                                                    </Editor>
                                                </ext:Column>

                                                <ext:Column
                                                    runat="server"
                                                    Text="Tipo de dependencia"
                                                    DataIndex="Tipo_Dependencia"
                                                    Width="130"
                                                    WidthSpec="35%">
                                                    <Editor>
                                                        <ext:ComboBox runat="server"
                                                            TypeAhead="true"
                                                            SelectOnTab="true"
                                                            Editable="false">
                                                            <Items>
                                                                <ext:ListItem Text="Facultad" />
                                                                <ext:ListItem Text="Programa académico" />
                                                            </Items>
                                                        </ext:ComboBox>
                                                    </Editor>
                                                </ext:Column>

                                                <ext:ImageCommandColumn
                                                    runat="server"
                                                    Sortable="false"
                                                    WidthSpec="5%">
                                                    <Commands>
                                                        <ext:ImageCommand Icon="Decline" ToolTip-Text="Delete Plant" CommandName="delete">
                                                        </ext:ImageCommand>
                                                    </Commands>
                                                    <Listeners>
                                                        <Command Handler="this.up('gridpanel').store.removeAt(recordIndex);" />
                                                    </Listeners>
                                                </ext:ImageCommandColumn>
                                            </Columns>
                                        </ColumnModel>
                                        <SelectionModel>
                                            <ext:CellSelectionModel runat="server" />
                                        </SelectionModel>
                                        <Plugins>
                                            <ext:CellEditing runat="server" ClicksToEdit="1" />
                                        </Plugins>
                                    </ext:GridPanel>
                                </Items>
                            </ext:FieldContainer>


                            <ext:FieldContainer
                                runat="server"
                                AnchorHorizontal="60%"
                                Layout="HBoxLayout"
                                FieldLabel="Duración">
                                <Items>
                                    <ext:DateField
                                        ID="DF_Fecha_Inicio"
                                        Format="yyyy/MM/dd"
                                        runat="server"
                                        WidthSpec="50%"
                                        MarginSpec="0 40% 0 0"
                                        FieldLabel="Fecha de inicio"
                                        AllowBlank="false">
                                    </ext:DateField>
                                    <ext:DateField
                                        ID="DF_Fecha_Culminacion"
                                        Format="yyyy/MM/dd"
                                        runat="server"
                                        WidthSpec="50%"
                                        MarginSpec="0 0 0 40%"
                                        FieldLabel="Fecha de culminación"
                                        AllowBlank="false">
                                    </ext:DateField>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>

            <%-- FORM DESCRIPCIÓN--%>
            <ext:FormPanel
                ID="Form_Descripcion"
                runat="server"
                Title="DESCRIPCIÓN"
                Icon="ScriptEdit"
                Layout="Fit">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelWidth="100"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 0 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server"
                        DefaultWidth="60%"
                        AutoScroll="true">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:TextArea
                                ID="TA_Planteamiento"
                                runat="server"
                                FieldLabel="Planteamiento del problema"
                                MaxHeight="400"
                                Height="250"
                                AutoScroll="true"
                                AllowBlank="false"
                                EnforceMaxLength="true"
                                EmptyText="Describa el plantamiento del problema..."
                                MaxLength="8000"
                                Resizable="true" />

                            <ext:TextArea
                                ID="TA_Justificacion"
                                runat="server"
                                FieldLabel="Justificación"
                                MaxHeight="400"
                                Height="250"
                                AutoScroll="true"
                                AllowBlank="false"
                                EmptyText="Ingrese la justificación del proyecto..."
                                EnforceMaxLength="true"
                                MaxLength="8000" />

                            <ext:TextArea
                                ID="TA_Objetivo_General"
                                runat="server"
                                FieldLabel="Objetivo general"
                                MaxHeight="200"
                                Height="100"
                                AutoScroll="true"
                                AllowBlank="false"
                                EmptyText="Ingrese el objetivo general del proyecto..."
                                EnforceMaxLength="true"
                                MaxLength="1000" />

                            <ext:TextArea
                                ID="TA_Objetivo_Especifico"
                                runat="server"
                                FieldLabel="Objetivos específicos"
                                MaxHeight="400"
                                Height="200"
                                AutoScroll="true"
                                AllowBlank="false"
                                EmptyText="Ingrese los objetivos específicos del proyecto..."
                                EnforceMaxLength="true"
                                MaxLength="4000" />

                            <ext:TextArea
                                ID="TA_Metodologia"
                                runat="server"
                                FieldLabel="Metodología"
                                MaxHeight="400"
                                Height="250"
                                AutoScroll="true"
                                AllowBlank="false"
                                EmptyText="Ingrese la metodología del proyecto..."
                                EnforceMaxLength="true"
                                MaxLength="8000" />

                            <ext:TextArea
                                ID="TA_Componente_Innovador"
                                runat="server"
                                FieldLabel="Componente innovador"
                                MaxHeight="400"
                                Height="150"
                                AutoScroll="true"
                                AllowBlank="false"
                                EmptyText="Ingrese el componente innovador del proyecto..."
                                EnforceMaxLength="true"
                                MaxLength="3000" />

                            <ext:TextArea
                                ID="TA_Resultados_Esperados"
                                runat="server"
                                FieldLabel="Resultados esperados"
                                MaxHeight="400"
                                Height="150"
                                AutoScroll="true"
                                AllowBlank="false"
                                EmptyText="Ingrese los resultados esperados del proyecto..."
                                EnforceMaxLength="true"
                                MaxLength="3000" />

                        </Items>
                    </ext:FieldSet>

                </Items>
            </ext:FormPanel>

            <%-- FORM CRONOGRAMA--%>
            <%--<ext:FormPanel
                            runat="server"
                            Title="CRONOGRAMA DE ACTIVIDADES"
                            Disabled="true"
                            Icon="Date"
                            Layout="Fit">
                        </ext:FormPanel>--%>

            <%-- FORM PRESUPUESTO--%>
            <%-- <ext:FormPanel
                            runat="server"
                            Title="PRESUPUESTO"
                            Disabled="true"
                            Icon="MoneyAdd"
                            Layout="Fit">
                        </ext:FormPanel>--%>

            <%-- FORM BIBLIOGRAFÍA--%>
            <%-- <ext:FormPanel
                            runat="server"
                            Title="BIBLIOGRAFÍA"
                            Disabled="true"
                            Icon="BookAdd"
                            Layout="Fit">
                        </ext:FormPanel>--%>

            <%-- FORM ANEXOS--%>
            <ext:FormPanel
                ID="Form_Anexos"
                runat="server"
                Title="ANEXOS"
                Icon="ImageAdd"
                Layout="Fit">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelWidth="100"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 0 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server"
                        DefaultWidth="60%"
                        AutoScroll="true">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer
                                runat="server">
                                <Items>
                                    <ext:FileUploadField
                                        ID="FU_Archivo"
                                        runat="server"
                                        FieldLabel="Cargar archivo de propuesta"
                                        Width="400"
                                        Icon="Attach"
                                        AllowBlank="false"
                                        EmptyText="Archivo pdf o word de máximo 2 mb"
                                        Cls="prueba">
                                    </ext:FileUploadField>
                                </Items>
                            </ext:FieldContainer>
                            <ext:Button
                                ID="BotonGuardar"
                                Width="200"
                                Height="50"
                                MarginSpec="0 100 100 0"
                                runat="server"
                                Text="GUARDAR PROPUESTA"
                                Icon="DatabaseSave">
                                <DirectEvents>
                                    <Click OnEvent="Btn_Registrar_Click" Before="return validarRegistro(#{Form_Informacion_General}, #{Form_Descripcion}, #{Form_Anexos});"></Click>
                                </DirectEvents>
                            </ext:Button>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>

            <%-- FORM FIRMAS--%>
            <%--<ext:FormPanel
                            runat="server"
                            Title="FIRMAS"
                            Icon="PencilAdd"
                            Layout="Fit">
                            <Items>
                                <ext:FieldSet
                                    runat="server"
                                    AutoScroll="true"
                                    DefaultWidth="600">
                                    <Items>
                                    </Items>
                                </ext:FieldSet>
                            </Items>
                        </ext:FormPanel>--%>
        </Items>
    </ext:TabPanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsEndPage" runat="server">
    <script>
        function inciarFileUpload(size, extensiones) {
            $(document).on('change', '#Content_FU_Archivo input', function () {
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
            inciarFileUpload(2097152, extensiones);
        });
    </script>
</asp:Content>
