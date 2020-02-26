<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Construccion.Views.Usuarios.Login" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="description" content="Presentacion y evaluacion de proyectos de extension y proyeccion social - UDLA" />
    <meta name="keywords" lang="es" content="proyectos, extension, proyeccion, social, udla, uniamazonia, universidad de la amazonia, pepeps" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Iniciar sesión</title>
    <style type="text/css">
        #form1 {
            background-size: cover;
            height: 100vh;
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
                <img src='<%=Page.ResolveUrl("~/Views/Publics/Content/Images/logoudla.png")%>' width="80" />
                <div style="display: inline-block; text-align: center;">
                    <h2>PRESENTACIÓN DE PROYECTOS DE EXTENSIÓN Y/O PROYECCIÓN SOCIAL</h2>
                    <h2>INICIAR SESIÓN</h2>
                </div>
            </div>

            <ext:Window
                ID="Ventana_Recuperar"
                runat="server"
                Icon="Building"
                Title="Recuperar contraseña"
                Hidden="true"
                Y="100"
                Modal="true"
                Width="300"
                Height="160"
                BodyPadding="15">
                <Items>
                    <ext:FormPanel runat="server" ID="FormRecuperar">
                        <Items>
                            <ext:Label runat="server" Text="Ingrese el correo con el cual se registró:"></ext:Label>
                            <ext:Container runat="server"><Content><br /></Content></ext:Container>
                            <ext:TextField runat="server" ID="TF_Recuperar" AllowBlank="false" WidthSpec="100%"
                                        Vtype="email" InputType="Email"></ext:TextField>
                        </Items>
                    </ext:FormPanel>
                </Items>
                <Buttons>
                    <ext:Button
                        ID="Btn_Recuperar"
                        runat="server"
                        DefaultAlign="center"
                        Text="Recuperar"
                        Icon="BuildingAdd">
                        <DirectEvents>
                            <Click OnEvent="Btn_Recuperar_Click" Before="return App.FormRecuperar.validate();">
                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                </Buttons>
            </ext:Window>

            <ext:Container
                runat="server"
                Layout="CenterLayout">
                <Items>
                    <ext:Container
                        runat="server"
                        Layout="VBoxLayout">
                        <Items>
                            <ext:FormPanel
                                Height="200"
                                Icon="Lock"
                                Width="350"
                                ID="FormLogin"
                                runat="server"
                                Title="Datos de inicio de sesión"
                                Frame="true"
                                X="10"
                                Y="50"
                                BodyStyle="padding:30px 20px;"
                                DefaultAnchor="100%"
                                DefaultMsgTarget="side"
                                DefaultAllowBlank="false">
                                <Items>
                                    <ext:TextField
                                        ID="TB_Correo"
                                        runat="server"
                                        FieldLabel="Correo"
                                        AllowBlank="false"
                                        Name="email"
                                        Vtype="email"
                                        EmptyText="Ingrese su correo electrónico" />
                                    <ext:TextField
                                        ID="TB_Contrasena"
                                        runat="server"
                                        InputType="Password"
                                        FieldLabel="Contraseña"
                                        AllowBlank="false"
                                        EmptyText="Ingrese su contraseña" />
                                </Items>
                                <Buttons>
                                    <ext:Button ID="Btn_Ingresar" runat="server" Text="Ingresar" Icon="Accept">
                                        <DirectEvents>
                                            <Click OnEvent="Btn_Ingresar_Click" Before="return App.FormLogin.validate();">
                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                </Buttons>
                            </ext:FormPanel>
                          <%--  <ext:FormPanel
                                Height="78"
                                Width="350"
                                ID="FormPanel1"
                                runat="server"
                                PaddingSpec="10 20"
                                Frame="true">
                                <Items>
                                    <ext:HyperlinkButton runat="server" Text="¿Olvidó su contraseña?">
                                        <Listeners>
                                            <Click Handler="#{Ventana_Recuperar}.show()" />
                                        </Listeners>
                                    </ext:HyperlinkButton>
                                    <ext:Container runat="server">
                                        <Content>
                                            <p><a href='<%= Page.ResolveUrl("~/Views/Publics/RegistrarDocente.aspx")%>'>Regístrate</a></p>
                                        </Content>
                                    </ext:Container>
                                </Items>
                            </ext:FormPanel>--%>
                        </Items>
                    </ext:Container>
                </Items>
            </ext:Container>
        </div>
    </form>
</body>
</html>
