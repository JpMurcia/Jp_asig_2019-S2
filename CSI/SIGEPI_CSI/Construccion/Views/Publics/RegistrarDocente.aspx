<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarDocente.aspx.cs" Inherits="PEPEPS.Views.Usuarios.RegistrarDocente" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Register</title>
    <style type="text/css">
        #form1 {
            background-image: url('Content/Images/background-image.jpg');
            background-size: cover;
            height: 110vh;
            align-items: center;
        }

        #content {
            padding-top: 20px;
        }

        #header {
            background-color: rgba(255, 255, 255, 0.50);
            border: 2px solid rgba(255, 255, 255, 0.80);
            border-radius: 10px;
            padding: 20px;
            margin: 0 15% 30px 15%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" Theme="Neptune" runat="server" />
        <div id="content">
            <div id="header" style="padding: 20px; text-align: center;">
                <img src='<%=Page.ResolveUrl("~/Views/Publics/Content/Images/logoudla.png") %>' width="80" />
                <div style="display: inline-block; text-align: center;">
                    <h2>PRESENTACIÓN DE PROYECTOS DE EXTENSIÓN Y/O PROYECCIÓN SOCIAL</h2>
                    <h2>FORMULARIO DE REGISTRO</h2>
                </div>
            </div>

            <ext:Container
                runat="server"
                Layout="CenterLayout">
                <Items>
                    <ext:Container
                        runat="server"
                        Layout="VBoxLayout">
                        <Items>
                            <ext:FormPanel
                                ID="FormRegistro"
                                runat="server"
                                Title="Datos de registro"
                                Width="700"
                                Frame="true"
                                X="10"
                                Y="50"
                                BodyStyle="padding:10px 20px;"
                                DefaultAnchor="100%"
                                DefaultMsgTarget="side"
                                DefaultAllowBlank="false">
                                <Items>
                                    <ext:FieldContainer runat="server"
                                        Layout="HBoxLayout"
                                        AnchorHorizontal="100%">
                                        <Items>
                                            <ext:TextField
                                                ID="TB_Nombre"
                                                runat="server"
                                                FieldLabel="Nombre(s)*"
                                                EmptyText="Ingrese su nombre"
                                                AllowBlank="false"
                                                EnforceMaxLength="true"
                                                MaxLength="30"
                                                MarginSpec="3 40 3 0"
                                                WidthSpec="50%">
                                            </ext:TextField>
                                            <ext:TextField
                                                ID="TB_Apellido"
                                                runat="server"
                                                FieldLabel="Apellidos*"
                                                EmptyText="Ingrese sus apellidos"
                                                AllowBlank="false"
                                                EnforceMaxLength="true"
                                                MaxLength="30"
                                                MarginSpec="3 0 3 0"
                                                WidthSpec="50%">
                                            </ext:TextField>
                                        </Items>
                                    </ext:FieldContainer>
                                    <ext:FieldContainer runat="server"
                                        Layout="HBoxLayout"
                                        AnchorHorizontal="100%">
                                        <Items>
                                            <ext:NumberField
                                                ID="TB_Cedula"
                                                runat="server"
                                                FieldLabel="No. de Cédula*"
                                                EmptyText="Ingrese su número de cédula"
                                                AllowBlank="false"
                                                EnforceMaxLength="true"
                                                MaxLength="15"
                                                MinLength="6"
                                                MarginSpec="3 40 3 0"
                                                WidthSpec="50%">
                                            </ext:NumberField>
                                            <ext:NumberField
                                                ID="TB_Telefono"
                                                runat="server"
                                                FieldLabel="No. de teléfono*"
                                                EmptyText="Ingrese su número de teléfono o de celular"
                                                AllowBlank="false"
                                                EnforceMaxLength="true"
                                                MaxLength="10"
                                                MinLength="7"
                                                MarginSpec="3 0 3 0"
                                                WidthSpec="50%">
                                            </ext:NumberField>
                                        </Items>
                                    </ext:FieldContainer>

                                    <ext:Container runat="server">
                                        <Content>
                                            <p style="border-bottom:3px solid #157fcc"></p>
                                        </Content>
                                    </ext:Container>

                                    <ext:FieldContainer runat="server"
                                        Layout="HBoxLayout"
                                        AnchorHorizontal="80%">
                                        <Items>
                                            <ext:TextField
                                                ID="TB_Correo"
                                                runat="server"
                                                FieldLabel="Correo*"
                                                Name="email"
                                                Vtype="email"
                                                EmptyText="Correo institucional (@udla.edu.co) si es funcionario de la UDLA"
                                                AllowBlank="false"
                                                EnforceMaxLength="true"
                                                MaxLength="50"
                                                MarginSpec="3 0 3 0"
                                                WidthSpec="100%">
                                            </ext:TextField>
                                        </Items>
                                    </ext:FieldContainer>

                                    <ext:FieldContainer runat="server"
                                        Layout="HBoxLayout"
                                        AnchorHorizontal="100%">
                                        <Items>
                                            <ext:TextField
                                                ID="TB_Contrasena"
                                                runat="server"
                                                FieldLabel="Contraseña*"
                                                InputType="Password"
                                                EmptyText="Ingrese una contraseña"
                                                AllowBlank="false"
                                                EnforceMaxLength="true"
                                                MaxLength="50"
                                                MinLength="8"
                                                MarginSpec="3 40 3 0"
                                                WidthSpec="50%">
                                                <Listeners>
                                                    <ValidityChange Handler="this.next().validate();" />
                                                    <Blur Handler="this.next().validate();" />
                                                </Listeners>
                                            </ext:TextField>
                                            <ext:TextField
                                                runat="server"
                                                Vtype="password"
                                                FieldLabel="Confirmar*"
                                                InputType="Password"
                                                MsgTarget="Side"
                                                EmptyText="Confirme la contraseña"
                                                AllowBlank="false"
                                                EnforceMaxLength="true"
                                                MarginSpec="3 0 3 0"
                                                MaxLength="50"
                                                MinLength="8"
                                                WidthSpec="50%">
                                                <CustomConfig>
                                                    <ext:ConfigItem Name="initialPassField" Value="TB_Contrasena" Mode="Value" />
                                                </CustomConfig>
                                            </ext:TextField>
                                        </Items>
                                    </ext:FieldContainer>

