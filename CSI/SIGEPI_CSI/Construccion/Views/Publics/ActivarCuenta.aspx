<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivarCuenta.aspx.cs" Inherits="PEPEPS.Views.Usuarios.ActivarCuenta" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Register</title>
    <style type="text/css">
        #content {
            padding: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" Theme="Neptune" runat="server" />
        <div id="content">
            <div id="header" style="padding: 20px; text-align: center;">
                <img src='<%=Page.ResolveUrl("~/Views/Publics/Content/Images/logoudla.png") %>' width="100" />
                <div style="display: inline-block; text-align: center;">
                    <h2>PRESENTACIÓN DE PROYECTOS DE EXTENSIÓN Y/O PROYECCIÓN SOCIAL</h2>
                    <h3>Presione el siguiente enlace para activar su cuenta:
                    <ext:HyperlinkButton runat="server" Icon="Accept" Text="Activar" StyleSpec="display:inline-block;">
                        <DirectEvents>
                            <Click OnEvent="Btn_Activar_Click" />
                        </DirectEvents>
                    </ext:HyperlinkButton>
                    </h3>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
