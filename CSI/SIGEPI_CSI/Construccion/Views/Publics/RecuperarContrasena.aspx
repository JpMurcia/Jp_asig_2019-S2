<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContrasena.aspx.cs" Inherits="PEPEPS.Views.Publics.RecuperarContrasena" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="description" content="Presentacion y evaluacion de proyectos de extension y proyeccion social - UDLA" />
    <meta name="keywords" lang="es" content="proyectos, extension, proyeccion, social, udla, uniamazonia, universidad de la amazonia, pepeps" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recuperar contraseña</title>
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
                    <h2>RECUPERAR CONTRASEÑA</h2>
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
                                ID="FormRecuperar"
                                Height="220"
                                Icon="Lock"
                                Width="350"
                                runat="server"
                                Title="Recuperación de contraseña"
                                Frame="true"
                                X="10"
                                Y="50"
                                BodyStyle="padding:10px 20px;"
                                DefaultAnchor="100%"
                                DefaultMsgTarget="side"
                                DefaultAllowBlank="false">
                                <Items>
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
                                        EmptyText="Ingrese su nueva contraseña">
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
                                <Buttons>
                                    <ext:Button ID="Btn_Recuperar" runat="server" Text="Actualizar" Icon="Accept">
                                         <DirectEvents>
                                            <Click OnEvent="Btn_Recuperar_Click" Before="return App.FormRecuperar.validate();">
                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                </Buttons>
                            </ext:FormPanel>
                              <ext:FormPanel
                                Height="50"
                                Width="350"
                                ID="FormPanel1"
                                runat="server"
                                PaddingSpec="0 20"
                                Frame="true">
                                <Items>
                                    <ext:Container runat="server">
                                        <Content>
                                            <p><a href='<%= Page.ResolveUrl("~/Views/Publics/Login.aspx")%>'>Iniciar sesión</a></p>
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
