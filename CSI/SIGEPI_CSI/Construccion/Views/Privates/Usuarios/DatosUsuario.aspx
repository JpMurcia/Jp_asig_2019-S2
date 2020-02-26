<%@ Page Title="Usuario" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="DatosUsuario.aspx.cs" Inherits="PEPEPS.Views.Privates.Usuarios.DatosUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <ext:Window
        ID="Ventana_Contrasena"
        runat="server"
        Icon="Building"
        Title="Cambiar contraseña"
        Hidden="true"
        Modal="true"
        Y="20"
        Width="300"
        BodyPadding="15">
        <Items>
            <ext:FormPanel
                runat="server"
                ID="Form_Contrasena"
                DefaultMsgTarget="side"
                DefaultAllowBlank="false">
                <Defaults>
                    <ext:Parameter
                        Name="width"
                        Value="100%"
                        Mode="Value"></ext:Parameter>
                </Defaults>
                <Items>
                    <ext:TextField
                        ID="TB_Contrasena_Actual"
                        runat="server"
                        LabelAlign="Top"
                        InputType="Password"
                        FieldLabel="Contraseña actual"
                        EnforceMaxLength="true"
                        MaxLength="50"
                        MinLength="8"
                        EmptyText="Ingrese su contraseña actual" />

                    <ext:TextField
                        runat="server"
                        Name="password1"
                        ID="TB_Contrasena_Nueva"
                        FieldLabel="Contraseña nueva"
                        InputType="Password"
                        LabelAlign="Top"
                        EnforceMaxLength="true"
                        MaxLength="50"
                        MinLength="8"
                        EmptyText="Ingrese su nueva contraseña" >
                        <Listeners>
                            <ValidityChange Handler="this.next().validate();" />
                            <Blur Handler="this.next().validate();" />
                        </Listeners>
                    </ext:TextField>
                    <ext:TextField
                        runat="server"
                        Name="password2"
                        FieldLabel="Confirmar contraseña nueva"
                        InputType="Password"
                        LabelAlign="Top"
                        AllowBlank="false"
                        EnforceMaxLength="true"
                        MaxLength="50"
                        MinLength="8"
                        EmptyText="Confirme su nueva contraseña">
                        <Validator Handler="return (value === this.previousSibling('[name=password1]').getValue()) ? true : 'Las contraseñas no coinciden.';" />
                    </ext:TextField>
                </Items>
            </ext:FormPanel>
        </Items>
        <Buttons>
            <ext:Button
                ID="Btn_Actualizar_Contrasena"
                runat="server"
                DefaultAlign="center"
                Text="Guardar"
                Icon="BuildingAdd">
                <DirectEvents>
                    <Click OnEvent="Btn_Actualizar_Contrasena_Click" Before="return App.Content_Form_Contrasena.validate();">
                        <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                    </Click>
                </DirectEvents>
            </ext:Button>
        </Buttons>
    </ext:Window>


    <ext:TabPanel
        runat="server"
        Region="Center"
        MaxHeight="1000">
        <Items>
            <ext:FormPanel
                runat="server"
                Title="DATOS DE USUARIO"
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
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout"
                                AnchorHorizontal="90%">
                                <Items>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Nombre"
                                        MarginSpec="0 50 0 0"
                                        FieldLabel="Nombres"
                                        EnforceMaxLength="true"
                                        MaxLength="30"
                                        MinLength="2"
                                        AllowBlank="false"
                                        WidthSpec="33%">
                                    </ext:TextField>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Apellidos"
                                        MarginSpec="0 50 0 0"
                                        FieldLabel="Apellidos"
                                        EnforceMaxLength="true"
                                        MaxLength="30"
                                        MinLength="2"
                                        AllowBlank="false"
                                        WidthSpec="33%">
                                    </ext:TextField>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Cedula"
                                        FieldLabel="Número de cédula"
                                        ReadOnly="true"
                                        WidthSpec="33%">
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout"
                                AnchorHorizontal="90%">
                                <Items>
                                    <ext:NumberField
                                        runat="server"
                                        ID="TF_Telefono"
                                        FieldLabel="Teléfono de contacto"
                                        AllowBlank="false"
                                        EnforceMaxLength="true"
                                        MaxLength="10"
                                        MinLength="7"
                                        MarginSpec="0 50 0 0"
                                        WidthSpec="33%">
                                    </ext:NumberField>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Rol"
                                        ReadOnly="true"
                                        MarginSpec="0 50 0 0"
                                        FieldLabel="Rol"
                                        WidthSpec="33%">
                                    </ext:TextField>
                                    <ext:TextField
                                        runat="server"
                                        ID="TF_Correo"
                                        FieldLabel="Correo electrónico"
                                        Editable="false"
                                        WidthSpec="33%">
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>

                            <ext:FieldContainer runat="server" Layout="HBoxLayout" AnchorHorizontal="89%">
                                <Items>
                                    <ext:Button runat="server" Text="Cambiar contraseña" Icon="KeyAdd">
                                        <Listeners>
                                            <Click Handler="#{Ventana_Contrasena}.show()"></Click>
                                        </Listeners>
                                    </ext:Button>
                                    <ext:ToolbarFill></ext:ToolbarFill>
                                    <ext:Button runat="server" Text="Actualizar datos" Icon="UserEdit">
                                        <DirectEvents>
                                            <Click OnEvent="Btn_Actualizar_Datos_Click" Before="return App.Content_Form_Datos.validate();">
                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
        </Items>
    </ext:TabPanel>
</asp:Content>
