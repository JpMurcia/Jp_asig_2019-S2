using Ext.Net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PEPEPS.Models;
using System.Data;
using System.Xml;
using System.Xml.Xsl;

namespace PEPEPS.Views.Privates.Usuarios
{
    public partial class VerUsuarios : System.Web.UI.Page
    {
        PE_PERSONA Mdl_Persona = new PE_PERSONA();
        DataTable DT_Persona;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Usuario"].ToString().Equals(null))
                    X.Redirect("~/Views/Publics/Login.aspx");
                else
                {
                    if (!IsPostBack)
                    {
                        DT_Persona = Mdl_Persona.ConsultarUsuariosAll(Session["Usuario"].ToString());
                        Store_Usuarios.DataSource = DT_Persona;
                        Store_Usuarios.DataBind();
                    }
                }
            }
            catch
            {
                X.Redirect("~/Views/Publics/Login.aspx");
            }
        }

        protected void Btn_Ayuda_Click(object sender, DirectEventArgs e)
        {
            Notification.Show(new NotificationConfig
            {
                Title = "¿Cómo buscar?",
                AlignCfg = new NotificationAlignConfig
                {
                    ElementAnchor = AnchorPoint.Top,
                    TargetAnchor = AnchorPoint.Top,
                    OffsetY = 10
                },
                Width = 500,
                Height = 120,
                AutoScroll = true,
                Icon = Icon.Information,
                AutoHide = false,
                Html = String.Format("<b>Texto:</b> <b>=</b>(igual), <b>+</b>(comienza con), <b>-</b>(finaliza con), <b>*</b>(contiene), <b>!</b>(no contiene) <br/>" +
                "<b>Números:</b> <b>></b>, <b><</b>, <b>>=</b>, <b><=</b> o especifique un número igual <br/>" +
                "<b>Fecha:</b> <b>></b>, <b><</b>, <b>>=</b>, <b><=</b> o especifique una fecha igual <br/>")
            });
        }

        protected void ToExcel(object sender, EventArgs e)
        {
            string json = Hidden_Usuarios.Value.ToString();
            StoreSubmitDataEventArgs eSubmit = new StoreSubmitDataEventArgs(json, null);
            XmlNode xml = eSubmit.Xml;

            this.Response.Clear();
            this.Response.ContentType = "application/vnd.ms-excel";
            this.Response.AddHeader("Content-Disposition", "attachment; filename=Listado Usuarios.xls");

            XslCompiledTransform xtExcel = new XslCompiledTransform();

            xtExcel.Load(Server.MapPath("~/Views/Privates/Content/Archivos/General/Excel.xsl"));
            xtExcel.Transform(xml, null, this.Response.OutputStream);
            this.Response.End();
        }
    }
}