<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Construccion.Views.Privates.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    
    <ext:Container runat="server">
        <Content>
        <div id="content">
            <div style="padding: 20px; text-align: center;">
                <img src='<%=Page.ResolveUrl("~/Views/Publics/Content/Images/logoudla.png") %>' width="100" />
                <div style="display: inline-block; text-align: center;">
                    <h2>SITEMA PARA LA GESTIO DE LOS PROYECTOS DE INVESTIGACION</h2>
                    <h2>Bienvenido/a</h2>
                </div>
            </div>
            <div style="padding: 20px; text-align: center;">
<%--                <img src='<%=Page.ResolveUrl("~/Views/Privates/Content/Images/calendario-mayo.png") %>' width="60%" style="border-radius:10px; border:2px solid #157fcc"/>--%><%--                <img src='<%=Page.ResolveUrl("~/Views/Privates/Content/Images/calendario-mayo.png") %>' width="60%" style="border-radius:10px; border:2px solid #157fcc"/>--%>
            </div>
        </div>
        </Content>
    </ext:Container>
</asp:Content>