<%--                                    <ext:Container runat="server">
                                        <Content>
                                            <p style="border-bottom:3px solid #157fcc"></p>
                                        </Content>
                                    </ext:Container>
                                    
                                    <ext:FieldContainer runat="server"
                                        Layout="HBoxLayout"
                                        AnchorHorizontal="100%">
                                        <Items>
                                            <ext:ComboBox
                                                ID="CB_Rol"
                                                runat="server"
                                                FieldLabel="Registrarse como*"
                                                AllowBlank="false"
                                                Editable="false"
                                                MarginSpec="3 40 3 0"
                                                WidthSpec="50%">
                                                <Items>
                                                    <ext:ListItem Text="Evaluador" Value="Evaluador"></ext:ListItem>
                                                    <ext:ListItem Text="Docente" Value="Docente"></ext:ListItem>
                                                </Items>
                                            </ext:ComboBox>
                                            <ext:ComboBox
                                                ID="CB_Vinculacion"
                                                runat="server"
                                                FieldLabel="Vinculación con la universidad*"
                                                AllowBlank="false"
                                                MarginSpec="3 0 3 0"
                                                Editable="false"
                                                WidthSpec="50%">
                                                <Items>
                                                    <ext:ListItem Text="Docente" Value="Docente"></ext:ListItem>
                                                    <ext:ListItem Text="Administrativo" Value="Administrativo"></ext:ListItem>
                                                    <ext:ListItem Text="Egresado" Value="Egresado"></ext:ListItem>
                                                    <ext:ListItem Text="Otro" Value="Otro"></ext:ListItem>
                                                </Items>
                                            </ext:ComboBox>
                                        </Items>
                                    </ext:FieldContainer>
                                    
                                    <ext:FieldContainer runat="server"
                                        Layout="HBoxLayout"
                                        AnchorHorizontal="100%">
                                        <Items>
                                            <ext:TextField
                                                ID="TF_Facultad"
                                                runat="server"
                                                FieldLabel="Facultad"
                                                EmptyText="Opcional"
                                                AllowBlank="true"
                                                EnforceMaxLength="true"
                                                MaxLength="30"
                                                MarginSpec="3 40 3 0"
                                                WidthSpec="50%">
                                            </ext:TextField>
                                            <ext:TextField
                                                ID="TF_Programa"
                                                runat="server"
                                                FieldLabel="Programa"
                                                EmptyText="Opcional"
                                                AllowBlank="true"
                                                EnforceMaxLength="true"
                                                MaxLength="30"
                                                MarginSpec="3 0 3 0"
                                                WidthSpec="50%">
                                            </ext:TextField>
                                        </Items>
                                    </ext:FieldContainer>--%>
                                    
                                    <ext:Container runat="server">
                                        <Content>
                                            <p style="text-align:right;">
                                                <span><b>*</b> campos obligatorios</span>
                                            </p>
                                        </Content>
                                    </ext:Container>
                                </Items>
                                <Buttons>
                                    <ext:Button runat="server" Text="Registrarse" Icon="Accept">
                                        <DirectEvents>
                                            <Click OnEvent="Btn_Registrar_Click" Before="return App.FormRegistro.validate();">
                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                </Buttons>
                            </ext:FormPanel>
                            <ext:FormPanel
                                Height="50"
                                Width="700"
                                ID="FormPanel1"
                                runat="server"
                                PaddingSpec="0 20"
                                Frame="true">
                                <Items>
                                    <ext:Container runat="server">
                                        <Content>
                                            <p>¿Ya tienes cuenta? <a href='<%= Page.ResolveUrl("~/Views/Publics/Login.aspx")%>'>Inicia sesión</a></p>
                                        </Content>
                                    </ext:Container>
                                </Items>
                            </ext:FormPanel>
                        </Items>
                    </ext:Container>
                </Items>
            </ext:Container>
        </div>
    </form>
</body>
</html>
